<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="fileGenerator.generateDOCX" %>
<%@page import="fileGenerator.generatePDF" %>
<%@page import="java.io.IOException" %>
<%@page import="org.apache.poi.openxml4j.exceptions.InvalidFormatException" %>
<%@page import="models.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="database.databaseQuery"%>
	<%
	
	Registro dataRegistros;
	dataRegistros = databaseQuery.getRegistros("1","2453290");
	
	
	String currentPath = request.getSession().getServletContext().getRealPath("/");
	String templatePath = currentPath + "autoCreated/PlantillaRegistro.docx";
	String DOCXPath = currentPath + "autoCreated/registros.docx";
	String OutPath = currentPath + "autoCreated/registros.pdf";
	System.out.println("Template: " + templatePath);
	try {
		generateDOCX.generateRegistroDOC(templatePath , DOCXPath, dataRegistros);
	} catch(IOException e){
		e.printStackTrace();
	} catch (InvalidFormatException e){
		e.printStackTrace();
	}
	
	try {
		generatePDF.generatePDFFromDOCX(DOCXPath, OutPath);
	} catch(IOException e){
		e.printStackTrace();
	}
	 %>
</body>
</html>