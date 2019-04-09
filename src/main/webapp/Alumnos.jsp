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
	System.out.println("loading Alumnos.jsp");
	//Session data
	String sesioName = (String)session.getAttribute("usuarioSesion");
	String sessionRol = (String)session.getAttribute("usuarioRol");
	String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
	String sessioncicloID = (String)session.getAttribute("usuarioCicloID");
	String sessionImportResult = (String)session.getAttribute("importResult");
	
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		String cuenta = request.getParameter("cuenta");
		String nombres = request.getParameter("nombres");		
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String carrera = request.getParameter("carrera");
		String descCarrera = request.getParameter("descCarrera");
		String sexo = request.getParameter("sexo");
		
		
		databaseInsert.alumno(cuenta,nombres, apellidoPaterno,apellidoMaterno,carrera,descCarrera,sexo,sessioncicloID);
	};
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String cuenta = request.getParameter("cuenta");
		String nombres = request.getParameter("nombres");	
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String carrera = request.getParameter("carrera");
		String descCarrera = request.getParameter("descCarrera");
		String sexo = request.getParameter("sexo");
		
		databaseUpdate.Alumno(cuenta, nombres, apellidoPaterno, apellidoMaterno, carrera, descCarrera, sexo);
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
	
	
	ArrayList<Alumno> data;
	data = databaseQuery.getAlumno();
	%>
	
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Alumnos</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        <%if (sessionRol.equals("admin")) {%>    
            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#importModal">Importar</a>
            </div>
        <%} %>
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
      <th class="th-sm">Carrera</th>   
      <th class="th-sm">Desc.Carrera</th>      
      <th class="th-sm">Sexo</th>        
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
      <td><%=alumno.getCarrera()%></td>
      <td><%=alumno.getDescCarrera()%></td>
      <td><%=alumno.getSexo()%></td>
      <td align="right">
      <%if (sessionRol.equals("admin")) {%>
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=alumno.getCuenta()%>">Modificar</button>
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
    		<label for="exampleFormControlInput1">Carrera</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Carrera" name="carrera">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Desc. Carrera</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Descripción de la carrera" name="descCarrera">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlSelect1">Sexo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="sexo">
      			<option selected>Sexo</option>
      			<option>M</option>
      			<option>F</option>
    		</select>
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
      <form action="uploadAlumno.jsp" method="post" enctype="multipart/form-data">
      <div class="modal-body">
		<div class="form-group">
    		<label for="exampleFormControlFile1">Importar lista de alumnos</label>
    		<input type="file" class="form-control-file" id="exampleFormControlFile1" name="file">
  		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="imported" value="alumnos">Importar</button>
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
for (Alumno alumno : data){ %>
<div class="modal fade" id="modificarModal<%=alumno.getCuenta()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cuenta: <%=alumno.getCuenta() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Alumnos.jsp" method="post">
      <input type="hidden" name="cuenta" value="<%=alumno.getCuenta()%>">
      <div class="modal-body">
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
    		<label for="exampleFormControlInput1">Carrera</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Carrera" name="carrera" value="<%=alumno.getCarrera()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Desc. Carrera</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Desc. Carrera" name="descCarrera" value="<%=alumno.getDescCarrera()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlSelect1">Sexo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="sexo">
    			<% if (alumno.getSexo().equals("M")){ %>
      			<option selected="selected">M</option>
      			<option>F</option>
      			<%}else if(alumno.getSexo().equals("F")) { %>
      			<option>M</option>
      			<option selected="selected">F</option>
      			<%}else{ %>
      			<option selected>Sexo</option>
      			<option>M</option>
      			<option>F</option>
      			<%} %>
    		</select>
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