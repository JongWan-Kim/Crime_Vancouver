<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 <script src="http://code.jquery.com/jquery-1.7.min.js" ></script>
</head>
<body>
<script type="text/javascript">
	
	/*
	$.getJSON('파일경로', function(data))
		//data를 가지고 할일
		});
	*/
	$.getJSON('http://api.openweathermap.org/data/2.5/weather?id=6173331&APPID=7d4ed1ff6bbe23722e45d04d3d9d76a8&units=metric', function(data){
	//data를 가지고 할일
	
	//alert(data.list[0].main.temp);
	var $minTemp  = data.main.temp;
	$('.clowtemp').append($minTemp);
	
	//날짜
	var $now = new Date($.now());
	var $cDate = $now.getFullYear() +"/"+ ($now.getMonth()+1) +"/"+$now.getDate()+"/"+$now.getHours() + ':' + $now.getMinutes();
	$('h2').prepend($cDate);
	
	//dt":1570772678 이건 유닉스 시간이다.
	//alert(Date.now()); ==
	//alert($.now());
	//new Date(Date.now());
	
	//alert(new Date(Date.now()));
	//==
	//alert(new Date($.now()));
	//getMonth() 0이 1월
	
	//그래서 현재 시간으로 바꾸는법
	//var $one *= 1;
	
	//alert($now.getFullYear() +"/"+ ($now.getMonth()+1) +"/"+$now.getDate()+"/"+$now.getHours() + ':' + $now.getMinutes());
	//alert($now.getMonth()+1);
	
	
	
	var $wIcon = data.weather[0].icon;
	$('.cicon').append('<img src = "http://openweathermap.org/img/wn/'+$wIcon+'@2x.png"/>')
	//아이콘
	//<img src = "http://openweathermap.org/img/wn/13d@2x.png"/>
	
/* 	A.appendTo(B) B요소의 내용의 뒤에 A를 추가
	A.append(B) A요소의 내용의 뒤에 B를 추가

	A.prependTo(B) B요소의 내용의 앞에 A를 추가
	A.prepend(B) A요소의 내용의 앞에 B를 추가 */
	});



</script>

<h1>weather api</h1>
<h2></h2>
<div class="ctemp">현재 온도: </div>
<div class="clowtemp">최저 온도: </div>
<div class="chightemp">최고 온도: </div>
<div class="cicon">아이콘 :  </div>



</body>
</html>