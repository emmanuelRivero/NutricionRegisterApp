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
<%@page import="models.Alumno" %>

	<% 	
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		String cuenta = request.getParameter("cuenta");
		String nombres = request.getParameter("nombres");		
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String domicilio = request.getParameter("domicilio");
		String telefono = request.getParameter("telefono");
		
		//databaseInsert.alumno(cuenta, apellidoPaterno,apellidoMaterno,domicilio,telefono);
	};
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String cuenta = request.getParameter("cuenta");
		String nombres = request.getParameter("nombres");	
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String domicilio = request.getParameter("domicilio");
		String telefono = request.getParameter("telefono");
		
		//databaseUpdate.hospital(id, hospital, telefono, responsable, domicilio);
	};
	
	ArrayList<Alumno> data;
	data = databaseQuery.getAlumno();
	%>
	
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Alumnos</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
                <a class="btn btn-sm btn-outline-secondary">Exportar</a>
            </div>
        </div>
    </div>
</header>

<!-- <div style=" display: flex;">
	<div style ="width:50%;">
		Hospitales
	</div>
	<div style ="width:50%;" align="right">
		<button type="button" class="btn btn-secondary btn-sm">Small button</button>
	</div>
</div>-->

<br>
<div class="table-responsive">
<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Cuenta</th>
      <th class="th-sm">Nombres</th>
      <th class="th-sm">Apellido Paterno</th>
      <th class="th-sm">Apellido Materno</th>   
      <th class="th-sm">Domicilio</th>   
      <th class="th-sm">telefono</th>      
      <th class="th-sm"></th>        
    </tr>
  </thead>
  <tbody>
  <% for (Alumno alumno: data){%>
    <tr>
      <td><%=alumno.getCuenta()%></td>
      <td><%=alumno.getNombre()%></td>
      <td><%=alumno.getApellidoPaterno()%></td>
      <td><%=alumno.getApellidoMaterno()%></td>
      <td><%=alumno.getDomicilio()%></td>
      <td><%=alumno.getTelefono()%></td>
      
      <td>
      	<div>
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=alumno.getCuenta()%>">Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" id=<%=alumno.getCuenta()%>>Eliminar</button>
      	</div>
      </td>
    </tr>
    <%}%>
  </tbody>
</table>
</div>

<!-- Modal Nuevo-->
<div class="modal fade" id="nuevoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Alumnos.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Cuenta</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Cuenta" name="cuenta">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombres</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Nombre" name="nombres">
    	</div>
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido Paterno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido Paterno" name="apellidoPaterno">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido Materno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido Materno" name="apellidoMaterno">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Telefono" name="telefono">
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="newButton" value="Nuevo">Nuevo</button>
      </div> 
      </form>
    </div>
  </div>
</div>

<!-- modales for hospital -->

<% for (Alumno alumno : data){ %>
<div class="modal fade" id="modificarModal<%=alumno.getCuenta()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Alumnos.jsp" method="post">
      <div class="modal-body">
        <div class="form-group">
    		<label for="exampleFormControlInput1">Cuenta</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Hospital" name="cuenta" value="<%=alumno.getCuenta()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombres</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Nombre" name="nombres" value="<%=alumno.getNombre() %>">
    	</div>
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido Paterno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido Paterno" name="apellidoPaterno" value="<%=alumno.getApellidoPaterno() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido Materno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido Materno" name="apellidoMaterno" value="<%=alumno.getApellidoMaterno()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio" value="<%=alumno.getDomicilio()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Telefono" name="telefono" value="<%=alumno.getTelefono()%>">
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="updateButton" value="Nuevo">Actualizar</button>
      </div>
      </form>
    </div>
  </div>
</div>
<%} %>


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