Class core.bs.product.list.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As core.bs.product.list.Request, Output pResponse As core.bs.product.list.Response) As %Library.Status
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
		Set bpRequest = ##class(erp.bp.product.list.Request).%New()

		Set bpRequest.Limit = pRequest.Limit
		Set bpRequest.Skip = pRequest.Skip

		$$$ThrowOnError(..SendRequestSync("Erp Product List", bpRequest, .bpResponse))
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
		Set responseBody = {}
		Set responseBody.products = ##class(core.model.Product).ListToDynamicArray(bpResponse.Products)
		Set responseBody.total = bpResponse.Products.Count()

		Set pResponse.Body = responseBody.%ToJSON()
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
