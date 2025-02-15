Class erp.bo.customer.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.SQL.OutboundAdapter";

Property Adapter As EnsLib.SQL.OutboundAdapter;

XData MessageMap
{
<MapItems>
	<MapItem MessageType="erp.bo.customer.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="erp.bo.customer.list.Request">
		<Method>List</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As erp.bo.customer.create.Request, Output pResponse As erp.bo.customer.create.Response) As %Library.Status
{
	Return ##class(erp.bo.customer.create.Method).Execute(##this, pRequest, .pResponse)
}

Method List(pRequest As erp.bo.customer.list.Request, Output pResponse As erp.bo.customer.list.Response) As %Library.Status
{
	Return ##class(erp.bo.customer.list.Method).Execute(##this, pRequest, .pResponse)
}

}
