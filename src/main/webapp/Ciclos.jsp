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

	<% 	
	String sesioName = (String)session.getAttribute("usuarioSesion");
	String sessionRol = (String)session.getAttribute("usuarioRol");
	String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
	
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		String nombre = request.getParameter("nombre");
		
		//databaseInsert.hospital(hospital,telefono,responsable,domicilio);
	};
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		
		//databaseUpdate.hospital(id, hospital, telefono, responsable, domicilio);
	};
	
	ArrayList<Ciclo> data;
	data = databaseQuery.getCiclo();
	
	if (sessionRol.equals("admin")){
	%>	
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Ciclos</h1>
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
      <th class="th-sm">Nombre</th>  
      <th class="th-sm"></th>       
    </tr>
  </thead>
  <tbody>
  <% for (Ciclo ciclo : data){%>
    <tr>
      <td><%=ciclo.getNombre()%></td>
      <td align="right">
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=ciclo.getId()%>">Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm">Eliminar</button>
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
      <form action="Ciclos.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombre</label>
    		<input class="form-control form-control-sm" type="text" placeholder="nombre" name="nombre">
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

<% for (Ciclo ciclo : data){ %>
<div class="modal fade" id="modificarModal<%=ciclo.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Hospitales.jsp" method="post">
      <input type="hidden" name="id" value="<%=ciclo.getId()%>">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombre</label>
    		<input class="form-control form-control-sm" type="text" placeholder="nombre" name="nombre" value="<%=ciclo.getNombre() %>">
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
<script src="js/paopper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- datatables scrips -->
<script src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#mainTable').DataTable();
} );
</script>
<%} %>
</body>
</html>