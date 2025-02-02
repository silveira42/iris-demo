Class core.bs.product.create.Service Extends Ens.BusinessService
{

Method OnProcessInput(pRequest As core.bs.product.create.Request, Output pResponse As core.bs.product.create.Response) As %Library.Status
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
		Set bpRequest = ##class(erp.bp.product.create.Request).%New()
		Set coreProduct = ##class(core.model.Product).FromString(pRequest.Body)
		Set bpRequest.Product = coreProduct

		$$$ThrowOnError(..SendRequestSync("Erp Product Create", bpRequest, .bpResponse))
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
		Set pResponse.Body = bpResponse.Product.ToString()
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
