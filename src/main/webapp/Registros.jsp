<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- bootstarp & datatable css -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.dataTables.min.css">
<link rel="stylesheet" href="css/ui-autocomplete.css">
<link rel="stylesheet" href="css/all.css">
<title>Insert title here</title>
</head>
<body>

<%@page import="java.io.IOException" %>
<%@page import="com.itextpdf.text.DocumentException" %>
<%@page import="fileGenerator.*" %>
<%@page import="database.databaseQuery" %>
<%@page import="database.*" %>
<%@page import="database.databaseQuery"%>
<%@page import="database.databaseValidate"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.util.Iterator" %>
<%@page import="models.*" %>
<% 
//Session data
String sesioName = (String)session.getAttribute("usuarioSesion");
String sessionRol = (String)session.getAttribute("usuarioRol");
String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
String sessioncicloID = (String)session.getAttribute("usuarioCicloID");
Registro alumnoRegistrado = null;
String URLPD ="";

// catch new request form
String newButton = request.getParameter("newButton");
if (newButton != null){
	
	String cuenta = request.getParameter("cuenta");
	String grupoId = request.getParameter("grupo");
	String horarioId = request.getParameter("horario");
	
	boolean valGrupo = databaseValidate.grupoInsert(grupoId);
	boolean valCuenta = databaseValidate.cuentaExist(cuenta, sessioncicloID);
	boolean valCuentaReg = databaseValidate.cuentaRegistered(cuenta, sessioncicloID);
	
	if (valCuenta == true && valGrupo == true && valCuentaReg == false){
		databaseInsert.Registro(cuenta, horarioId, grupoId, sessioncicloID);
		alumnoRegistrado = databaseQuery.getRegistros(sessioncicloID, cuenta);
		
		String currentPath = request.getSession().getServletContext().getRealPath("/");
		String pathHTMLTempleate = currentPath + "autoCreated/PlantillaRegistro.html";
		String pathHTML = currentPath + "autoCreated/registro-"+cuenta+".html";
		String pathPDF = currentPath + "autoCreated/registro-"+cuenta+".pdf";
		String currentWorkingPath = currentPath + "autoCreated/";
		
		String contextPath = request.getContextPath();
		URLPD = contextPath + "/autoCreated/registro-"+cuenta+".pdf";
		
		try{
			generateHTML.generateRegistroHTML(pathHTMLTempleate, pathHTML, alumnoRegistrado);
		}catch(IOException e){
			e.printStackTrace();	
		}
		
		try {
			generatePDF.generatePDFFromHTML(pathHTML, pathPDF, currentWorkingPath, currentWorkingPath);
		}catch(IOException e){
			e.printStackTrace();
		}catch(DocumentException e){
			e.printStackTrace();
		}
		
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#SuccessfulRegister').modal('show');
		});
		</script>
		<%
		
	}else if (valCuenta == false){
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#badAccount').modal('show');
		});
		</script>			
		<%
	}else if(valCuentaReg == true){
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#badRegister').modal('show');
		});
		</script>			
		<%
	}else if (valGrupo == false){
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#badGroup').modal('show');
		});
		</script>			
		<%
	}
	
};
// catch update request form
String updateButton = request.getParameter("updateButton");
if (updateButton != null){
	String id = request.getParameter("id");
	String grupoId = request.getParameter("grupo");
	String horarioId = request.getParameter("horario");
	
	databaseUpdate.Registro(horarioId, grupoId, id);
};


ArrayList<Registro> dataRegistros;
dataRegistros = databaseQuery.getRegistros(sessioncicloID);

ArrayList<Alumno> dataAlumnos;
dataAlumnos = databaseQuery.getAlumno(sessioncicloID);

ArrayList<Grupo> dataGrupos;
dataGrupos = databaseQuery.getGrupo(sessioncicloID);

ArrayList<Horario> dataHorarios;
dataHorarios = databaseQuery.getHorario();

%>
<header>
    <div class="container d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-3">
        <h1 class="h3">Registros</h1>
        <div class="btn-toolbar mb-2 mb-md-0">

            <div class="btn-group mr-2">
                <a class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#nuevoModal">Nuevo</a>
                <%if (sessionRol.equals("admin")) {%>     
                <a class="btn btn-sm btn-outline-secondary">exportar</a>
                <%} %>
            </div>

        </div>
    </div>
</header>

