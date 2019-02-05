<html>
<body>
<jsp:include page="mainMenu.jsp"></jsp:include><br/>
<h2>Welcome</h2>
<%@page import="database.*" %>
<%@page import="java.sql.*" %>
	<% ResultSet nombre;
	nombre = databaseConsult.getData();
	if (nombre.next())
	out.print(nombre.getString(1));
	%>


</body>
</html>
