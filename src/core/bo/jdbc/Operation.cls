Class core.bo.jdbc.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

Parameter INVOCATION = "Queue";

Property ContentType As %Library.String [ InitialExpression = "application/json; charset=UTF-8" ];

Parameter SETTINGS = "ContentType:Custom";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="core.bo.jdbc.executeQuery.Request">
		<Method>ExecuteQuery</Method>
	</MapItem>
	<MapItem MessageType="core.bo.jdbc.executeUpdateQuery.Request">
		<Method>ExecuteInsertQuery</Method>
	</MapItem>
</MapItems>
}

Method ExecuteQuery(pRequest As core.bo.jdbc.executeQuery.Request, pResponse As core.bo.jdbc.executeQuery.Response) As %Library.Status
{
    Set pResponse = ##class(core.bo.jdbc.executeQuery.Response).%New()

    Try
    {
        $$$ThrowOnError(..Adapter.ExecuteQuery(.tRS, pRequest.Query))

        Set results = []

        If ($ISOBJECT(tRS))
        {
            //Pega cada linha
            While (tRS.Next(.status))
            {
				$$$ThrowOnError(status)

                Set line = {}

                //Pega cada coluna
                For i=1 : 1 : tRS.ColCountGet()
                {
                    Set columnName = tRS.GetColumnName(i)

                    Do line.%Set(columnName, tRS.Get(columnName))
                }

                Do results.%Push(line)
            }
			$$$ThrowOnError(status)
        }
        Else
        {
            Throw ##class(%Exception.General).%New("Erro ao executar a query")
        }

        If (results.%Size() = 0)
        {
            Set pResponse.Status = 404
        }
        Else
        {
            Set pResponse.Status = 200
        }

        Set pResponse.Body = results.%ToJSON()

    }
    Catch(tException)
    {
        Set pResponse.Status = 500

		Set pResponse.Body = tException.Code _ " " _ tException.Name _ " " _ tException.Location _ " " _ tException.Data _ " " _ $ZERROR
    }

    Return $$$OK
}

Method ExecuteInsertQuery(pRequest As core.bo.jdbc.executeUpdateQuery.Request, pResponse As core.bo.jdbc.executeUpdateQuery.Response) As %Library.Status
{
    Set pResponse = ##class(core.bo.jdbc.executeUpdateQuery.Response).%New()

    Try
    {
        $$$ThrowOnError(..Adapter.ExecuteUpdate(.tRS, pRequest.Query))

        Set pResponse.Status = 200
        Set pResponse.Body = "Query executada com sucesso!"

    }
    Catch(tException)
    {
        Set pResponse.Status = 500

		Set pResponse.Body = tException.Code _ " " _ tException.Name _ " " _ tException.Location _ " " _ tException.Data _ " " _ $ZERROR

    }

    Return $$$OK
}

}
