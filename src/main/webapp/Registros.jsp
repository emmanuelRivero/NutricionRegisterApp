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
<%@page import="worksheets.*" %>

<% 
//Session data
String sesioName = (String)session.getAttribute("usuarioSesion");
String sessionRol = (String)session.getAttribute("usuarioRol");
String sessionCiclo = (String)session.getAttribute("usuarioCiclo");
String sessioncicloID = (String)session.getAttribute("usuarioCicloID");
String cuentaRegistro = request.getParameter("cuenta");
Registro alumnoRegistrado = null;
String URLPD ="";
String URLXLS="";
String URLDOCX="";

// catch new request form
String newButton = request.getParameter("newButton");
if (newButton != null){
	
	String cuenta = request.getParameter("cuenta");
	String grupoId = request.getParameter("grupo");
	String horarioId = request.getParameter("horario");
	
	boolean valGrupo = databaseValidate.grupoInsert(grupoId);
	boolean valCuenta = databaseValidate.cuentaExist(cuenta);
	boolean valCuentaReg = databaseValidate.cuentaRegistered(cuenta, sessioncicloID);
	
	if (valCuenta == true && valGrupo == true && valCuentaReg == false){
		databaseInsert.Registro(cuenta, horarioId, grupoId, sessioncicloID);
		
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#nuevoModal2').modal('show');
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

String newButton2 = request.getParameter("newButton2");
if (newButton2 != null){
	String cuenta = request.getParameter("cuenta");
	String email = request.getParameter("email");
	String telefono = request.getParameter("telefono");
	String celular = request.getParameter("celular");
	String emergencia = request.getParameter("emergencia");	
	String telfam = request.getParameter("telfam");
	String historial = request.getParameter("historial");
	String cartilla = request.getParameter("cartilla");
	String fotos = request.getParameter("fotos");
	String seguro = request.getParameter("seguro");
	String horario = request.getParameter("horario");
	String fechaPractica = 	request.getParameter("fechaPractica");
	
	if (historial == null || !historial.equals("1")){
		historial="0";
	}
	
	if (cartilla == null || !cartilla.equals("1")){
		cartilla="0";
	}
	if (fotos == null || !fotos.equals("1")){
		fotos="0";
	}
	if (seguro == null || !seguro.equals("1")){
		seguro="0";
	}
	if (horario == null || !horario.equals("1")){
		horario="0";
	}
	
	databaseUpdate.Registro(cuenta, sessioncicloID, email, telefono, celular, emergencia, telfam, historial, cartilla, fotos, seguro, horario, fechaPractica);
	
	alumnoRegistrado = databaseQuery.getRegistros(sessioncicloID, cuenta);
	
	String currentPath = request.getSession().getServletContext().getRealPath("/");
	String pathDOCTempleate = currentPath + "autoCreated/PlantillaRegistro.docx";
	String pathDOCX = currentPath + "autoCreated/registro-"+cuenta+".docx";
	String pathPDF = currentPath + "autoCreated/registro-"+cuenta+".pdf";
	//String currentWorkingPath = currentPath + "autoCreated/";
	
	String contextPath = request.getContextPath();
	URLPD = contextPath + "/autoCreated/registro-"+cuenta+".pdf";
	URLDOCX =  contextPath + "/autoCreated/registro-"+cuenta+".docx";
	
	try{
		generateDOCX.generateRegistroDOC(pathDOCTempleate, pathDOCX, alumnoRegistrado);
	}catch(IOException e){
		e.printStackTrace();	
	}
	
	try {
		generatePDF.generatePDFFromDOCX(pathDOCX, pathPDF);
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
}

// catch update request form
String updateButton = request.getParameter("updateButton");
if (updateButton != null){
	String id = request.getParameter("id");
	String cuenta = request.getParameter("cuenta");
	String grupoId = request.getParameter("grupo");
	String horarioId = request.getParameter("horario");
	
	System.out.println(id);
	System.out.println(cuenta);
	System.out.println(grupoId);
	System.out.println(horarioId);
	
	boolean valGrupo = databaseValidate.grupoInsert(grupoId);
	
	if (valGrupo == true){
		databaseUpdate.Registro(horarioId, grupoId, id);
	}else if (valGrupo == false){
		%>
		<script type="text/javascript">
			document.addEventListener("DOMContentLoaded", function() {
			$('#badGroup').modal('show');
		});
		</script>			
		<%
	}
	
}

String updateButton2 = request.getParameter("updateButton2");
if (updateButton2 != null){
	String cuenta = request.getParameter("cuenta");
	String email = request.getParameter("email");
	String telefono = request.getParameter("telefono");
	String celular = request.getParameter("celular");
	String emergencia = request.getParameter("emergencia");	
	String telfam = request.getParameter("telfam");
	String historial = request.getParameter("historial");
	String cartilla = request.getParameter("cartilla");
	String fotos = request.getParameter("fotos");
	String seguro = request.getParameter("seguro");
	String horario = request.getParameter("horario");
	String fechaPractica = 	request.getParameter("fechaPractica");
	
	if (historial == null || !historial.equals("1")){
		historial="0";
	}
	
	if (cartilla == null || !cartilla.equals("1")){
		cartilla="0";
	}
	if (fotos == null || !fotos.equals("1")){
		fotos="0";
	}
	if (seguro == null || !seguro.equals("1")){
		seguro="0";
	}
	if (horario == null || !horario.equals("1")){
		horario="0";
	}
	
	databaseUpdate.Registro(cuenta, sessioncicloID, email, telefono, celular, emergencia, telfam, historial, cartilla, fotos, seguro, horario, fechaPractica);
}

//catch delete request form
String deleteButton = request.getParameter("deleteButton");
if (deleteButton != null){
	String registroID = request.getParameter("id");
		
	databaseDelete.Registro(registroID);
}

//catch export request form
String exportButton = request.getParameter("exportButton");
if (exportButton != null){
	String currentPath = request.getSession().getServletContext().getRealPath("/");
	String OutPath = currentPath + "autoCreated/registros.xlsx";
	String contextPath = request.getContextPath();
	URLXLS = contextPath + "/autoCreated/registros.xlsx";
	try {
	ExcelExport.registros(sessioncicloID, OutPath);
	} catch(IOException e){
		e.printStackTrace();
	}
	
	%>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
		$('#exportModal').modal('show');
	});
	</script>			
	<%
	
}
// catch print requet
String printButton = request.getParameter("printButton");
if (printButton != null){
	String cuenta = printButton;
	
	alumnoRegistrado = databaseQuery.getRegistros(sessioncicloID, cuenta);
	
	String currentPath = request.getSession().getServletContext().getRealPath("/");
	String pathDOCTempleate = currentPath + "autoCreated/PlantillaRegistro.docx";
	String pathDOCX = currentPath + "autoCreated/registro-"+cuenta+".docx";
	String pathPDF = currentPath + "autoCreated/registro-"+cuenta+".pdf";
	//String currentWorkingPath = currentPath + "autoCreated/";
	System.out.println("Template: " + pathDOCTempleate);
	
	String contextPath = request.getContextPath();
	URLPD = contextPath + "/autoCreated/registro-"+cuenta+".pdf";
	URLDOCX =  contextPath + "/autoCreated/registro-"+cuenta+".docx";
	
	try{
		generateDOCX.generateRegistroDOC(pathDOCTempleate, pathDOCX, alumnoRegistrado);
	}catch(IOException e){
		e.printStackTrace();	
	}
	
	try {
		generatePDF.generatePDFFromDOCX(pathDOCX, pathPDF);
	}catch(IOException e){
		e.printStackTrace();
	}catch(DocumentException e){
		e.printStackTrace();
	}
	
	%>
	<script type="text/javascript">
		document.addEventListener("DOMContentLoaded", function() {
		$('#printModal').modal('show');
	});
	</script>
	<%
}
	
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
                <form action="Registros.jsp" method="post">    
                <button type="submit" class="btn btn-sm btn-outline-primary" name = "exportButton" value="Export">exportar</button>
                </form>
                <%} %>
            </div>

        </div>
    </div>
