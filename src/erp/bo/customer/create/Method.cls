Include (%occODBC, EnsSQLTypes, Ensemble)

Class erp.bo.customer.create.Method [ Abstract ]
{

ClassMethod Execute(pHost As erp.bo.customer.Operation, pRequest As erp.bo.customer.create.Request, Output pResponse As erp.bo.customer.create.Response) As %Library.Status
{
	Try
	{
		Do pRequest.NewResponse(.pResponse)
		Set params = 2
		Set params(1)            = pRequest.Customer.Name
		Set params(1, "IOType")  = $$$SQLPARAMINPUT
		Set params(1, "SqlType") = $$$SqlVarchar
		Set params(2)            = pRequest.Customer.DeliveryCEP
		Set params(2, "IOType")  = $$$SQLPARAMINPUT
		Set params(2, "SqlType") = $$$SqlVarchar

		#; Set query = "SELECT * FROM insert_customer(?, ?) AS (id UUID, created_at TIMESTAMP)"
		Set query = "CALL InsertCustomer(?, ?);"

		$$$ThrowOnError(pHost.Adapter.ExecuteProcedureParmArray(.rs, .out, query, "ii", .params))

		#; Set result = rs.GetAt(1)

		#; If (result.Next())
		#; {
		#; 	Set id = result.Get("id")
		#; 	Set createdAt = result.Get("created_at")
		#; }
		#; Else
		#; {
		#; 	Throw ##class(%Exception.General).CreateFromStatus("Erro ao obter resposta da Query")
		#; }

		#; Set customer = ##class(erp.model.Customer).%New()
		#; Set customer.Id = id
		#; Set customer.Name = pRequest.Customer.Name
		#; Set customer.DeliveryCEP = pRequest.Customer.DeliveryCEP
		#; Set customer.CreatedAt = createdAt

		#; Set pResponse.Customer = customer
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}


    Return $$$OK
}

}
