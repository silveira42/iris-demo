Class erp.bo.order.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Property Token As %Library.String;

Property BaseUrl As %Library.String;

Parameter SETTINGS = "BaseUrl:API,Token:API";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="erp.bo.order.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="erp.bo.order.list.Request">
		<Method>List</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As erp.bo.order.create.Request, Output pResponse As erp.bo.order.create.Response) As %Library.Status
{
	Return ##class(erp.bo.order.create.Method).Execute(##this, pRequest, .pResponse)
}

Method List(pRequest As erp.bo.order.list.Request, Output pResponse As erp.bo.order.list.Response) As %Library.Status
{
	Return ##class(erp.bo.order.list.Method).Execute(##this, pRequest, .pResponse)
}

}
