<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
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
   </head>
   <body>
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
      
      
      
                                           <!-- 날씨 -->
                                           
                                           
          <script type="text/javascript"> 
          
          $.getJSON('http://api.openweathermap.org/data/2.5/weather?id=6173331&APPID=7d4ed1ff6bbe23722e45d04d3d9d76a8&units=metric', function(data){
        	  
        	 
        	var $weather  = data.weather[0].main;
        	$('.cweather').prepend($weather);
        	  /* alert($weather); */
        	  
        	var $temp  = data.main.temp;
        	$('.ctemp').prepend($temp);
        	
        	var $hum  = data.main.humidity;
        	$('.chumidity').prepend($hum);
        	
        	var $temp_max  = data.main.temp_max;
        	$('.chigh_temp').prepend($temp_max);
        	
        	var $temp_min  = data.main.temp_min;
        	$('.clow_temp').prepend($temp_min);
        	
        	
        	var $wIcon = data.weather[0].icon;
        	$('.cicon').prepend('<img src = "http://openweathermap.org/img/wn/'+$wIcon+'@2x.png"/>')
        	
        	
        	var $now = new Date($.now());
        	/* ar $tz = new TimeZone.getTimeZone("America/Vancouver");
        	var $now.setTimeZone($tz); 
        	alert($now)); */
        	var $cDate = $now.getFullYear() +"/"+ ($now.getMonth()+1) +"/"+$now.getDate()+"/"+$now.getHours() + ':' + $now.getMinutes();
        	$('.cDate').prepend($cDate);
        	  
          });
          
          
          </script>
          
         
        												 <!-- 클릭 변환 iframe@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->   
         
         <div class="container">   
         <!-- Codrops top bar -->
         <div class="codrops-top clearfix">
            
         </div><!-- / Codrops top bar  -->        
           
            <nav class="codrops-demos">
                <script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>


                <script>
				$(document).ready(function(e) {
				/* a요소를 클릭 했을 시 */
				    $('a').click(function(){
				/* iframe 요소의 src 속성값을 a 요소의 data-url 속성값으로 변경 */ 
				        $('#iframe').attr('src',$(this).attr('data-url'));
				        })
				});
				</script>
               <!-- <a class="current-demo" href="Machine_Learning">Criminal Prediction</a>
               <a href="Vancouver_info">For Vancouver</a>
               <a href="Graph">Graph</a>
               <a href="Map">A Crime Map</a>
               <a href="graph">Word Cloud</a> -->
               <h4>
               <a data-url="overallweathercount">Overall Weather Count</a>
				<a data-url="graph">Annual temperature</a>
				<a  data-url="test">Monthly Temperature</a>
				<a  data-url="sessiontest">Annual Humidity</a>
				<a  data-url="http://localhost:8080/vancouvercrime/sessiontest2?NEIGHBOURHOOD="+NEIGHBOURHOOD>Monthly Humidity</a>
               </h4>
               
            </nav>            
        
       </div> 
       
             												 <!-- 클릭 변환 iframe@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->   
         
       
       
       <div style='display:inline;min-width:100%;'><!--빨간 부분-->
       
        
        <div style='display:inline;float:left;width:22%;'> <!--파란부분-->
        
        
        <h2 style="margin-left: 50px;">Current weather in Vancouver</h2>
        
        
              
            
            <br/>
        <br/>




      												 <!-- 왼쪽 현재 날씨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->   
         

<style>
  table {
    width: 20%;
    border-top: 0px solid #444444;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #444444;
    border-bottom-color : gray;
    padding: 10px;
  }
