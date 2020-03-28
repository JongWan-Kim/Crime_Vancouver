<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h2 align="center">Prediction Values Input</h2>
		<form action="machine" method="get">
		<table border="0" align = "center">
		
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
				<td><input type="text" name = "Temp" size="10"></td>
			</tr>
			
			
			<tr>
				<td>Humidity</td>
				<td><input type="text" name = "Rel_Hum" size="10"></td>
			</tr>
			
			
			
			
			
			
			
			
			
			<tr>
				<td colspan="2" align="right"><input type="submit" value="입력"></td>
			</tr>
		
		
		
		</table>
		
		
		
		
		</form>





</body>
</html>