<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.io.IOException" %>
<%@page import="com.itextpdf.text.DocumentException" %>
<%@page import="fileGenerator.*" %>
<%@page import="database.databaseQuery" %>
<%@page import="models.Registro" %>
<%@page import="java.util.ArrayList" %>
<%

	String currentPath = request.getSession().getServletContext().getRealPath("/");
	String pathHTMLTempleate = currentPath + "autoCreated/PlantillaRegistro.html";
	String pathHTML = currentPath + "autoCreated/register.html";
	String pathPDF = currentPath + "autoCreated/register.pdf";
	String currentWorkingPath = currentPath + "autoCreated/";
	
	ArrayList<Registro> alumno = databaseQuery.getRegistros("1");
	
	try{
		generateHTML.generateRegistroHTML(pathHTMLTempleate, pathHTML, alumno.get(0));
	}catch(IOException e){
		e.printStackTrace();	
	}
	
	try {
		generatePDF.generatePDFFromHTML(pathHTML, pathPDF, currentWorkingPath, currentWorkingPath);
	}catch(IOException e){
		e.printStackTrace();
	}catch(DocumentException e){
		e.printStackTrace();
	}
%>
</body>
</html>