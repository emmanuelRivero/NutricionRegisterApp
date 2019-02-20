<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- bootstarp & datatable css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">

<title>Insert title here</title>
</head>
<body>
<%@page import="database.*" %>
<%@page import="database.databaseQuery" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="models.*" %>

<% ArrayList<Usuario> data;
data = databaseQuery.getUsuario();
%>
<h2>Registros</h2>
<br>
<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
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
  <% for (Usuario usuario : data){%>
    <tr>
      <td><%=usuario.getUserName() %></td>
      <td><%=usuario.getNombres() %></td>
      <td><%=usuario.getApellidoPaterno() %></td>
      <td><%=usuario.getApellidoMaterno() %></td>
      <td><%=usuario.getTelefono() %></td>
      <td><%=usuario.getDomicilio() %></td>
      <td>
      	<div>
      		<button type="button" class="btn btn-outline-primary btn-sm">Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm">Eliminar</button>
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

<!-- bootstrap 4.3 -->
<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- datatables scrips -->
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#mainTable').DataTable();
} );
</script>
</body>
</html>