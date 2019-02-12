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
<%@page import="java.util.ArrayList" %>
<%@page import="models.*" %>

	<% ArrayList<Hospital> data;
	data = databaseQuery.getHospitales();
	
	String newButton = request.getParameter("newButton");
	if (newButton != null){
		out.println("Updated");
	};
	
	%>
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Hospitales</h1>
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
<table id="table" class="table table-striped table-sm">
  <thead>
    <tr>
      <th class="th-sm">Hospital</th>
      <th class="th-sm">Telefono</th>
      <th class="th-sm">Responsable</th>
      <th class="th-sm">Domicilio</th>   
      <th class="th-sm"></th>        
    </tr>
  </thead>
  <tbody>
  <% for (Hospital hospital : data){%>
    <tr>
      <td><%=hospital.getNombre() %></td>
      <td><%=hospital.getTelefono() %></td>
      <td><%=hospital.getResponsable() %></td>
      <td><%=hospital.getDomiclio() %></td>
      <td>
      	<div a>
      		<button type="button" class="btn btn-outline-primary btn-sm" id=<%=hospital.getId() %>>Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" id=<%=hospital.getId() %>>Eliminar</button>
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
      <form action="Hospitales.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Hospital</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Hospital" name="hospital">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Telefono" name="Telefono">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Responsale</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Telefono" name="Resposable">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Domicilio</label>
    		<input class="form-control form-control-sm" type="text" placeholder="Telefono" name="Domicilio">
    	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary" name="newButton" value="Nuevo">Nuevo</button>
      </div>
      </form>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

</body>
</html>