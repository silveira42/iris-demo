Class erp.bp.order.create.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As erp.bp.order.create.Request, Output pResponse As erp.bp.order.create.Response) As %Library.Status
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
		Set originalOrder = pRequest.Order
		$$$ThrowOnError(##class(erp.dt.fromCore.Order).Transform(originalOrder, .erpOrder))
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set createdOrder = ..CreateOrder(erpOrder)
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		$$$ThrowOnError(##class(erp.dt.toCore.Order).Transform(createdOrder, .coreOrder))
		Set pResponse.Order = coreOrder
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method CreateOrder(pOrder As erp.model.Order) As erp.model.Order
{
	Set erpOrder = pOrder

	Set erpCreateReq = ##class(erp.bo.order.create.Request).%New()

	Set erpCreateReq.Order = erpOrder

	$$$ThrowOnError(..SendRequestSync("Erp Order", erpCreateReq, .erpCreateResp))
	#Dim erpCreateResp As erp.bo.order.create.Response

	Set erpCreatedOrder = erpCreateResp.Order

	Return erpCreatedOrder
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
