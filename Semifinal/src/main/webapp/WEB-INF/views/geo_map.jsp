<%@page import="com.semifinal.vancouvercrime.HomeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="org.apache.tomcat.util.codec.binary.Base64" %>
<!DOCTYPE html>
<html lang="en">
   <head>
   
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
      <!-- <div class="container">   
         Codrops top bar
         <div class="codrops-top clearfix">
            <a href="http://tympanus.net/Development/Calendario/">

            </a>
            <span class="right">

               <a href="http://tympanus.net/codrops/?p=12452">

               </a>
            </span>
         </div>/ Codrops top bar  -->        
         <!-- <header class="clearfix"> -->  
         <header >  
        
         </header>
         
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      <script type="text/javascript" src="js/jquery.dropdown.js"></script>
      <script type="text/javascript">
         
         $( function() {
            
            $( '#cd-dropdown' ).dropdown( {
               gutter : 5
            } );

         });

      </script>
      <br/>
      <br/>
      <br/>
      <br/>
      <br/>
      
      
      <%=session.getAttribute("Search1") %>
      
      
       <script src="https://code.jquery.com/jquery-3.0.0.min.js"></script>
       
       
       
       <%
		HomeController home = new HomeController();
		%>
		
		
		  <%
				String getgeo_map = Base64.encodeBase64String(home.getgeo_map(session)); 
		  //String monthplot = Base64.encodeBase64String(home.getmonthbar());
			%>
		
		 
		<table border="0" align = "center" ><!-- style="margin-left: 100px; margin-right: 100px" -->
<tr>
  <td><img src = "data:image/png;base64,<%=getgeo_map %>"></td>
 <%-- <td><img src = "data:image/png;base64,<%=monthplot %>"></td>  --%>
  
 </tr> 
</table>
       
       
       
       
       
       
       
       
       
       
       
 
  



      
   </body>
</html>
