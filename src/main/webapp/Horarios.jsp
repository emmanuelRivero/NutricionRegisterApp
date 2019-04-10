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
<%@ page import="org.apache.commons.io.IOUtils"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page import="org.apache.commons.fileupload.*"%>

<%@ page import="org.apache.poi.hssf.usermodel.HSSFWorkbook"%>
<%@ page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>

<%@ page import="java.util.*,java.io.*"%>

	<% 	
	//Session data
	String sesioName = (String)session.getAttribute("usuarioSesion");
	String sessionRol = (String)session.getAttribute("usuarioRol");
	String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		String horario = request.getParameter("horario");
		
		databaseInsert.horario(horario);
	};
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String horarioID = request.getParameter("id");
		String horario = request.getParameter("horario");
		
		databaseUpdate.Horario(horarioID, horario);
	};
	
	// catch delete request form
	String deleteButton = request.getParameter("deleteButton");
	if (deleteButton != null){
		String horarioID = request.getParameter("id");
		
		databaseDelete.Horario(horarioID);
	};
	
	ArrayList<Horario> data;
	data = databaseQuery.getHorario();
	%>

	
	
	
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Horarios</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
		<%if (sessionRol.equals("admin")) {%>   
            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
            </div>
        <%}%>
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
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="table-responsive">
			<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
			  <thead>
				<tr>
				  <th class="th-sm">Horario</th>
				  <th class="th-sm"></th>        
				</tr>
			  </thead>
			  <tbody>
			  <% for (Horario horario: data){%>
				<tr>
				  <td><%=horario.getHorario()%></td>     
				  <td align="right">
				  <%if (sessionRol.equals("admin")) {%>
      				<div class="btn-group mr-2" role="group" aria-label="First group">
      					<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=horario.getId()%>">Modificar</button>
      					<button type="button" class="btn btn-outline-danger btn-sm" onclick="setDeleteID(<%=horario.getId()%>)">Eliminar</button>
      				</div>
				  <%} else {%>
				  <%} %>
				  </td>
				</tr>
				<%}%>
			  </tbody>
			</table>
			</div>
		</div>
	</div>
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
      <form action="Horarios.jsp" method="post">
      <div class="modal-body">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Horario" name="horario">
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

<!-- update modals -->
<%
if (sessionRol.equals("admin")){
for (Horario horario : data){ %>
<div class="modal fade" id="modificarModal<%=horario.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Actualizar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Horarios.jsp" method="post">
      <input type="hidden" name="id" value="<%=horario.getId()%>">
      <div class="modal-body">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Horario" name="horario" value="<%=horario.getHorario()%>">
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
}%>

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
      <form action="Horarios.jsp" method="post">
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