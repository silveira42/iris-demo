Class erp.bp.order.list.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bp.order.list.Response";

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Order</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
