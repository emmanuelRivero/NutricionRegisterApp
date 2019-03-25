<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<i class="fa fa-download" onclick="window.open('/NutricionRegisterApp/autoCreated/registro-3.pdf')"></i> Download
<button class="btn" style="width:100%" onclick="download('registro-3.pdf')"><i class="fa fa-download" ></i> Download</button>

<script type="text/javascript">
function download(file)
{
	var hostname = location.hostname;
	window.location = `${pageContext.request.contextPath/autoCreated}/${file}`;
}
</script>
</html>