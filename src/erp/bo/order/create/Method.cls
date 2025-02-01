Include Ensemble

Class erp.bo.order.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.order.Operation, pRequest As erp.bo.order.create.Request, Output pResponse As erp.bo.order.create.Response) As %Library.Status
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
        $$$ThrowOnError(pRequest.Order.%JSONExportToString(.httpRequestBody))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

	Do httpRequest.EntityBody.Write(httpRequestBody)

	Set url = pHost.BaseUrl _ "/orders"

    // Enviar request REST
    Try
    {
        $$$ThrowOnError(pHost.Adapter.SendFormDataArray(.httpResponse, "POST", httpRequest, , httpRequestBody, url))
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
        Return $$$ERROR($$$GeneralError, "Erro ao criar pedido")
    }

    Try {
        Set dynamicResponse = ##class(%Library.DynamicObject).%FromJSON(httpResponse.Data)
    } Catch(exception) {
        $$$LOGINFO(httpResponse.Data)
        $$$LOGERROR("Error reading response at create method: " _ exception.DisplayString())
        Return exception.AsStatus()
    }

	Set order = ##class(erp.model.Order).FromDynamicObject(dynamicResponse)

	Set pResponse.Order = order

    Return $$$OK
}

}
