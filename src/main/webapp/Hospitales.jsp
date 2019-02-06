<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Hospitales</h2>
<%@page import="database.*" %>
<%@page import="java.sql.*" %>
	<% ResultSet nombre;
	nombre = databaseConsult.getData();
	while  (nombre.next())
	out.print(nombre.getString(1));
	%>

hospitales


</body>
</html>