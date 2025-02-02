Include Ensemble

Class erp.bo.product.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.product.Operation, pRequest As erp.bo.product.list.Request, Output pResponse As erp.bo.product.list.Response) As %Library.Status
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

    Set url = pHost.BaseUrl _ "/products?limit=" _ pRequest.Limit _ "&skip=" _ pRequest.Skip

    // Enviar request REST
    Try
    {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "GET", httpRequest, , "", url))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

    // Validar retorno
    If (httpResponse.StatusCode '= 200)
    {
        Return $$$ERROR($$$GeneralError, "Erro ao listar produtos")
    }

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at list method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

    Set iterator = dynamicResponse.%GetIterator()
    While iterator.%GetNext(.key, .value)
    {
        Set product = ##class(erp.model.Product).FromDynamicObject(value)

        Do pResponse.Products.Insert(product)
    }

    Return $$$OK
}

}
