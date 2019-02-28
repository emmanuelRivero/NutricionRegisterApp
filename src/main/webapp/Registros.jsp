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
<%@page import="database.databaseQuery"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="models.*" %>

<% ArrayList<Registro> data;
	data = databaseQuery.getRegistros();
%>
<h2>Alumnos registrados</h2>
<br>
<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Cuenta</th>
      <th class="th-sm">Nombres</th>
      <th class="th-sm">Apellido paterno</th>
      <th class="th-sm">Apellido materno</th>
	  <th class="th-sm">Horario</th>
      <th class="th-sm">Hospital</th>
      <th class="th-sm">Grupo</th>
      <th class="th-sm">Ciclo</th>
      <th class="th-sm"></th>        
    </tr>
  </thead>
  <tbody>
  <% for (Registro registro : data){%>
    <tr>
	  <td><%=registro.getCuenta()%></td>
	  <td><%=registro.getNombres()%></td>
	  <td><%=registro.getApellidoPaterno()%></td>
	  <td><%=registro.getApellidoMaterno()%></td>
	  <td><%=registro.getHorario()%></td>
	  <td><%=registro.getHospital()%></td>
	  <td><%=registro.getGrupo()%></td>
	  <td><%=registro.getCiclo()%></td>
      <td align="right">
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" id=<%=registro.getId() %>>Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" id=<%=registro.getId() %>>Eliminar</button>
     	</div>
      </td>
    </tr>
    <%}%>
  </tbody>
</table>

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