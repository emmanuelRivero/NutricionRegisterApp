<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Insert title here</title>
</head>
<body>
<%@page import="database.*" %>
<%@page import="database.databaseQuery" %>
<%@page import="java.sql.*" %>

<% ResultSet data;
	data = databaseQuery.getUser();
%>
<h2>Registros</h2>
<br>
<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Usuario

      </th>
      <th class="th-sm">Nombres

      </th>
      <th class="th-sm">Apellido paterno

      </th>
      <th class="th-sm">Apellido materno

      </th>
      <th class="th-sm">Telefono

      </th>
      <th class="th-sm">Domicilio

      </th>
      <th class="th-sm">Acciones

      </th>      
           
    </tr>
  </thead>
  <tbody>
  <% while(data.next()){%>
    <tr>
      <td><%=data.getString(2) %></td>
      <td><%=data.getString(3) %></td>
      <td><%=data.getString(4) %></td>
      <td><%=data.getString(5) %></td>
      <td><%=data.getString(6) %></td>
      <td><%=data.getString(7) %></td>
      <td>
      	<div>
      		<button type="button" class="btn btn-outline-primary btn-sm" id=<%=data.getInt(1) %>>Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" id=<%=data.getInt(1) %>>Eliminar</button>
      		</div>
      </td>
    </tr>
    <%}%>
  </tbody>
</table>

<script>
$(document).ready(function () {
	  $('#dtBasicExample').DataTable();
	  $('.dataTables_length').addClass('bs-select');
	});
</script>

<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>