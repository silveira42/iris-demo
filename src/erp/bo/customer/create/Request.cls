Class erp.bo.customer.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bo.customer.create.Response";

Property Customer As erp.model.Customer;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Customer</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
