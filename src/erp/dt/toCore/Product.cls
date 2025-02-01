Class erp.dt.toCore.Product Extends Ens.DataTransform
{

ClassMethod Transform(pSource As erp.model.Product, Output pTarget As core.model.Product) As %Library.Status
{
	Set source = pSource

	Set target = ##class(core.model.Product).%New()
	Set target.Id = source.Id
	Set target.Title = source.Title
	Set target.Description = source.Description
	Set target.Price = source.Price
	Set target.Thumbnail = source.Thumbnail
	Set target.SKU = source.SKU
	Set target.CreatedAt = source.CreatedAt
	Set target.UpdatedAt = source.UpdatedAt

	Set pTarget = target

	Return $$$OK
}

}