</style>
		
        <!-- <div class="cicon" style="padding-left: 15%"><div class="cDate"><br/></div></div> -->
         
         <table style="margin-left: 50px; border-collapse: separate; color: gray; border-color: gray; " >
         	
         	<tr>
         	<td class="cweather" style="font-size : 18px;  padding : 20px; " align="left"></td>
         	<!-- <td style="font-size : 20px;" > Weather </td> -->
         	<td class="cicon" style="padding-left: 15%"><div class="cDate"><br/></div></td>
         	</tr>
         
         
         
         	<!-- <tr>
         	<td style="font-size : 20px;" > Weather </td>
         	<td class="cweather" style="font-size : 18px;  padding : 20px; " align="center"></td>
         	</tr> -->
         	
         	<tr>
         	<td style="font-size : 20px;" align="left">Temperature</td>
         	<td class="ctemp" style="font-size : 18px; padding: 20px;" align="center">℃</td>
         	</tr>
         	
         	<tr>
         	<td style="font-size : 20px;" align="left">Humidity</td>
         	<td class="chumidity" style="font-size : 18px; padding: 20px;" align="center"> %</td>
         	</tr>
         
         	<tr>
         	<td style="font-size : 20px;" align="left">Highest Temperature&nbsp;&nbsp;&nbsp;</td>
         	<td class="chigh_temp" style="font-size : 18px; padding: 20px;" align="center">℃</td>
         	</tr>
         	
         	<tr>
         	<td style="font-size : 20px;" align="left">Lowest Temperature</td>
         	<td class="clow_temp" style="font-size : 18px ; padding: 20px;" align="center">℃</td>
         	</tr>
         	
         	
         	<!-- <tr>
         	<td style="font-size : 20px;">Lowest Temperature</td>
         	<td class="cicon" style="font-size : 18px;" align="right" colspan="2"></td>
         	</tr> -->
         	
         	
         
         </table>
         
       												<!-- 왼쪽 현재 날씨 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
         </div> <!-- 파란부분 -->
         
         
         
         <div style='display:inline;float:left;width:1300px;'> <!-- 연두부분 -->
         
         
         
         											<!-- 도시 찾을 submit버튼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
         
         
        
         <!--NEIGHBORHOOD 찾기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
         <form id = "Search_form" name = "Search_form" action="maptest" method="get" target="ifr" >
        <div align="center"><table style="align-self: center;"> <!-- align="center" -->
        <!-- <input type="text" name="Search" id="Search"  placeholder="Select NEIGHBORHOOD" style="height: 30px;" > -->
                  <!-- <input type="hidden" name="Search" id="Search"> -->
                 <tr style="font-size: 30px;"><h4>Find Crime by Region</h4></tr>
                 <tr>
                  <select name="NEIGHBOURHOOD" style="height: 30px; background-color: #f4f4f4" placeholder="Select NEIGHBORHOOD">
					<option value= "Central Business District">Central Business District</option>
					<option value= "Shaughnessy">Shaughnessy</option>
					<option value= "Fairview">Fairview</option>
					<option value= "Kitsilano">Kitsilano</option>
					<option value= "Grandview-Woodland">Grandview-Woodland</option>
					<option value= "nearby 312 Main Street">nearby 312 Main Street</option>
					<option value= "Victoria-Fraserview">Victoria-Fraserview</option>
					<option value= "Sunset">Sunset</option>
					<option value= "Killarney">Killarney</option>
					<option value= "Dunbar-Southlands">Dunbar-Southlands</option>
					<option value= "West End">West End</option>
					<option value= "Marpole">Marpole</option>
					<option value= "Hastings-Sunrise">Hastings-Sunrise</option>
					<option value= "Riley Park">Riley Park</option>
					<option value= "Kensington-Cedar Cottage">Kensington-Cedar Cottage</option>
					<option value= "Mount Pleasant">Mount Pleasant</option>
					<option value= "Renfrew-Collingwood">Renfrew-Collingwood</option>
					<option value= "Strathcona">Strathcona</option>
					<option value= "Kerrisdale">Kerrisdale</option>
					<option value= "South Cambie">South Cambie</option>
					<option value= "Arbutus Ridge">Arbutus Ridge</option>
					<option value= "Oakridge">Oakridge</option>
					<option value= "West Point Grey">West Point Grey</option>
					<option value= "Musqueam">Musqueam</option>
					<option value= "Stanley Park">Stanley Park</option>
					
				</select>
				</tr>

         <tr>
         <select name="YEAR" style="height: 30px; background-color: #f4f4f4" >
					<option value= "2003">2003</option>
					<option value= "2004">2004</option>
					<option value= "2005">2005</option>
					<option value= "2006">2006</option>
					<option value= "2007">2007</option>
					<option value= "2008">2008</option>
					<option value= "2009">2009</option>
					<option value= "2010">2010</option>
					<option value= "2011">2011</option>
					<option value= "2012">2012</option>
					<option value= "2013">2013</option>
					<option value= "2014">2014</option>
					<option value= "2015">2015</option>
					<option value= "2016">2016</option>
					<option value= "2017">2017</option>
					<option value= "2018">2018</option>
					<option value= "2019">2019</option>
				
				</select>
        </tr>
        <tr>
         <input type="submit" style="height: 30px;" value="Search">
         </tr>
         </table></div>
         
         </form>
         <!--NEIGHBORHOOD 찾기@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  -->
          
                  											<!-- 도시 찾을 submit버튼 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
         
         
          
       
		

         											<!-- iframe 부분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
         


		
		   <iframe id="iframe" name="ifr" src="maptest" width="1800" height="1300" frameborder="0" scrolling="no" ></iframe>

			
			<!-- style="visibility:hidden;display:none" -->
			
			
		 <%-- <jsp:include page="test.jsp" flush="false" >
         	<jsp:param name="name" value="안녀ㅇ하세요" />

         </jsp:include> --%>


         											<!-- iframe 부분 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@  --> 
         






 


         
         
         
         
         </div> <!--연두부분 -->
         
         
         
      </div><!-- 빨간부분 -->
    
      
      
      
      
      
      
      
      
      
      
      
      
      
      
   </body>
</html>
