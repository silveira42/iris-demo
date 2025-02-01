Class erp.bo.order.list.Response Extends Ens.Response
{

Property Orders As list Of erp.model.Order;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>orders</Value>
</Value>
<Value name="2">
<Value>Orders</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
