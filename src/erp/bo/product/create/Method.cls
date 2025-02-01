Include Ensemble

Class erp.bo.product.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.product.Operation, pRequest As erp.bo.product.create.Request, Output pResponse As erp.bo.product.create.Response) As %Library.Status
{
    Try
    {
        $$$ThrowOnError(pRequest.NewResponse(.pResponse))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

    // Montar request REST
    Set httpRequest = ##class(%Net.HttpRequest).%New()

    Set httpRequest.ContentCharset = "utf-8"
    Set httpRequest.ContentType = "application/json"
	Do httpRequest.SetHeader("Api-Token", pHost.Token)

    Try
    {
        $$$ThrowOnError(pRequest.Product.%JSONExportToString(.httpRequestBody))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

	Do httpRequest.EntityBody.Write(httpRequestBody)

	Set url = pHost.BaseUrl _ "/products"

    // Enviar request REST
    Try
    {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest, , .httpRequestBody, url))
    }
    Catch (exception)
    {
		If (httpResponse)
		{
			Return ##class(%Exception.General).%New(httpResponse.Data.Read(), httpResponse.StatusCode).AsStatus()
		}

        Return exception.AsStatus()
    }

    // Validar retorno
    If (httpResponse.StatusCode '= 201)
    {
        Return $$$ERROR($$$GeneralError, "Erro ao criar produto")
    }

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at create method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set product = ##class(erp.model.Product).FromDynamicObject(dynamicResponse)

	Set pResponse.Product = product

    Return $$$OK
}

}
