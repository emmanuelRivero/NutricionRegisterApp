<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="database.databaseValidate"%>
<%
	System.out.println("cuenta test");
	boolean test1 = databaseValidate.cuentaExist("1");
	boolean test2 = databaseValidate.cuentaExist("14184318");
	
	System.out.println("cuenta results");
	System.out.println(test1);
	System.out.println(test2);
	%>
	
	
<script type="text/javascript">
$(document).ready(function() {
	  var availableTags = [
		  <%Iterator<Alumno> alumnoIterator = dataAlumnos.iterator(); 
			while (alumnoIterator.hasNext()){
				Alumno current = alumnoIterator.next();
				if (alumnoIterator.hasNext()){
					%>"<%=current.getCuenta()%>",<%
				}else{
					%>"<%=current.getCuenta()%>"<%
				}
			}%>
	  ];

	  $('#nuevoModal').on('shown.bs.modal', function() {

	    $(".autocomplete").autocomplete({
	      source: availableTags
	    });
	  })
	})
</script>
</body>
</html>