</header>

<br>
<div class="container">
	<div class="row">
		<div class="col-md-12">
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
      					<!-- <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#modificarModal<%=registro.getId()%>">Modificar</button> -->
      					<div class="dropdown">
							<button class="btn btn-outline-primary btn-sm dropdown-toggle" type="button" data-toggle="dropdown">Opciones
							<span class="caret"></span></button>
							<ul class="dropdown-menu">
								  <li><button type="submit"class="dropdown-item" data-toggle="modal" data-target="#modificarModal<%=registro.getId()%>">Modificar Grupo</button>
								  <li><button type="submit"class="dropdown-item" data-toggle="modal" data-target="#modificarModal2<%=registro.getId()%>">Modificar Datos</button></li>			      
								  <li>
				      				<form action="Registros.jsp" method="post">
				      					<button type="submit"class="dropdown-item" name = "printButton" value="<%=registro.getCuenta()%>">Imprimir registro</button>
				      				</form>
								  </li>	      
			    	  
							</ul>
  						</div>
      		
      					<button type="button" class="btn btn-outline-danger btn-sm" onclick="setDeleteID(<%=registro.getId()%>)">Eliminar</button>
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



<!-- Modal Nuevo Set group-->
<div class="modal fade" id="nuevoModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Asignación de hospital</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Registros.jsp" method="post">
      <div class="modal-body">
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Cuenta</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="1234567" name="cuenta">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Grupo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="grupo" onchange="setLugares(this)">
    		    <option>Selecciona un grupo</option>
    			<%
    			for (Grupo grupo : dataGrupos){ 
    			%>
      				<option value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	
    			}%>
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

