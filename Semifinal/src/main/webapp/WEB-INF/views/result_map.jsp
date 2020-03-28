<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <style>
       /* Set the size of the div element that contains the map */
      #map {
        height: 300px;  /* The height is 400 pixels */
        width: 100%;  /* The width is the width of the web page */
       
       }
    </style>
    
    
    
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


<meta charset="UTF-8">
<title>Criminal Prediction</title>
</head>
<body>

<div id="map"></div>
    <script>
// Initialize and add the map
function initMap() {
  // The location of Uluru
  
<%--   <% double Latitude = request.getParameter("Latitude"); 
  	double Longitude = request.getParameter("Longitude");
  %> --%>
  /* var uluru = {lat: 49.28284, lng: -123.1306}; */
  var uluru = {lat: <%=request.getParameter("Latitude") %>, lng: <%=request.getParameter("Longitude") %>};
  
  
  // 이 스트립트 안에 값이 들어 가야한다.
  
  
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






</body>
</html>