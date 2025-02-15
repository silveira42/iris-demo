Class core.data.Order Extends (%Library.Persistent, core.model.Order)
{

Storage Default
{
<Data name="OrderDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Id</Value>
</Value>
<Value name="3">
<Value>Customer</Value>
</Value>
<Value name="4">
<Value>DeliveryCEP</Value>
</Value>
<Value name="5">
<Value>ProductId</Value>
</Value>
<Value name="6">
<Value>Quantity</Value>
</Value>
<Value name="7">
<Value>Total</Value>
</Value>
<Value name="8">
<Value>CreatedAt</Value>
</Value>
</Data>
<DataLocation>^core.data.OrderD</DataLocation>
<DefaultData>OrderDefaultData</DefaultData>
<IdLocation>^core.data.OrderD</IdLocation>
<IndexLocation>^core.data.OrderI</IndexLocation>
<StreamLocation>^core.data.OrderS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