<!-- Modal Nuevo info-->
<div class="modal fade" id="nuevoModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Datos personales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Registros.jsp" method="post">
      <div class="modal-body">
        <input type="hidden" id="custId" name="cuenta" value="<%=cuentaRegistro%>">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono fijo</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="telefono">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono celular</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="celular">
    	</div>
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Correo electrónico</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="ejemplo@unitec.com" name="email">
    	</div>    	
      	<div class="form-group">
    		<label for="exampleFormControlInput1">En caso de emergencia llamar a:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="Contacto de emergencia" name="emergencia">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Teléfono familiar:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="telfam">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Fecha prática:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="Fecha de la práctica" name="fechaPractica">
    	</div> 
    	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="historial" value="1" id="defaultCheck1">
		  <label class="form-check-label" for="defaultCheck1">
		    Historial académico
		  </label>
      	</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="cartilla" value="1" id="defaultCheck1">
		  <label class="form-check-label" for="defaultCheck1">
		    Cartilla de vacunación
		  </label>
      	</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="fotos" value="1" id="defaultCheck1">
		  <label class="form-check-label" for="defaultCheck1">
		    Dos fotografías infantiles
		  </label>
      	</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="seguro" value="1" id="defaultCheck1">
		  <label class="form-check-label" for="defaultCheck1">
		    Seguro médico vigente
		  </label>
      	</div>
      	<div class="form-check">
		  <input class="form-check-input" type="checkbox" name="horario" value="1" id="defaultCheck1">
		  <label class="form-check-label" for="defaultCheck1">
		    Copia del horario de la materia de práctica clínica
		  </label>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="newButton2" value="Nuevo">Nuevo</button>
      </div> 
      </form>
    </div>
  </div>
</div>

