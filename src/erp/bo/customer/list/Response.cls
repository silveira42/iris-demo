Class erp.bo.customer.list.Response Extends Ens.Response
{

Property Customers As list Of erp.model.Customer;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>customers</Value>
</Value>
<Value name="2">
<Value>Customers</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
