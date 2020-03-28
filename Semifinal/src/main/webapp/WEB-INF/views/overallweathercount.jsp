<%@page import="com.semifinal.vancouvercrime.HomeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="org.apache.tomcat.util.codec.binary.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <title>Crime in Vancouver</title>
      <meta name="description" content="Simple Effects for Drop-Down Lists" />
      <meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico">
      <!-- <link rel="stylesheet" href="/webjars/bootstrap/4.1.0/css/bootstrap.min.css"> -->
      <!-- <link rel="stylesheet" type="text/css" href="css/style1.css" /> -->
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style1.css" />
      <script src="js/modernizr.custom.63321.js"></script>



</head>
<body>


<%=session.getAttribute("NEIGHBOURHOOD") %>


<%=request.getParameter("NEIGHBOURHOOD") %>

<%
HomeController home = new HomeController();
%>


 <%
		String overallweather = Base64.encodeBase64String(home.overallweathergraph(session)); 
		
	%> 

<table border="0" align = "center" ><!-- style="margin-left: 100px; margin-right: 100px" -->
<tr>
<td><img src = "data:image/png;base64,<%=overallweather %>"></td> 
  
 </tr> 
</table>






</body>
</html>