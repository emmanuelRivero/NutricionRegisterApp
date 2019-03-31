<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.modal1 {
    display:    none;
    position:   fixed;
    z-index:    1000;
    top:        0;
    left:       0;
    height:     100%;
    width:      100%;
    background: rgba( 255, 255, 255, .8 )
    url('https://i.stack.imgur.com/FhHRx.gif')
    50% 50%
    no-repeat;
}
body.loading {
    overflow: hidden;
}
body.loading .modal1 {
    display: block;
}

body {
  background-color: #e1e1e1;
}
</style>
</head>

<body>
<%
String regirectPage = request.getParameter("page");
%>

<div class="modal1"></div>

<script src="js/jquery-3.3.1.slim.min.js"></script>
<script src="js/popper.min.js"></script>
<script type="text/javascript"></script>

<script type="text/javascript">
$(document).ready(function() {
	
	$('body').toggleClass('loading')
	 setTimeout(function () {
	       window.location.href = "<%=regirectPage%>";
	    }, 500); 

} );
</script>
</body>
</html>