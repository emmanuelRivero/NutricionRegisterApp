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
	
	//Session data
	String sesioName = (String)session.getAttribute("usuarioSesion");
	String sessionRol = (String)session.getAttribute("usuarioRol");
	String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
	String sessionImportResult = (String)session.getAttribute("importResult");	
	
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		String hospital = request.getParameter("hospital");
		String periodo = request.getParameter("periodo");
		String horario = request.getParameter("horario");
		String domicilio = request.getParameter("domicilio");
		
		databaseInsert.hospital(hospital,horario,periodo,domicilio);
	};
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String id = request.getParameter("id");
		String hospital = request.getParameter("hospital");
		String horario = request.getParameter("horario");
		String periodo = request.getParameter("periodo");
		String domicilio = request.getParameter("domicilio");
		
		databaseUpdate.hospital(id, hospital, horario, periodo, domicilio);
	};
	
	// catch delete request form
	String deleteButton = request.getParameter("deleteButton");
	if (deleteButton != null){
		String hospitalID = request.getParameter("id");
		
		databaseDelete.Hospital(hospitalID);
	}
	
	if (sessionImportResult != null){
		if (sessionImportResult.equals("Success")){
			request.getSession().removeAttribute("importResult");
			%>
			<script type="text/javascript">
				document.addEventListener("DOMContentLoaded", function() {
				$('#importModalSuccess').modal('show');
			});
			</script>			
			<%
		}
	}
	
	
	
	ArrayList<Hospital> data;
	data = databaseQuery.getHospitales();
	%>
	
	
	
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Hospitales</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
       <%if (sessionRol.equals("admin")) {%>       
            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#importModal">Importar</a>
                <a class="btn btn-sm btn-outline-secondary">exportar</a>
            </div>
        </div>
        <%} %>
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
      <th class="th-sm">Hospital</th>
      <th class="th-sm">Horario</th>
      <th class="th-sm">Periodo</th>
      <th class="th-sm">Domicilio</th>   
      <th class="th-sm"></th>        
    </tr>
  </thead>
  <tbody>
  <% for (Hospital hospital : data){%>
    <tr>
      <td><%=hospital.getNombre()%></td>
      <td><%=hospital.getHorario()%></td>
      <td><%=hospital.getPeriodo()%></td>
      <td><%=hospital.getDomiclio()%></td>
      <td align="right">
      <%if (sessionRol.equals("admin")) {%>
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=hospital.getId()%>">Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" onclick="setDeleteID(<%=hospital.getId()%>)">Eliminar</button>
      	</div>
      <%} else {%>
      <%} %>
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
      <form action="Hospitales.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Hospital</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Hospital" name="hospital">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Horario" name="horario">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Periodo</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Periodo" name="periodo">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio">
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

<!-- import modal -->
<div class="modal fade" id="importModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Importar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="uploadHospital.jsp" method="post" enctype="multipart/form-data">
      <div class="modal-body">
		<div class="form-group">
    		<label for="exampleFormControlFile1">Importar hospitales</label>
    		<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="importButton" value="hospitales">Importar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- import result success -->
<div class="modal fade" id="importModalSuccess" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Importar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>La importación fue exitosa.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- update modals -->

<%
if (sessionRol.equals("admin")){ 
for (Hospital hospital : data){ %>
<div class="modal fade" id="modificarModal<%=hospital.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hospital <%=hospital.getNombre() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Hospitales.jsp" method="post">
      <input type="hidden" name="id" value="<%=hospital.getId()%>">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Hospital</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Hospital" name="hospital" value="<%=hospital.getNombre() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Horario" name="horario" value="<%=hospital.getHorario()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Periodo</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Periodo" name="periodo" value="<%=hospital.getPeriodo()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio" value="<%=hospital.getDomiclio()%>">
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
<%
}
}
%>

<!-- Delete modal-->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Eliminar registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Hospitales.jsp" method="post">
      	<input type="hidden" id="deleteID" name="id" value="">
      <div class="modal-body">
        <p>¿Seguro que desea eliminar este registro?</p>
        <p>Ya no podra recuperar su información.</p>
      </div>
      <div class="modal-footer">
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-danger" name="deleteButton" value="Delete">Eliminar</button>
      </div>
      </form>
    </div>
  </div>
</div>

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

function setDeleteID(ID){
	document.getElementById('deleteID').value=ID;
	$('#deleteModal').modal('show');
}
</script>
</body>
</html>