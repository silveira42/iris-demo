Class core.model.Stock Extends %Library.SerialObject
{

Property GUID As %Library.String(MAXLEN = "") [ InitialExpression = {##class(%SYSTEM.Util).CreateGUID()} ];

Property ProductId As %Library.String(MAXLEN = 50);

Property Quantity As %Library.Integer;

Storage Default
{
<Data name="StockState">
<Value name="1">
<Value>GUID</Value>
</Value>
<Value name="2">
<Value>ProductId</Value>
</Value>
<Value name="3">
<Value>Quantity</Value>
</Value>
</Data>
<State>StockState</State>
<StreamLocation>^core.model.StockS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
