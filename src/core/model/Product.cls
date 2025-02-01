Class core.model.Product Extends (%Library.SerialObject, %XML.Adaptor, %JSON.Adaptor)
{

Property Id As %Library.String(%JSONFIELDNAME = "id");

Property Title As %Library.String(%JSONFIELDNAME = "title");

Property Description As %Library.String(%JSONFIELDNAME = "description");

Property Price As %Library.Float(%JSONFIELDNAME = "price");

Property Thumbnail As %Library.String(%JSONFIELDNAME = "thumbnail");

Property SKU As %Library.String(%JSONFIELDNAME = "sku");

Property CreatedAt As %Library.String(%JSONFIELDNAME = "createdAt");

Property UpdatedAt As %Library.String(%JSONFIELDNAME = "updatedAt");

ClassMethod FromDynamicObject(pObject As %Library.DynamicObject) As erp.model.Product
{
	Set product = ##class(erp.model.Product).%New()
	Set product.Id = pObject.id
	Set product.Title = pObject.title
	Set product.Description = pObject.description
	Set product.Price = pObject.price
	Set product.Thumbnail = pObject.thumnail
	Set product.SKU = pObject.sku
	Set product.CreatedAt = pObject.createdAt
	Set product.UpdatedAt = pObject.updatedAt

	Return product
}

Storage Default
{
<Data name="ProductState">
<Value name="1">
<Value>Id</Value>
</Value>
<Value name="2">
<Value>Title</Value>
</Value>
<Value name="3">
<Value>Description</Value>
</Value>
<Value name="4">
<Value>Price</Value>
</Value>
<Value name="5">
<Value>Thumbnail</Value>
</Value>
<Value name="6">
<Value>SKU</Value>
</Value>
<Value name="7">
<Value>CreatedAt</Value>
</Value>
<Value name="8">
<Value>UpdatedAt</Value>
</Value>
</Data>
<State>ProductState</State>
<StreamLocation>^erp.model.ProductS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