<%if (newButton2 != null){ %>
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
        <p>El alumno <%=alumnoRegistrado.getNombres()%> <%=alumnoRegistrado.getApellidoPaterno()%> <%=alumnoRegistrado.getApellidoMaterno()%> con cuenta <%=alumnoRegistrado.getCuenta() %> fue registrado exitosamente </p>
		<table>
			<tr>
				<td>
					<form action="<%=URLPD%>" method="post" target="_blank">
						<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Descargar PDF</button>
					</form>	
				</td>
				<td>
					<form action="<%=URLDOCX%>" method="post" target="_blank">
						<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Descargar Word</button>
					</form>
				</td>
			</tr>
		</table>
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
for (Registro registro : dataRegistros){ 
	int lugares = 0; %>
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
      <input type="hidden" name="id" value="<%=registro.getId()%>">
      <input type="hidden" name="cuenta" value="<%=registro.getCuenta()%>">
      <div class="modal-body">
     	 <div class="form-group">
    		<label for="exampleFormControlInput1">Grupo</label>
    		<select class="form-control form-control-sm" id="exampleFormControlSelect1" name="grupo" onchange="setLugaresID(this,<%=registro.getId()%>)">
    		    <option>Selecciona un grupo</option>
    			<%for (Grupo grupo : dataGrupos){ 
    				if (grupo.getId() == registro.getGrupoID()){
    					lugares = grupo.getLugares();
    			%>
      				<option selected value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	}else{%>
					<option value="<%=grupo.getId()%>"><%=grupo.getNombre()%></option>
      			<%	}
    			  }%>
    		</select>
    		<label for="exampleFormControlInput1" id="lugaresRestantes<%=registro.getId()%>" style="padding-left: 10px; font-size: 15px;">Lugares restantes: <%=lugares %></label>
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
        <button type="submit" class="btn btn-primary" name="updateButton" value="Actualizar">Actualizar</button>
      </div>
      </form>
    </div>
  </div>
</div>

<div class="modal fade" id="modificarModal2<%=registro.getId()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Datos personales</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form action="Registros.jsp" method="post">
      <div class="modal-body">
        <input type="hidden" id="custId" name="cuenta" value="<%=registro.getCuenta()%>">
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="telefono" value="<%=registro.getTelefono() %>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono celular</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="celular" value="<%=registro.getCelular()%>">
    	</div>
      	<div class="form-group">
    		<label for="exampleFormControlInput1">Correo electrónico</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="ejemplo@unitec.com" name="email" value="<%=registro.getEmail()%>">
    	</div>    	
      	<div class="form-group">
    		<label for="exampleFormControlInput1">En caso de emergencia llamar a:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="Contacto de emergencia" name="emergencia" value="<%=registro.getEmergencia()%>">
    	</div>
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Telefono familiar:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="55 11 22 33 44 55" name="telfam" value="<%=registro.getTelfam()%>">
    	</div> 
    	<div class="form-group">
    		<label for="exampleFormControlInput1">Fecha prática:</label>
    		<input class="form-control form-control-sm autocomplete" type="text" placeholder="Fecha de la práctica" name="fechaPractica" value="<%=registro.getFechaPractica()%>">
    	</div> 
    	<div class="form-check">
    	<%if (registro.getHistorial() == 1){ %>
		  <input class="form-check-input" type="checkbox" name="historial" value="1" id="defaultCheck1" checked>
		<%} else { %>
		  <input class="form-check-input" type="checkbox" name="historial" value="1" id="defaultCheck1">
		<%} %>
		  <label class="form-check-label" for="defaultCheck1">
		    Historial académico
		  </label>
      	</div>
      	<div class="form-check">
      	<%if (registro.getCartilla() == 1){ %>
		  <input class="form-check-input" type="checkbox" name="cartilla" value="1" id="defaultCheck1" checked>
		<%} else { %> 
		  <input class="form-check-input" type="checkbox" name="cartilla" value="1" id="defaultCheck1">
		<%} %>
		  <label class="form-check-label" for="defaultCheck1">
		    Cartilla de vacunación
		  </label>
      	</div>
      	<div class="form-check">
      	<%if (registro.getFotos() == 1){ %>
		  <input class="form-check-input" type="checkbox" name="fotos" value="1" id="defaultCheck1" checked>
		<%} else { %>  
		  <input class="form-check-input" type="checkbox" name="fotos" value="1" id="defaultCheck1">
		<%} %> 
		  <label class="form-check-label" for="defaultCheck1">
		    Dos fotografías infantiles
		  </label>
      	</div>
      	<div class="form-check">
      	<%if (registro.getSeguro() == 1){ %>
		  <input class="form-check-input" type="checkbox" name="seguro" value="1" id="defaultCheck1" checked>
		<%} else { %> 
		  <input class="form-check-input" type="checkbox" name="seguro" value="1" id="defaultCheck1">
		<%} %>  
		  <label class="form-check-label" for="defaultCheck1">
		    Seguro médico vigente
		  </label>
      	</div>
      	<div class="form-check">
      	<%if (registro.getHorario2() == 1){ %>
		  <input class="form-check-input" type="checkbox" name="horario" value="1" id="defaultCheck1" checked>
		<%} else { %> 
		  <input class="form-check-input" type="checkbox" name="horario" value="1" id="defaultCheck1">
		<%} %> 
		  <label class="form-check-label" for="defaultCheck1">
		    Copia del horario de la materia de práctica clínica
		  </label>
      	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="submit" class="btn btn-primary" name="updateButton2" value="Actualizar">Actualizar</button>
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
      <form action="Registros.jsp" method="post">
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

<%if (exportButton != null){ %>
<!-- Successful register -->
<div class="modal fade" id="exportModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Datos exportados</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Los registros han sido exportados exitosamente</p>
		<form action="<%=URLXLS%>" method="post" target="_blank">
			<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Descargar Excel</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
    </div>
  </div>
</div>
<%} %>

<%if (printButton != null){ %>
<!-- ´print button -->
<div class="modal fade" id="printModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Hoja de registro</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>La hoja de registro ha sido generada has click en el boton para descargar.</p>
		<table>
			<tr>
				<td>
					<form action="<%=URLPD%>" method="post" target="_blank">
						<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Descargar PDF</button>
					</form>	
				</td>
				<td>
					<form action="<%=URLDOCX%>" method="post" target="_blank">
						<button type="submit" class="btn btn-secondary"><i class="fa fa-download fa-lg"></i>Descargar Word</button>
					</form>
				</td>
			</tr>
		</table>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
      </div>
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

function setLugares(value){
	console.log(value);
	o = value.selectedIndex
	var lugares = [ 
		<%Iterator<Grupo> grupoIterator = dataGrupos.iterator(); 
		while (grupoIterator.hasNext()){
			Grupo current = grupoIterator.next();
			if (grupoIterator.hasNext()){
				%>"<%=current.getLugares()%>",<%
			}else{
				%>"<%=current.getLugares()%>"<%
			}
		}%>
	];
	var t = document.getElementById('lugaresRestantes');
	if (value.length >= 17){
		t.textContent = "Lugares restantes: "
	}else{
		t.textContent = "Lugares restantes: " + lugares[o - 1];
	}
} 

function setLugaresID(value,modalID){
	console.log(value);
	o = value.selectedIndex
	var lugares = [ 
		<%grupoIterator = dataGrupos.iterator(); 
		while (grupoIterator.hasNext()){
			Grupo current = grupoIterator.next();
			if (grupoIterator.hasNext()){
				%>"<%=current.getLugares()%>",<%
			}else{
				%>"<%=current.getLugares()%>"<%
			}
		}%>
	];
	var t = document.getElementById('lugaresRestantes' + modalID);
	console.log(t);
	if (value.length >= 17){
		t.textContent = "Lugares restantes: "
	}else{
		t.textContent = "Lugares restantes: " + lugares[o - 1];
	}
} 

function setDeleteID(ID){
	document.getElementById('deleteID').value=ID;
	$('#deleteModal').modal('show');
}
</script>
</body>
</html>