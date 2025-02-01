Class erp.bo.product.create.Request Extends Ens.Request
{

Parameter RESPONSECLASSNAME = "erp.bo.product.create.Response";

Property Product As erp.model.Product;

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Product</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
