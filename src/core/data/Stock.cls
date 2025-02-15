Class core.data.Stock Extends (%Library.Persistent, core.model.Stock)
{

Storage Default
{
<Data name="StockDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GUID</Value>
</Value>
<Value name="3">
<Value>ProductId</Value>
</Value>
<Value name="4">
<Value>Quantity</Value>
</Value>
</Data>
<DataLocation>^core.data.StockD</DataLocation>
<DefaultData>StockDefaultData</DefaultData>
<IdLocation>^core.data.StockD</IdLocation>
<IndexLocation>^core.data.StockI</IndexLocation>
<StreamLocation>^core.data.StockS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