<br>
<table id="mainTable" class="table table-striped table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Cuenta</th>
      <th class="th-sm">Nombres</th>
      <th class="th-sm">Apellido paterno</th>
      <th class="th-sm">Apellido materno</th>
	  <th class="th-sm">Horario</th>
      <th class="th-sm">Hospital</th>
      <th class="th-sm">Grupo</th>
      <th class="th-sm"></th>        
    </tr>
  </thead>
  <tbody>
  <% for (Registro registro : dataRegistros){%>
    <tr>
	  <td><%=registro.getCuenta()%></td>
	  <td><%=registro.getNombres()%></td>
	  <td><%=registro.getApellidoPaterno()%></td>
	  <td><%=registro.getApellidoMaterno()%></td>
	  <td><%=registro.getHorario()%></td>
	  <td><%=registro.getHospital()%></td>
	  <td><%=registro.getGrupo()%></td>
      <td align="right">
      <%if (sessionRol.equals("admin")) {%>
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=registro.getId()%>">Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" id=<%=registro.getId()%>>Eliminar</button>
      	</div>
      <%} else {%>
      	<div class="btn-group mr-2" role="group" aria-label="First group">
      		<button type="button" class="btn btn-outline-primary btn-sm" disabled>Modificar</button>
      		<button type="button" class="btn btn-outline-danger btn-sm" disabled>Eliminar</button>
      	</div>
      <%} %>
      </td>
    </tr>
    <%}%>
  </tbody>
</table>



<!-- Modal Nuevo Set group-->
<div class="modal fade" id="nuevoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Registros.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Cuenta</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="Cuenta" name="cuenta">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Grupo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="grupo" onclick="setLugares(this.value)">
    		    <option>Selecciona un grupo</option>
    			<%for (Grupo grupo : dataGrupos){ 
    			%>
      				<option value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	}%>
    		</select>
    	<label for="exampleFormControlInput1" id="lugaresRestantes" style="padding-left: 10px; font-size: 15px;">Lugares restantes:</label>
    	</div>
    	 <div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="horario">
    		    <option>Selecciona un horario</option>
    			<%for (Horario horario : dataHorarios){ 
    			%>
      				<option value="<%=horario.getId()%>"><%=horario.getHorario()%></option>
      			<%	}%>
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

<%if (newButton != null){ %>
<!-- Successful register -->
<div class="modal fade" id="SuccessfulRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Registro exito</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>El alumno <%=alumnoRegistrado.getNombres()%> <%=alumnoRegistrado.getApellidoPaterno()%> <%=alumnoRegistrado.getApellidoMaterno()%>  </p>
      	<p>con cuenta <%=alumnoRegistrado.getCuenta() %> fue registrado exitosamente </p>
		<form action="<%=URLPD%>" method="post" target="_blank">
			<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Formato PDF</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<%} %>

<!-- bad account -->
<div class="modal fade" id="badAccount" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">No se pudo registrar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>El alumno no existe.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- registered account -->
<div class="modal fade" id="badRegister" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">No se pudo registrar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>El alumno ya fue registrado.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>

<!-- bad group-->
<div class="modal fade" id="badGroup" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">No se pudo registrar</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>El grupo ya está lleno.</p>
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
for (Registro registro : dataRegistros){ %>
<div class="modal fade" id="modificarModal<%=registro.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Cuenta: <%=registro.getCuenta() %></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Registros.jsp" method="post">
      <input type="hidden" name="cuenta" value="<%=registro.getId()%>">
      <div class="modal-body">
     	 <div class="form-group">
    		<label for="exampleFormControlInput1">Grupo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="grupo">
    		    <option>Selecciona un grupo</option>
    			<%for (Grupo grupo : dataGrupos){ 
    				if (grupo.getId() == registro.getGrupoID()){
    			%>
      				<option selected value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	}else{%>
					<option value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	}
    			  }%>
    		</select>
    	</div>
    	 <div class="form-group">
    		<label for="exampleFormControlInput1">Horario</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="horario">
    		    <option>Selecciona un horario</option>
    			<%for (Horario horario : dataHorarios){ 
    				if (horario.getId() == registro.getHorarioID()){
    			%>
      				<option selected value="<%=horario.getId()%>"><%=horario.getHorario()%></option>
      			<%	}else{%>
      				<option value="<%=horario.getId()%>"><%=horario.getHorario()%></option>
      			<%
      				}
      			  }%>
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



function setLugares(value,modalID){
	console.log(value);
	var lugares = [ 
		<%Iterator<Grupo> grupoIterator = dataGrupos.iterator(); 
		while (grupoIterator.hasNext()){
			Grupo current = grupoIterator.next();
			if (grupoIterator.hasNext()){
				%>"<%=current.getLugares()%>",<%
			}else{
				%>" <%=current.getLugares()%>"<%
			}
		}%>
	];
	var t = document.getElementById('lugaresRestantes');
	if (value.length >= 17){
		t.textContent = "Lugares restantes: "
	}else{
		t.textContent = "Lugares restantes: " + lugares[value];
	}
} 
</script>
</body>
</html>