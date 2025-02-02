Class erp.bo.product.list.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bo.product.list.Response";

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
