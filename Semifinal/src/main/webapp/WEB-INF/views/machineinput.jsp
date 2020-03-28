<%-- <%@page import="java.util.Base64"%> --%>
<%@page import="com.semifinal.vancouvercrime.HomeController"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@page import="org.apache.tomcat.util.codec.binary.Base64" %>
<%-- <%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%> --%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
 <script src="http://code.jquery.com/jquery-1.7.min.js" ></script>
   
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
      
      <div class="container">   
         <!-- Codrops top bar -->
         <div class="codrops-top clearfix">
            <a href="http://tympanus.net/Development/Calendario/">

            </a>
            <span class="right">

               <a href="http://tympanus.net/codrops/?p=12452">

               </a>
            </span>
         </div><!--/ Codrops top bar -->         
         <header class="clearfix">         
                   <h1><a href="http://192.168.0.52:8080/Boot_Test/index" font-size: medium> Crime<span>in Vancouver</span></a></h1>
            <nav class="codrops-demos">
            
               <a class="current-demo" href="http://192.168.0.9:8080/vancouvercrime/list">Criminal Prediction</a>
               <a href="http://192.168.0.52:8080/Boot_Test/Vancouver_info">For Vancouver</a>
               <a href="http://192.168.0.9:8080/vancouvercrime/graph">Find Crime by Region Map</a>
               <a href="http://192.168.0.116:8080/semi_JDBC/google_map">A Crime Map</a>
               <a href="WordCloud">Word Cloud</a>
               
               



               
                   
            </nav>  
         </header>
 </div><!-- /container -->
      <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
      <script type="text/javascript" src="js/jquery.dropdown.js"></script>
      <script type="text/javascript">
         
         $( function() {
            
            $( '#cd-dropdown' ).dropdown( {
               gutter : 5
            } );

         });

      </script>
      
 
 <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 300px;  /* The height is 400 pixels */
        width: 30%;  /* The width is the width of the web page */
        /* position: static; */
        top: 900px;
        margin-top : -350px;
          margin-left: 0px; 
        /* margin-right: 100px; */ 
        
       }
    </style>

<meta charset="UTF-8">
<title>범죄예측 입력</title>
</head>
<body>
 <div id="map" align="left"></div>
    <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  var uluru = {lat: 49.28284, lng: -123.1306};
     
  // The map, centered at Uluru
  var map = new google.maps.Map(
      document.getElementById('map'), {zoom: 12, center: uluru});
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({position: uluru, map: map});
}
    </script>
    <!-- Load the API from the specified URL
    * The async attribute allows the browser to render the page while the API loads
    * The key parameter will contain your own API key (which is not needed for this tutorial)
    * The callback parameter executes the initMap() function -->
   
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDTyeIPcL6r6LHGIMYpoIMC29IuHcutjpk&callback=initMap">
    </script>

<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->

<%
HomeController home = new HomeController();
%>


 <%
		String dataimage = Base64.encodeBase64String(home.getPlot()); 
		
	%> 

 <%
	String barplot = Base64.encodeBase64String(home.getbarplot());
 
	String monthplot = Base64.encodeBase64String(home.getmonthbar());
 
%> 


<h1 align="center">밴쿠버 범죄분포</h1>
<div align="center">
<table border="0" align = "center" ><!-- style="margin-left: 100px; margin-right: 100px" -->
<tr>
<td><img src = "data:image/png;base64,<%=dataimage %>"></td> 
  <td><img src = "data:image/png;base64,<%=barplot %>"></td> 
  <td><img src = "data:image/png;base64,<%=monthplot %>"></td> 
 </tr> 
</table>
</div>
<!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->


