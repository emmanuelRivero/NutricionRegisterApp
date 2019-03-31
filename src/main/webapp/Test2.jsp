<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/ui-autocomplete.css">
<link rel="stylesheet" href="css/all.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<i class="fa fa-download" onclick="window.open('/NutricionRegisterApp/autoCreated/registro-3.pdf')"></i> Download
<button class="btn" style="width:100%" onclick="download('registro-3.pdf')"><i class="fa fa-download" ></i> Download</button>
<a href="https://gerrit-releases.storage.googleapis.com/gerrit-2.16.7.war" class="btn btn-primary">Download</a>
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function download(file)
{
	var hostname = location.hostname;
	window.location = `${pageContext.request.contextPath/autoCreated}/${file}`;
}
</script>
</html>