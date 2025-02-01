Class erp.bp.order.list.Response Extends Ens.Response
{

Property Orders As list Of core.model.Order;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Orders</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