<h2 align="right" style="margin-right: 320px; margin-top: 100px;">Prediction Values Input</h2>

		
		<form action="machine" method="get">
		<table border="0" align = "right"style="margin-right: 200px"><!-- align = "center" -->
		
			<tr>
				<td>TYPE</td>
				<td><select name="TYPE">
						<option value= "1">Break and Enter Commercial</option>
						<option value= "2">Break and Enter Residential/Other</option>
						<option value= "3">Mischief</option>
						<option value= "4">Other Theft</option>
						<option value= "5">Theft from Vehicle</option>
						<option value= "6">Theft of Bicycle</option>
						<option value= "7">Theft of Vehicle</option>
						<option value= "8">Vehicle Collision or Pedestrian Struck (with Fatality)</option>
						<option value= "9">Vehicle Collision or Pedestrian Struck (with Injury)</option>
				
				
				
				</select></td>
			
			</tr>
			<tr>
				<td>YEAR</td>
				<td><input type="text" name = "YEAR" size="10"></td>
			</tr>
			
			
			<tr>
				<td>MONTH</td>
				<td><select name="MONTH">
					<option value= "1">1</option>
					<option value= "2">2</option>
					<option value= "3">3</option>
					<option value= "4">4</option>
					<option value= "5">5</option>
					<option value= "6">6</option>
					<option value= "7">7</option>
					<option value= "8">8</option>
					<option value= "9">9</option>
					<option value= "10">10</option>
					<option value= "11">11</option>
					<option value= "12">12</option>
				
				</select></td>
			</tr>
			
			
			<tr>
				<td>DAY</td>
				<td><input type="text" name = "DAY" size="10"></td>
			</tr>
			
			
			
			
			<tr>
				<td>HOUR</td>
				<td><select name="HOUR">
					<option value= "0">0</option>
					<option value= "1">1</option>
					<option value= "2">2</option>
					<option value= "3">3</option>
					<option value= "4">4</option>
					<option value= "5">5</option>
					<option value= "6">6</option>
					<option value= "7">7</option>
					<option value= "8">8</option>
					<option value= "9">9</option>
					<option value= "10">10</option>
					<option value= "11">11</option>
					<option value= "12">12</option>
					<option value= "13">13</option>
					<option value= "14">14</option>
					<option value= "15">15</option>
					<option value= "16">16</option>
					<option value= "17">17</option>
					<option value= "18">18</option>
					<option value= "19">19</option>
					<option value= "20">20</option>
					<option value= "21">21</option>
					<option value= "22">22</option>
					<option value= "23">23</option>
					
				
				</select></td>
			</tr>
			
			
			<tr>
				<td>NEIGHBOURHOOD</td>
				<td><select name="NEIGHBOURHOOD">
					<option value= "2">Central Business District</option>
					<option value= "18">Shaughnessy</option>
					<option value= "4">Fairview</option>
					<option value= "10">Kitsilano</option>
					<option value= "5">Grandview-Woodland</option>
					<option value= "14">nearby 312 Main Street</option>
					<option value= "23">Victoria-Fraserview</option>
					<option value= "22">Sunset</option>
					<option value= "9">Killarney</option>
					<option value= "3">Dunbar-Southlands</option>
					<option value= "24">West End</option>
					<option value= "11">Marpole</option>
					<option value= "6">Hastings-Sunrise</option>
					<option value= "17">Riley Park</option>
					<option value= "7">Kensington-Cedar Cottage</option>
					<option value= "12">Mount Pleasant</option>
					<option value= "16">Renfrew-Collingwood</option>
					<option value= "21">Strathcona</option>
					<option value= "8">Kerrisdale</option>
					<option value= "19">South Cambie</option>
					<option value= "1">Arbutus Ridge</option>
					<option value= "15">Oakridge</option>
					<option value= "25">West Point Grey</option>
					<option value= "13">Musqueam</option>
					<option value= "20">Stanley Park</option>
					
				
				</select></td>
			</tr>
			
			<!-- <tr>
				<td>Weather</td>
				<td><select name="Weather">
					<option value= "2">Cloudy</option>
					<option value= "36">Rain Showers</option>
					<option value= "35">Rain</option>
					<option value= "43">Rain,Fog</option>
					<option value= "30">Moderate Rain,Fog</option>
					<option value= "34">Mostly Cloudy</option>
					<option value= "28">Moderate Rain Showers,Fog</option>
					<option value= "24">Mainly Clear</option>
					<option value= "1">Clear</option>
					<option value= "6">Fog</option>
					<option value= "10">Freezing Fog</option>
					<option value= "7">Fog,Smoke</option>
					
					
				</select></td>
			</tr> -->
			<%-- <c:forEach items="${weatherlist }" var="weather"> --%>
			<tr>
				<td>Weather</td>
				<td><select name="Weather">
				<c:forEach items="${weatherlist }" var="weather">
				<!-- 	<option value= "2">Cloudy</option>
					<option value= "36">Rain Showers</option>
					<option value= "35">Rain</option>
					<option value= "35">Rain</option>
					<option value= "35">Rain</option> -->
					<option value= ${weather.weather_num }>${weather.weather_name }</option>
					
				</c:forEach>
					
					
				</select></td>
			</tr>
			<%-- </c:forEach> --%>
			
			
			
			
			
			<tr>
				<td>Temperature</td>
				<td><input type="text" name = "Temp" size="10">(겨울최저-13.6ºC/여름 최고33.9ºC)</td>
			</tr>
			
			
			<tr>
				<td>Humidity</td>
				<td><input type="text" name = "Rel_Hum" size="10">%(겨울에 습도가 높고(최고100%)</br>
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;/여름에 낮음(최저13%))</td>
			</tr>
			
			
			
			
			
			
			
			
			
			<tr>
				<td colspan="2" align="right" ><input type="submit" value="INPUT">머신러닝에 다소 시간이 걸릴수 있습니다.(약 40초)</td>
			</tr>
		
			<!-- <tr>
			<td colspan="2" align="right">다소 시간이 걸릴수 있습니다.(약 40초)</td>
			</tr> -->
		
		</table>
		
		
		
		
		</form>
		




	

</body>
</html>