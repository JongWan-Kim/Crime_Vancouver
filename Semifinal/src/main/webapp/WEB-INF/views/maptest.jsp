<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
   <head>
      <meta charset="UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
      <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
      <meta name="description" content="Simple Effects for Drop-Down Lists" />
      <meta name="keywords" content="drop-down, select, jquery, plugin, fallback, transition, transform, 3d, css3" />
      <meta name="author" content="Codrops" />
      <link rel="shortcut icon" href="../favicon.ico"> 
      <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources//css/style1.css" />
      <script src="js/modernizr.custom.63321.js"></script>
      
    <style>
    
   #map {
        height: 100%;
        width: 100%;
        
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 80%;
        margin: 0;
        padding: 0;
      }



    </style>
  </head>
  <body>
     
   <div class="container">   
         <!-- Codrops top bar -->
         <!-- <div class="codrops-top clearfix">
            <a href="http://tympanus.net/Development/Calendario/">

            </a>
            <span class="right">

               <a href="http://tympanus.net/codrops/?p=12452">

               </a>
            </span>
         </div> --><!--/ Codrops top bar -->         
        <!--  <header class="clearfix">         
            <h1>Map<span>in Vancouver</span></h1>
            <nav class="codrops-demos">
               <a class="current-demo" href="http://192.168.0.52:8080/Boot_Test/index">Home</a>

            </nav>            
         </header> -->

      <section class="main clearfix">
            <div class="left-box">
            
            </div>
      </section>

   </div>
    

<%-- <%=session.getAttribute("NEIGHBOURHOOD") %>
<%=session.getAttribute("YEAR") %> --%>

   <%--    <form action = "google_map_input" method="get" >
   <table border="1">
      <tr>
			<td>번호</td>
			  <td><input type="text" name="bId" value="${lat_long.Latitude }" ></td>
			 <td>${lat_long.Latitude }</td>
			</tr>
			<tr>
			<td><select name="Weather">
				<c:forEach items="${lat_long }" var="lat_longgg">
				<%
				String aa = ${lat_long };
				
				out.print(aa); %>
				<!-- 	<option value= "2">Cloudy</option>
					<option value= "36">Rain Showers</option>
					<option value= "35">Rain</option>
					<option value= "35">Rain</option>
					<option value= "35">Rain</option> -->
					<option value= ${lat_longgg }>${lat_longgg }</option>
					
				</c:forEach>
					
					
				</select></td>
				</tr> --%>
      
         <!-- <tr>
            <td>year</td>
            <td><input type="text" name="YEAR" size="50"></td>
         </tr>      

         <tr>
            <td>crime type</td>
            <td><select name="TYPE">
                  <option value= "Break and Enter Commercial">Break and Enter Commercial</option>
                  <option value= "Break and Enter Residential/Other">Break and Enter Residential/Other</option>
                  <option value= "Mischief">Mischief</option>
                  <option value= "Other Theft">Other Theft</option>
                  <option value= "Theft from Vehicle">Theft from Vehicle</option>
                  <option value= "Theft of Bicycle">Theft of Bicycle</option>
                  <option value= "Theft of Vehicle">Theft of Vehicle</option>
                  <option value= "Vehicle Collision or Pedestrian Struck (with Fatality)">Vehicle Collision or Pedestrian Struck (with Fatality)</option>
                  <option value= "Vehicle Collision or Pedestrian Struck (with Injury)">Vehicle Collision or Pedestrian Struck (with Injury)</option>
            </select></td>
         </tr>      

   -->
         
       <%--   <tr>
            <td colspan="2"><input type="submit" value="enter"> &nbsp;&nbsp; <a href="google_map">default map트</a></td>
         <%out.print(); %>
         </tr>
   </table>
      </form> --%>
     
  
    
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDTyeIPcL6r6LHGIMYpoIMC29IuHcutjpk&libraries=visualization&callback=initMap">
    </script>






&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;



  <div id="map">
    <script>
  
  
        function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 12,
          //center: {lat: 49.246503, lng: -123.123531}
        //if ()  
        center: {lat: 49.262311, lng: -123.123623}
        
        //49.262311, -123.123623
        });

        
        var data = []
        for (i = 0; i < lat1.length; i++) {
            data[i] = new google.maps.LatLng(lat1[i], lon1[i]);
          }
        
        var heatmap = new google.maps.visualization.HeatmapLayer({
//            data: getPoints(),
            data: data,
            map: map
        });
        
        }   
        
        
        
        var lat1 = new Array();
        var lon1 = new Array();
        var tem1;
        var tem2;
            
        <c:forEach items = "${lat_long}" var = "dto">
            tem1 = "<c:out value="${dto.getLatitude()}" />";
            tem2 = "<c:out value="${dto.getLongitude()}" />";
   
            lat1.push(tem1);
            lon1.push(tem2);         
        </c:forEach>
        
       
      </script>

</div>






  </body>
</html>