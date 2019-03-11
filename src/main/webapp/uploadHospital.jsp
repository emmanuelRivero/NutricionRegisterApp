<%@ page import ="worksheets.*" %>

<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<%@ page import="java.util.*,java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
	String sesioName = (String)session.getAttribute("usuarioSesion");
	String sessionRol = (String)session.getAttribute("usuarioRol");
	String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
	String sessioncicloID = (String)session.getAttribute("usuarioCicloID");
	boolean status;
	
		try{
        	String ImageFile = "";
        	String itemName = "";
        	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        	if (!isMultipart) {
        	} else {
            	FileItemFactory factory = new DiskFileItemFactory();
            	ServletFileUpload upload = new ServletFileUpload(factory);
            	List items = null;
            	try {
                	items = upload.parseRequest(request);
            	} catch (FileUploadException e) {
                	e.getMessage();
            	}
            	
            	FileItem item = (FileItem) items.get(0);
            	XSSFWorkbook workbook = new XSSFWorkbook(item.getInputStream());
            	status = parseToDB.hospital(workbook);
            	
            	if (status= false){
            		session.setAttribute("importResult", "Fail");
            	}else{
            		session.setAttribute("importResult", "Success");
            	}
            	
			}
		}
		catch(Exception e)
		{
    		e.getMessage();
    		out.println(e.getMessage());
    		session.setAttribute("importResult", "Fail");
		}
		response.sendRedirect("Hospitales.jsp");
%>
</body>
</html>