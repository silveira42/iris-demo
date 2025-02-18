Class core.model.Order Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String(%JSONFIELDNAME = "id", MAXLEN = "");

Property Customer As %Library.String(%JSONFIELDNAME = "customer", MAXLEN = "");

Property DeliveryCEP As %Library.String(%JSONFIELDNAME = "deliveryCEP", MAXLEN = "");

Property ProductId As %Library.String(%JSONFIELDNAME = "productId", MAXLEN = "");

Property Quantity As %Library.Integer(%JSONFIELDNAME = "quantity");

Property Total As %Library.Float(%JSONFIELDNAME = "total");

Property CreatedAt As %Library.String(%JSONFIELDNAME = "createdAt", MAXLEN = "");

ClassMethod FromDynamicObject(pObject As %Library.DynamicObject) As erp.model.Order
{
	Set order = ##class(erp.model.Order).%New()
	Set order.Id = pObject.id
	Set order.Customer = pObject.customer
	Set order.DeliveryCEP = pObject.deliveryCEP
	Set order.ProductId = pObject.productId
	Set order.Quantity = pObject.quantity
	Set order.Total = pObject.total
	Set order.CreatedAt = pObject.createdAt

	Return order
}

ClassMethod FromString(pString As %Library.String) As erp.model.Order
{
	Set order = ##class(erp.model.Order).%New()
	Set status = order.%JSONImport(pString)

	Return order
}

Method ToString() As %Library.String
{
	Do ##this.%JSONExportToString(.string)

	Return string
}

ClassMethod ListToString(pList As %Library.ListOfObjects) As %Library.String
{
	Set list = pList

	Set fullString = "["

	For i=1:1:list.Count()
	{
		Set order = list.GetAt(i)
		Set status = order.%JSONExportToString(.string)
		Set fullString = fullString _ string _ ", "
	}

	Set fullString = $EXTRACT(fullString, 1, $LENGTH(fullString)-2) _ "]"

	Return fullString
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
</Data>
<State>OrderState</State>
<StreamLocation>^erp.model.OrderS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
