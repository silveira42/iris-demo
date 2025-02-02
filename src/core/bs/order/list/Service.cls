Class core.bs.order.list.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As core.bs.order.list.Request, Output pResponse As core.bs.order.list.Response) As %Library.Status
{
	Try
	{
		Set respBody = ##class(%Library.DynamicObject).%New()
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))
		Set pResponse.SessionId = ..%SessionId
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set bpRequest = ##class(erp.bp.order.list.Request).%New()

		$$$ThrowOnError(..SendRequestSync("Erp Order List", bpRequest, .bpResponse))
	}
	Catch (exception)
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP500InternalServerError
		Set respBody.message = "Error processing request: " _ exception.DisplayString()
		Set pResponse.Body = respBody.%ToJSON()

		Return $$$OK
	}

	Try
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP200OK
		Set pResponse.Body = ##class(core.model.Order).ListToString(bpResponse.Orders)
	}
	Catch (exception)
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP500InternalServerError
		Set respBody.message = "Error receiving response: " _ exception.DisplayString()
		Set pResponse.Body = respBody.%ToJSON()

		Return $$$OK
	}

	Return $$$OK
}

}
