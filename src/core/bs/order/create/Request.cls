Class core.bs.order.create.Request Extends core.bs.generic.Request
{

Property Body As %Library.String;

Parameter RESPONSECLASSNAME = "core.bs.order.create.Response";

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
