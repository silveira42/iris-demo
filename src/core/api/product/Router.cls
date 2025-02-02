Class core.api.product.Router Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

XData UrlMap
{
<Routes>
	<Route Url="/" Method="POST" Call="CreateProduct"/>
	<Route Url="/" Method="GET" Call="ListProducts"/>
</Routes>
}

ClassMethod CreateProduct() As %Library.Status
{
	Try
	{
		#Dim %request As %CSP.Request
		#Dim %response As %CSP.Response
		Set %response.ContentType = "application/json"

		#Dim businessService As Ens.BusinessService

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Erp Product Create", .businessService))

		Set body = ""
		While ('%request.Content.AtEnd)
		{
			Set body = body _ %request.Content.Read()
		}

		Set bsRequest = ##class(core.bs.product.create.Request).%New()

		Set bsRequest.Body = body

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As core.bs.product.create.Response

		Set %response.Status = bsResponse.Status
		Do %response.SetHeader("Session-Id", bsResponse.SessionId)
		Write bsResponse.Body
	}
	Catch (exception)
	{
		Set errorMessage = exception.DisplayString()

		Set %response.Status = ..#HTTP500INTERNALSERVERERROR
		Set respBody = ##class(%Library.DynamicObject).%New()
		Set respBody.message = "Unknow error: " _ errorMessage
		Write respBody.%ToJSON()
	}

	Return $$$OK
}

ClassMethod ListProducts() As %Library.Status
{
	Try
	{
		#Dim %request As %CSP.Request
		#Dim %response As %CSP.Response
		Set %response.ContentType = "application/json"

		#Dim businessService As Ens.BusinessService

		$$$ThrowOnError(##class(Ens.Director).CreateBusinessService("REST Erp Product List", .businessService))

		Set bsRequest = ##class(core.bs.product.list.Request).%New()

		$$$ThrowOnError(businessService.ProcessInput(bsRequest, .bsResponse))
		#Dim bsResponse As core.bs.product.list.Response

		Set %response.Status = bsResponse.Status
		Do %response.SetHeader("Session-Id", bsResponse.SessionId)
		Write bsResponse.Body
	}
	Catch (exception)
	{
		Set errorMessage = exception.DisplayString()

		Set %response.Status = ..#HTTP500INTERNALSERVERERROR
		Set respBody = ##class(%Library.DynamicObject).%New()
		Set respBody.message = "Unknow error: " _ errorMessage
		Write respBody.%ToJSON()
	}

	Return $$$OK
}

ClassMethod OnHandleCorsRequest(url As %Library.String) As %Library.Status
{
	Try
	{
		#Dim exception As %Exception.AbstractException = ""
		#Dim %request As %CSP.Request                  = %request
		#Dim %response As %CSP.Response                = %response
		#Dim origin As %Library.String                         = $GET(%request.CgiEnvs("HTTP_ORIGIN"))
		#Dim headers As %Library.String                        = ""
		#Dim method As %Library.String                         = ""

		If (origin '="")
		{
			Do %response.SetHeaderIfEmpty("Access-Control-Allow-Origin", "*")
			Do %response.SetHeaderIfEmpty("Access-Control-Allow-Credentials", "true")
		}

		// Allow requested headers
		Set headers=$GET(%request.CgiEnvs("HTTP_ACCESS_CONTROL_REQUEST_HEADERS"))
		Do %response.SetHeaderIfEmpty("Access-Control-Allow-Headers",headers)

		// Allow requested method
		Set method=$GET(%request.CgiEnvs("HTTP_ACCESS_CONTROL_REQUEST_METHOD"))
		Do %response.SetHeaderIfEmpty("Access-Control-Allow-Methods",method)
	}
	Catch (exception)
	{
		Return exception.AsStatus()
	}

	Return $$$OK
}

}
