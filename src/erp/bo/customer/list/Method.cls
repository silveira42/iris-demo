Include Ensemble

Class erp.bo.customer.list.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.customer.Operation, pRequest As erp.bo.customer.list.Request, Output pResponse As erp.bo.customer.list.Response) As %Library.Status
{
    Try
    {
        $$$ThrowOnError(pRequest.NewResponse(.pResponse))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

	Set query = "SELECT ""createdAt"" FROM ""Customers"""

    // Enviar request JDBC
    Try
    {
        $$$ThrowOnError(pHost.Adapter.ExecuteQuery(.tRS, query))
    }
    Catch (exception)
    {
        Return exception.AsStatus()
    }

	Try
	{

		If ($ISOBJECT(tRS))
		{
			$$$LOGINFO("Query executada com sucesso")
			//Pega cada linha
			While (tRS.Next(.status))
			{
				$$$ThrowOnError(status)
				$$$LOGINFO("Iterando sobre os resultados")
				Set customer = ##class(erp.model.Customer).%New()

				Set customer.Id = tRS.Get("id")
				Set customer.Name = tRS.Get("name")
				Set customer.DeliveryCEP = tRS.Get("deliveryCEP")
				Set customer.CreatedAt = tRS.Get("createdAt")

				Do pResponse.Customers.Insert(customer)

				Do customer.%JSONExportToString(.json)
				$$$LOGINFO(json)
			}
			$$$ThrowOnError(status)
		}
		Else
		{
			Throw ##class(%Exception.General).%New("Erro ao obter resposta da Query")
		}
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

    Return $$$OK
}

}
