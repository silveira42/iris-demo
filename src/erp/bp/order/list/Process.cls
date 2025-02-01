Class erp.bp.order.list.Process Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As erp.bp.order.list.Request, Output pResponse As erp.bp.order.list.Response) As %Library.Status
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
		Set listedOrders = ..ListOrders()
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Try
	{
		Set coreOrders = ##class(%Library.ListOfObjects).%New()
		For i=1:1:listedOrders.Count()
		{
			$$$ThrowOnError(##class(erp.dt.fromCore.Order).Transform(listedOrders.GetAt(i), .coreOrder))
			Do coreOrders.Insert(coreOrder)
		}
		Set pResponse.Orders = coreOrders
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

Method ListOrders() As %Library.ListOfObjects
{
	Set erpListReq = ##class(erp.bo.order.list.Request).%New()

	$$$ThrowOnError(..SendRequestSync("Erp Order", erpListReq, .erpListResp))
	#Dim erpListResp As erp.bo.order.list.Response

	Set erpListedOrder = erpListResp.Orders

	Return erpListedOrder
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
