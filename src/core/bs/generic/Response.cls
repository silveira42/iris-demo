Class core.bs.generic.Response Extends Ens.Response
{

Property Status As %Library.String;

Property Body As %Library.String;

Property SessionId As %Library.String;

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
<Value name="2">
<Value>Body</Value>
</Value>
<Value name="3">
<Value>SessionId</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
