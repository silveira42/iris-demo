Include Ensemble

Class erp.bo.order.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.order.Operation, pRequest As erp.bo.order.list.Request, Output pResponse As erp.bo.order.list.Response) As %Library.Status
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

    Set url = pHost.BaseUrl _ "/orders"

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
        Set order = ##class(erp.model.Order).FromDynamicObject(value)

        Do pResponse.Orders.Insert(order)
    }

    Return $$$OK
}

}
