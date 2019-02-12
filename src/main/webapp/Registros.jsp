<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<%@page import="database.*" %>
<%@page import="java.sql.*" %>

<% ResultSet data;
	data = databaseQuery.getRegistros();
%>
<h2>Usuarios</h2>
<br>
<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Cuenta

      </th>
      <th class="th-sm">Nombres

      </th>
      <th class="th-sm">Apellido paterno

      </th>
      <th class="th-sm">Apellido materno

      </th>
      <th class="th-sm">Dias de la Semana

      </th>
      <th class="th-sm">Horario

      </th>

      <th class="th-sm">Hospital

      </th>

      <th class="th-sm">Grupo

      </th>

      <th class="th-sm">Ciclo

      </th>
      <th class="th-sm">Acciones

      </th>

           
    </tr>
  </thead>
  <tbody>
  <% while(data.next()){%>
    <tr>
      <td><%=data.getInt(2) %></td>
      <td><%=data.getString(3) %></td>
      <td><%=data.getString(4) %></td>
      <td><%=data.getString(5) %></td>
      <td><%=data.getString(6) %></td>
      <td><%=data.getString(7) %></td>
      <td><%=data.getString(8) %></td>
      <td><%=data.getString(9) %></td>
      <td><%=data.getString(10) %></td>
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

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>