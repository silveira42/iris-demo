Class erp.bp.product.list.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As erp.bp.product.list.Request, Output pResponse As erp.bp.product.list.Response) As %Library.Status
{
	Try
	{
		$$$ThrowOnError(pRequest.NewResponse(.pResponse))
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set limit = pRequest.Limit
		Set skip = pRequest.Skip

		Set listedProducts = ..ListProducts(limit, skip)
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set coreProducts = ##class(%Library.ListOfObjects).%New()
		For i=1:1:listedProducts.Count()
		{
			$$$ThrowOnError(##class(erp.dt.fromCore.Product).Transform(listedProducts.GetAt(i), .coreProduct))
			Do coreProducts.Insert(coreProduct)
		}
		Set pResponse.Products = coreProducts
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method ListProducts(pLimit As %Library.Integer, pSkip As %Library.Integer) As %Library.ListOfObjects
{
	Set erpListReq = ##class(erp.bo.product.list.Request).%New()

	Set limit = pLimit
	Set skip = pSkip

	Set erpListReq.Limit = limit
	Set erpListReq.Skip = skip

	$$$ThrowOnError(..SendRequestSync("Erp Product", erpListReq, .erpListResp))
	#Dim erpListResp As erp.bo.product.list.Response

	Set erpListedProduct = erpListResp.Products

	Return erpListedProduct
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
