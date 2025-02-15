Class core.data.Customer Extends (%Library.Persistent, core.model.Customer)
{

Storage Default
{
<Data name="CustomerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>DeliveryCEP</Value>
</Value>
<Value name="4">
<Value>CreatedAt</Value>
</Value>
<Value name="5">
<Value>UpdatedAt</Value>
</Value>
<Value name="6">
<Value>DeletedAt</Value>
</Value>
</Data>
<DataLocation>^core.data.CustomerD</DataLocation>
<DefaultData>CustomerDefaultData</DefaultData>
<IdLocation>^core.data.CustomerD</IdLocation>
<IndexLocation>^core.data.CustomerI</IndexLocation>
<StreamLocation>^core.data.CustomerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
