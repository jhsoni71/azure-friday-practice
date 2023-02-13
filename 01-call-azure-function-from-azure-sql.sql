declare @url nvarchar(4000) = N'https://echo-function.azurewebsites.net/api/echoobject?orderid=39043';
declare @headers nvarchar(4000) = N'{"header1":"value_a", "header2":"value2", "header1":"value_b"}'
declare @payload nvarchar(max) = N'{"some":{"data":"here"}}'
declare @ret int, @response nvarchar(max);

exec @ret = sys.sp_invoke_external_rest_endpoint 
	@url = @url,
	@method = 'GET',
	@headers = @headers,
	@payload = @payload,
	@response = @response output;
	
select @ret as ReturnCode, @response as Response;