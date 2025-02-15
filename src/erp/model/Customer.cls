Class erp.model.Customer Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String(%JSONFIELDNAME = "id", MAXLEN = "");

Property Name As %Library.String(%JSONFIELDNAME = "name", MAXLEN = "");

Property DeliveryCEP As %Library.String(%JSONFIELDNAME = "deliveryCEP", MAXLEN = "");

Property CreatedAt As %Library.String(%JSONFIELDNAME = "createdAt", MAXLEN = "");

ClassMethod FromDynamicObject(pObject As %Library.DynamicObject) As erp.model.Customer
{
	Set customer = ##class(erp.model.Customer).%New()
	Set customer.Id = pObject.id
	Set customer.Name = pObject.name
	Set customer.DeliveryCEP = pObject.deliveryCEP
	Set customer.CreatedAt = pObject.createdAt

	Return customer
}

Storage Default
{
<Data name="OrderState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>Customer</Value>
</Value>
<Value name="3">
<Value>DeliveryCEP</Value>
</Value>
<Value name="4">
<Value>ProductId</Value>
</Value>
<Value name="5">
<Value>Quantity</Value>
</Value>
<Value name="6">
<Value>Total</Value>
</Value>
<Value name="7">
<Value>CreatedAt</Value>
</Value>
<Value name="8">
<Value>Name</Value>
</Value>
</Data>
<State>OrderState</State>
<StreamLocation>^erp.model.OrderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
