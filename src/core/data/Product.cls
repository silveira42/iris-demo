Class core.data.Product Extends %Library.Persistent
{

Property Name As %Library.String;

Property Description As %Library.String;

Property Price As %Library.Numeric;

Property Stock As %Library.Integer;

Property CreatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property UpdatedAt As %Library.TimeStamp [ InitialExpression = {$ZDATETIME($HOROLOG,3)} ];

Property DeletedAt As %Library.TimeStamp;

Property Thumbnail As %Library.String;

Storage Default
{
<Data name="ProductDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
<Value name="4">
<Value>Price</Value>
</Value>
<Value name="5">
<Value>Stock</Value>
</Value>
<Value name="6">
<Value>CreatedAt</Value>
</Value>
<Value name="7">
<Value>UpdatedAt</Value>
</Value>
<Value name="8">
<Value>DeletedAt</Value>
</Value>
<Value name="9">
<Value>Thumbnail</Value>
</Value>
</Data>
<DataLocation>^core.data.ProductD</DataLocation>
<DefaultData>ProductDefaultData</DefaultData>
<IdLocation>^core.data.ProductD</IdLocation>
<IndexLocation>^core.data.ProductI</IndexLocation>
<StreamLocation>^core.data.ProductS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
