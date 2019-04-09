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
	String sessioncicloID = (String)session.getAttribute("usuarioCicloID");
	
	// catch new request form
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		
		boolean updated = true;
		
		String usuario = request.getParameter("usuario");
		String nombres = request.getParameter("nombre");
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String telefono = request.getParameter("telefono");
		String domicilio = request.getParameter("domicilio");
		String rol = request.getParameter("rol");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		
		if (password.equals(password2)){
			updated = databaseInsert.usuario(usuario, nombres, apellidoPaterno, apellidoMaterno, telefono, domicilio, password, rol);
		} else {
			%>
			<script type="text/javascript">
				document.addEventListener("DOMContentLoaded", function() {
				$('#badPassword').modal('show');
				});
			</script>	
			<%
		}
		if (updated == false){
			%>
			<script type="text/javascript">
				document.addEventListener("DOMContentLoaded", function() {
				$('#badUsername').modal('show');
				});
			</script>	
			<%
		}
		
	}
	// catch update request form
	String updateButton = request.getParameter("updateButton");
	if (updateButton != null){
		String usuarioID = request.getParameter("id");
		String nombres = request.getParameter("nombre");
		String apellidoPaterno = request.getParameter("apellidoPaterno");
		String apellidoMaterno = request.getParameter("apellidoMaterno");
		String telefono = request.getParameter("telefono");
		String domicilio = request.getParameter("domicilio");
		String rol = request.getParameter("rol");
		
		databaseUpdate.Usuario(usuarioID, nombres, apellidoPaterno, apellidoMaterno, telefono, domicilio, rol);	
	}

	// catch delete request form
	String deleteButton = request.getParameter("deleteButton");
	if (deleteButton != null){
		String usuariosID = request.getParameter("id");
		
		databaseDelete.Usuario(usuariosID);
	}
	
	// catch password request form
	String passwordButton = request.getParameter("passwordButton");
	if (passwordButton != null){
		String usuarioID = request.getParameter("id");
		String password = request.getParameter("password");
		String password2 = request.getParameter("password2");
		
		
		
		if (password.equals(password2)){
			databaseUpdate.UsuarioPass(usuarioID, password);			
		} else {
			%>
			<script type="text/javascript">
				document.addEventListener("DOMContentLoaded", function() {
				$('#badPassword').modal('show');
				});
			</script>	
			<%
		}
	}
	
	
	
	ArrayList<Usuario> data;
	data = databaseQuery.getUsuario();
	
	if (sessionRol.equals("admin")){
%>
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Usuarios</h1>
        <div class="btn-toolbar mb-2 mb-md-0">
       <%if (sessionRol.equals("admin")) {%>   
            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
                <a class="btn btn-sm btn-outline-secondary">Exportar</a>
            </div>
        </div>
        <%} %>
    </div>
</header>

<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Usuario</th>
      <th class="th-sm">Nombres</th>
      <th class="th-sm">Apellido paterno</th>
      <th class="th-sm">Apellido materno</th>
      <th class="th-sm">Telefono</th>
      <th class="th-sm">Domicilio</th>
      <th class="th-sm">Rol</th>   
      <th class="th-sm"></th>            
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
      <td><%=usuario.getRol() %></td>
      <td align="right">
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=usuario.getId()%>">Modificar</button>
      		<button type="button" class="btn btn-outline-primary btn-sm" onclick="setPasswordID(<%=usuario.getId()%>)">Reinicar contraseña</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" onclick="setDeleteID(<%=usuario.getId()%>)">Eliminar</button>
      	</div>
      </td>
    </tr>
    <%}%>
  </tbody>
</table>

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
      <form action="Usuarios.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Usuario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Nombre de usuario" name="usuario">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombre</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Nombre" name="nombre">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido paterno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido paterno" name="apellidoPaterno">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido materno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido materno" name="apellidoMaterno">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm" type="text" placeholder="55 55 66 77 99 10" name="telefono">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Rol</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="rol">
    			<option>Selecciona un rol</option>
    			<option value="admin">Administrador</option>
    			<option value="manager">Registro</option>
    			<option value="lectura">Lectura</option>
    		</select>
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Contraseña</label>
    		<input class="form-control form-control-sm" type="password" placeholder="contraseña" name="password">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Confirmar contraseña</label>
    		<input class="form-control form-control-sm" type="password" placeholder="confirma tu contraseña" name="password2">
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

<!-- update Nuevo-->
<%for (Usuario usuario : data){ %>
<div class="modal fade" id="modificarModal<%=usuario.getId() %>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Usuario : <%=usuario.getUserName() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Usuarios.jsp" method="post">
      <div class="modal-body">
        <input type="hidden" name="id" value="<%=usuario.getId()%>">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Nombre</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Nombre" name="nombre" value="<%=usuario.getNombres() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido paterno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido paterno" name="apellidoPaterno" value="<%=usuario.getApellidoPaterno() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Apellido materno</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Apellido materno" name="apellidoMaterno" value="<%=usuario.getApellidoMaterno() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm" type="text" placeholder="55 55 66 77 99 10" name="telefono" value="<%=usuario.getTelefono() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Domicilio" name="domicilio" value="<%=usuario.getDomicilio()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Rol</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="rol">
    			<option>Selecciona un rol</option>
    			<%if (usuario.getRol().equals("admin")){ %>
    			<option value="1" selected>Administrador</option>
    			<%} else { %>
    			<option value="1">Administrador</option>
    			<%} %>
    			<%if (usuario.getRol().equals("manager")){ %>
    			<option value="2" selected>Registro</option>
    			<%} else { %>
    			<option value="2">Registro</option>
    			<%} %>
    			<%if (usuario.getRol().equals("lectura")){ %>
    			<option value="3" selected>Lectura</option>
    			<%} else { %>
    			<option value="3">Lectura</option>
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
%>

<!-- Modal password-->
<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nueva contraseña</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Usuarios.jsp" method="post">
      <div class="modal-body">
        <input type="hidden" id="passwordID" name="id" value="">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Contraseña</label>
    		<input class="form-control form-control-sm" type="password" placeholder="contraseña" name="password">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Confirmar contraseña</label>
    		<input class="form-control form-control-sm" type="password" placeholder="confirma tu contraseña" name="password2">
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="passwordButton" value="Nuevo">Actualizar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- bad password-->
<div class="modal fade" id="badPassword" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">No se pudo actualizar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>La constraseña no coincidio.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- bad password-->
<div class="modal fade" id="badUsername" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">No se pudo crear usuario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>El nombre de usuario ya ha sido registrado.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

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
      <form action="Usuarios.jsp" method="post">
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

function setPasswordID(ID){
	document.getElementById('passwordID').value=ID;
	$('#passwordModal').modal('show');
}

function setDeleteID(ID){
	document.getElementById('deleteID').value=ID;
	$('#deleteModal').modal('show');
}
</script>
<%}%>
</body>
</html>
