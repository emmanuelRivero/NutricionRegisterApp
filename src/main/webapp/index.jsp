<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>nutricion V0.6</title>
</head>
<body>
<!-- 
<nav class="navbar navbar-expand-lg navbar-light">
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-registros-tab" data-toggle="tab" href="#nav-registros" role="tab" aria-controls="nav-registros" aria-selected="true">Registros</a>
    <a class="nav-item nav-link" id="nav-alumnos-tab" data-toggle="tab" href="#nav-alumnos" role="tab" aria-controls="nav-alumnos" aria-selected="false">Alumnos</a>
    <a class="nav-item nav-link" id="nav-horarios-tab" data-toggle="tab" href="#nav-horarios" role="tab" aria-controls="nav-horarios" aria-selected="false">Horarios</a>
    <a class="nav-item nav-link" id="nav-hospitales-tab" data-toggle="tab" href="#nav-hospitales" role="tab" aria-controls="nav-hospitales" aria-selected="false">Hospitales</a>
    <a class="nav-item nav-link" id="nav-grupos-tab" data-toggle="tab" href="#nav-grupos" role="tab" aria-controls="nav-grupos" aria-selected="false">Grupos</a>
    <a class="nav-item nav-link" id="nav-ciclo-tab" data-toggle="tab" href="#nav-ciclo" role="tab" aria-controls="nav-ciclo" aria-selected="false">Ciclo</a>
    <a class="nav-item nav-link" id="nav-usuarios-tab" data-toggle="tab" href="#nav-usuarios" role="tab" aria-controls="nav-usuarios" aria-selected="false">Usuarios</a>
  </div>
  <div>
  <button type="button" class="btn btn-secondary btn-sm">Login</button>
  </div>
</nav>
-->
<%@page import="database.login" %>
<%@page import="database.databaseQuery" %>
<%@page import="database.databaseInsert" %>
<%@page import="models.Session" %>
<%@page import="models.Ciclo" %>
<%@page import="java.util.ArrayList" %>
<%
// catch new request form
String newButton = request.getParameter("newButton");
if (newButton != null){
	String nombre = request.getParameter("nombre");
	
	databaseInsert.ciclo(nombre);
};

ArrayList<Ciclo> dataCiclos;
dataCiclos = databaseQuery.getCiclo();


String loginButton = request.getParameter("loginButton"); 
String CicloButton = request.getParameter("CicloButton"); 
if (loginButton != null){
	String usuario = request.getParameter("usuario");
	String contraseña = request.getParameter("contraseña");
	String formCicloID = request.getParameter("ciclo");
	
	Session nuevaSesion = new Session();
	nuevaSesion = login.loginUser(usuario, contraseña);
	System.out.println(nuevaSesion.getUsername());
	System.out.println(nuevaSesion.getRol());
	
	for (Ciclo ciclo : dataCiclos){
		if (ciclo.getId().equals(formCicloID)){
			session.setAttribute("usuarioCiclo", ciclo.getNombre());
		}
	}
	session.setAttribute("usuarioSesion", nuevaSesion.getUsername());
	session.setAttribute("usuarioRol", nuevaSesion.getRol());
	session.setAttribute("usuarioCicloID", formCicloID);
}

if (CicloButton != null){
	String formCicloID = request.getParameter("cicloId");	
	String formCiclo = request.getParameter("CicloButton");	
	session.setAttribute("usuarioCicloID", formCicloID);
	session.setAttribute("usuarioCiclo", formCiclo);
}

String sesion = (String)session.getAttribute("usuarioSesion");
String rol = (String)session.getAttribute("usuarioRol");
String ciclo = (String)session.getAttribute("usuarioCiclo");
String cicloID = (String)session.getAttribute("usuarioCicloID");

System.out.println("sesion: " + sesion);
System.out.println("rol: " + rol);
System.out.println("ciclo: " + ciclo);
System.out.println("cicloID: " + cicloID);
System.out.println("loginButton: " + loginButton);
System.out.println("cicloButton: " + CicloButton);


if (sesion == null){
	%>
	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
		$('#loginModal').modal({
    		backdrop: 'static',
    		keyboard: false
		});
		});
	</script>
	<%
}

%>

<ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false"><%=ciclo%></a>
    <div class="dropdown-menu">
    <%for (Ciclo cicloBox : dataCiclos){ %>
      <form action="index.jsp" method="post">
      <input type="hidden" name="cicloId" value="<%=cicloBox.getId()%>">
      	<button type="submit"class="dropdown-item" name="CicloButton" value="<%=cicloBox.getNombre()%>"><%=cicloBox.getNombre()%></button>
      </form>
      <%}%>
      <div class="dropdown-divider"></div>
	  <a class="dropdown-item" href="#nuevoCicloModal" role="button" data-toggle="modal" rel="tooltip" data-original-title='Hello'>Nuevo ciclo</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link active" id="registros-tab" data-toggle="tab" href="#nav-registros" role="tab" aria-controls="registros" aria-selected="true">Registros</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="alumnos-tab" data-toggle="tab" href="#nav-alumnos" role="tab" aria-controls="alumnos" aria-selected="false">Alumnos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="horarios-tab" data-toggle="tab" href="#nav-horarios" role="tab" aria-controls="horarios" aria-selected="false">Horarios</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="grupos-tab" data-toggle="tab" href="#nav-grupos" role="tab" aria-controls="grupos" aria-selected="false">Grupos</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="hospitales-tab" data-toggle="tab" href="#nav-hospitales" role="tab" aria-controls="hospitales" aria-selected="false">Hospitales</a>
  </li>
   	<%if (rol != null){
  		if (rol.equals("admin")) {%>
  		<!-- 
    	<li class="nav-item">
    		<a class="nav-link" id="contact-tab" data-toggle="tab" href="#nav-ciclos" role="tab" aria-controls="ciclos" aria-selected="false">Ciclos</a>
 		</li>
 		 -->
    	<li class="nav-item">
    		<a class="nav-link" id="contact-tab" data-toggle="tab" href="#nav-usuarios" role="tab" aria-controls="usuarios" aria-selected="false">Usuarios</a>
  		</li>
  <%	}
  	} %>
  <li class="nav-item">
	<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Cuenta</a>
    <div class="dropdown-menu">
      <form action="logout.jsp" method="post">
      	<button type="submit"class="dropdown-item" name="logoutButton" value="logout">Cerrar sesión</button>
      </form>
    </div>
  </li>
</ul>
<%if (sesion != null){ %>
<div class="tab-content" id="nav-tabContent">
	<!-- aqui empiezan las ligas de los tabls -->
  <div class="tab-pane fade show active" id="nav-registros" role="tabpanel" aria-labelledby="nav-registros-tab">
	<div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" id="frame-registros" src="Registros.jsp" allowfullscreen></iframe>
	</div>
  </div>
	
  <div class="tab-pane fade" id="nav-alumnos" role="tabpanel" aria-labelledby="nav-alumnos-tab">
  <div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Alumnos.jsp" allowfullscreen></iframe>
	</div>
  </div>
  
  <div class="tab-pane fade" id="nav-horarios" role="tabpanel" aria-labelledby="nav-horarios-tab">
  <div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Horarios.jsp" allowfullscreen></iframe>
	</div>
  </div>
  
  <div class="tab-pane fade" id="nav-hospitales" role="tabpanel" aria-labelledby="nav-hospitales-tab">
  	<div class="embed-responsive embed-responsive-16by9">
  		<iframe class="embed-responsive-item" src="Hospitales.jsp" allowfullscreen></iframe>
	</div>
  </div>
  
  <div class="tab-pane fade" id="nav-grupos" role="tabpanel" aria-labelledby="nav-grupos-tab">
  	<div class="embed-responsive embed-responsive-16by9">
  		<iframe class="embed-responsive-item" id="frame-grupos" src="Grupos.jsp" allowfullscreen></iframe>
  	</div>
  </div>
 
  <div class="tab-pane fade" id="nav-usuarios" role="tabpanel" aria-labelledby="nav-usuarios-tab">
  	<div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Usuarios.jsp" allowfullscreen></iframe>
	</div>
  </div>
</div>
<%} %>

<!-- Login modal -->
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Login</h5>
        <button type="button" class="close" aria-label="Close" disabled>
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="index.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Usuario</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Usuario" name="usuario">
    	</div>
      </div>
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Contraseña</label>
    		<input class="form-control form-control-sm" type="password" placeholder="Contraseña" name="contraseña">
    	</div>
      </div>
      <div class="modal-body">
     	 <div class="form-group">
    		<label for="exampleFormControlSelect1">Ciclo</label>
    		<select class="form-control" id="exampleFormControlSelect1" name="ciclo">
    		<%for (Ciclo ciclos : dataCiclos){ %>
      			<option value="<%=ciclos.getId()%>"><%=ciclos.getNombre()%></option>
      			<%}%>
    		</select>
  		</div>
  	  </div>
      <div class="modal-footer">
        <button type="submit" class="btn btn-primary" name="loginButton" value="login">Login</button>
      </div>
      </form>
    </div>
  </div>
</div>

<!-- Nuevo ciclo modal -->
<div class="modal fade" id="nuevoCicloModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo ciclo</h5>
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

<!-- spinner modal -->
<div class="modal fade" id="loadMe" tabindex="-1" role="dialog" aria-labelledby="loadMeLabel">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-body text-center">
        <div class="loader"></div>
        <div clas="loader-txt">
          <p>Check out this slick bootstrap spinner modal. <br><br><small>We are addicted to Bootstrap... #love</small></p>
        </div>
      </div>
    </div>
  </div>
</div>
<label id="reloadLabel" style="visibility: hidden">this is hidden</label> 

<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
$('#registros-tab').click(function() {
	var frame = document.getElementById('frame-registros');
	frame.src = "Loading.jsp?page=Registros.jsp";	
});
$('#grupos-tab').click(function() {
	var frame = document.getElementById('frame-grupos');
	frame.src = "Loading.jsp?page=Grupos.jsp";	
});
</script>
</body>
</html>