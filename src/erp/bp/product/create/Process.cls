Class erp.bp.product.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As erp.bp.product.create.Request, Output pResponse As erp.bp.product.create.Response) As %Library.Status
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
		Set originalProduct = pRequest.Product
		$$$ThrowOnError(##class(erp.dt.fromCore.Product).Transform(originalProduct, .erpProduct))
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set createdProduct = ..CreateProduct(erpProduct)
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		$$$ThrowOnError(##class(erp.dt.toCore.Product).Transform(createdProduct, .coreProduct))
		Set pResponse.Product = coreProduct
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method CreateProduct(pProduct As erp.model.Product) As erp.model.Product
{
	Set erpProduct = pProduct

	Set erpCreateReq = ##class(erp.bo.product.create.Request).%New()

	Set erpCreateReq.Product = erpProduct

	$$$ThrowOnError(..SendRequestSync("Erp Product", erpCreateReq, .erpCreateResp))
	#Dim erpCreateResp As erp.bo.product.create.Response

	Set erpCreatedProduct = erpCreateResp.Product

	Return erpCreatedProduct
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
