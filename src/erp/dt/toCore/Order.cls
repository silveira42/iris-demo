Class erp.dt.toCore.Order Extends Ens.DataTransform
{

ClassMethod Transform(pSource As erp.model.Order, Output pTarget As core.model.Order) As %Library.Status
{
	Set source = pSource

	Set target = ##class(core.model.Order).%New()
	Set target.Id = source.Id
	Set target.Customer = source.Customer
	Set target.DeliveryCEP = source.DeliveryCEP
	Set target.ProductId = source.ProductId
	Set target.Quantity = source.Quantity
	Set target.Total = source.Total
	Set target.CreatedAt = source.CreatedAt


	Set pTarget = target

	Return $$$OK
}

}
