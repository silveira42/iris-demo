Class erp.bo.product.Operation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Property Token As %Library.String;

Property BaseUrl As %Library.String;

Parameter SETTINGS = "BaseUrl:API,Token:API";

XData MessageMap
{
<MapItems>
	<MapItem MessageType="erp.bo.product.create.Request">
		<Method>Create</Method>
	</MapItem>
	<MapItem MessageType="erp.bo.product.list.Request">
		<Method>List</Method>
	</MapItem>
</MapItems>
}

Method Create(pRequest As erp.bo.product.create.Request, Output pResponse As erp.bo.product.create.Response) As %Library.Status
{
	Return ##class(erp.bo.product.create.Method).Execute(##this, pRequest, .pResponse)
}

Method List(pRequest As erp.bo.product.list.Request, Output pResponse As erp.bo.product.list.Response) As %Library.Status
{
	Return ##class(erp.bo.product.list.Method).Execute(##this, pRequest, .pResponse)
}

}
