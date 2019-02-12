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
<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <a class="nav-item nav-link active" id="nav-registros-tab" data-toggle="tab" href="#nav-registros" role="tab" aria-controls="nav-registros" aria-selected="true">Registros</a>
    <a class="nav-item nav-link" id="nav-alumnos-tab" data-toggle="tab" href="#nav-alumnos" role="tab" aria-controls="nav-alumnos" aria-selected="false">Alumnos</a>
    <a class="nav-item nav-link" id="nav-horarios-tab" data-toggle="tab" href="#nav-horarios" role="tab" aria-controls="nav-horarios" aria-selected="false">Horarios</a>
    <a class="nav-item nav-link" id="nav-hospitales-tab" data-toggle="tab" href="#nav-hospitales" role="tab" aria-controls="nav-hospitales" aria-selected="false">Hospitales</a>
    <a class="nav-item nav-link" id="nav-grupos-tab" data-toggle="tab" href="#nav-grupos" role="tab" aria-controls="nav-grupos" aria-selected="false">Grupos</a>
    <a class="nav-item nav-link" id="nav-ciclo-tab" data-toggle="tab" href="#nav-ciclo" role="tab" aria-controls="nav-ciclo" aria-selected="false">Ciclo</a>
    <a class="nav-item nav-link" id="nav-usuarios-tab" data-toggle="tab" href="#nav-usuarios" role="tab" aria-controls="nav-usuarios" aria-selected="false">Usuarios</a>
  </div>
</nav>

<div class="tab-content" id="nav-tabContent">
	<!-- aqui empiezan las ligas de los tabls -->
  <div class="tab-pane fade show active" id="nav-registros" role="tabpanel" aria-labelledby="nav-registros-tab">
	<div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Registros.jsp" allowfullscreen></iframe>
	</div>
  </div>

  <div class="tab-pane fade" id="nav-alumnos" role="tabpanel" aria-labelledby="nav-alumnos-tab">Alumnos</div>
  <div class="tab-pane fade" id="nav-horarios" role="tabpanel" aria-labelledby="nav-horarios-tab">Horarios</div>
  
  <div class="tab-pane fade" id="nav-hospitales" role="tabpanel" aria-labelledby="nav-hospitales-tab">
  	<div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Hospitales.jsp" allowfullscreen></iframe>
	</div>
  </div>
  
  <div class="tab-pane fade" id="nav-grupos" role="tabpanel" aria-labelledby="nav-grupos-tab">Grupos</div>
  <div class="tab-pane fade" id="nav-ciclo" role="tabpanel" aria-labelledby="nav-ciclo-tab">Ciclo</div>
 
  <div class="tab-pane fade" id="nav-usuarios" role="tabpanel" aria-labelledby="nav-usuarios-tab">
  	<div class="embed-responsive embed-responsive-16by9">
  	<iframe class="embed-responsive-item" src="Usuarios.jsp" allowfullscreen></iframe>
	</div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
</body>
</html>