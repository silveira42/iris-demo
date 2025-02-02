Class core.bs.product.create.Request Extends core.bs.generic.Request
{

Property Body As %Library.String;

Parameter RESPONSECLASSNAME = "core.bs.product.create.Response";

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Body</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
