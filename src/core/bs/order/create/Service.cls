Class core.bs.order.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As core.bs.order.create.Request, Output pResponse As core.bs.order.create.Response) As %Library.Status
{
	Try
	{
		Set respBody = ##class(%Library.DynamicObject).%New()
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))
		Set pResponse.SessionId = ..%SessionId
	}
	Catch (exception)
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP500InternalServerError
		Set respBody.message = "Error creating response"
		Set pResponse.Body = respBody.%ToJSON()

		Return $$$OK
	}

	Try
	{
		Set bpRequest = ##class(erp.bp.order.create.Request).%New()
		Set coreOrder = ##class(core.model.Order).FromString(pRequest.Body)
		Set bpRequest.Order = coreOrder

		$$$ThrowOnError(..SendRequestSync("Erp Order Create", bpRequest, .bpResponse))
	}
	Catch (exception)
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP500InternalServerError
		Set respBody.message = "Error processing request: " _ exception.Name
		Set pResponse.Body = respBody.%ToJSON()

		Return $$$OK
	}

	Try
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP200OK
		Set pResponse.Body = bpResponse.Order.ToString()
	}
	Catch (exception)
	{
		Set pResponse.Status = ##class(%CSP.REST).#HTTP500InternalServerError
		Set respBody.message = "Error receiving response: " _ exception.Name
		Set pResponse.Body = respBody.%ToJSON()

		Return $$$OK
	}

	Return $$$OK
}

}
