Class core.bs.product.list.Request Extends core.bs.generic.Request
{

Parameter RESPONSECLASSNAME = "core.bs.product.list.Response";

Property Limit As %Library.Integer;

Property Skip As %Library.Integer;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Limit</Value>
</Value>
<Value name="2">
<Value>Skip</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
