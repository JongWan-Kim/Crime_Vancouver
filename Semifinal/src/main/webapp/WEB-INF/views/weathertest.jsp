<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<SCRIPT type=text/javascript>
function get_weather(){
    var url = "http://www.google.co.kr/ig/api?weather=Taegu&ie=utf-8&oe=utf-8&hl=ko";
    if(window.ActiveXObject){
        var req = new ActiveXObject("Microsoft.XMLHTTP");
    }else{
        var req = new XMLHttpRequest();
    }
    req.open("GET", url, true);
    req.onreadystatechange = function(res){
        if(req.readyState == 0){return;}
        if(req.readyState == 4){
            if(req.status == 200){
                view_weather(req.responseXML);
            }else if(req.status == 404){
                alert("URL does not exist...");
            }
        }else{/*now loadding here...*/}
    };
    req.send(null);
}

function view_weather(res){   
    var data  = res.getElementsByTagName("weather")[0]; //날씨통합정보 
    var info   = data.getElementsByTagName("forecast_information")[0]; //요청정보    
    var now  = data.getElementsByTagName("current_conditions")[0];  //현재 날씨정보    
    var today = data.getElementsByTagName("forecast_conditions")[0];   //오늘 날씨정보    
    var next1 = data.getElementsByTagName("forecast_conditions")[1];   //내일 날씨정보    
    var next2 = data.getElementsByTagName("forecast_conditions")[2];   //모레 날씨정보    
    var next3 = data.getElementsByTagName("forecast_conditions")[3];   //글피 날씨정보
    
    //$('.weather').append(var data);
    
    /*요청정보*/
    var info1 = info.getElementsByTagName("city")[0].getAttribute("data"); //도시코드   
    var info2 = info.getElementsByTagName("forecast_date")[0].getAttribute("data"); //요청일자

    /*현재날씨*/
    var now1 = now.getElementsByTagName("condition")[0].getAttribute("data"); //날씨
    var now2 = now.getElementsByTagName("temp_c")[0].getAttribute("data"); //온도(℃)    
    var now3 = now.getElementsByTagName("temp_f")[0].getAttribute("data"); //온도(℉)    
    var now4 = now.getElementsByTagName("humidity")[0].getAttribute("data"); //습도    
    var now5 = now.getElementsByTagName("icon")[0].getAttribute("data"); //날씨아이콘URL    
    var now6 = now.getElementsByTagName("wind_condition")[0].getAttribute("data"); //바람

    /*오늘날씨*/
    var today1 = today.getElementsByTagName("day_of_week")[0].getAttribute("data");  //요일    
    var today2 = today.getElementsByTagName("low")[0].getAttribute("data"); //최저온도(℃)   
    var today3 = today.getElementsByTagName("high")[0].getAttribute("data");  //최고온도(℃)   
    var today4 = today.getElementsByTagName("icon")[0].getAttribute("data"); //날씨아이콘URL    
    var today5 = today.getElementsByTagName("condition")[0].getAttribute("data");  //날씨

    /*내일날씨*/
    var next11 = next1.getElementsByTagName("day_of_week")[0].getAttribute("data"); //요일    
    var next12 = next1.getElementsByTagName("low")[0].getAttribute("data"); //최저온도(℃)    
    var next13 = next1.getElementsByTagName("high")[0].getAttribute("data"); //최고온도(℃)    
    var next14 = next1.getElementsByTagName("icon")[0].getAttribute("data"); //날씨아이콘URL    
    var next15 = next1.getElementsByTagName("condition")[0].getAttribute("data"); //날씨

    /*모레날씨*/
    var next21 = next2.getElementsByTagName("day_of_week")[0].getAttribute("data"); //요일        
    var next22 = next2.getElementsByTagName("low")[0].getAttribute("data"); //최저온도(℃)    
    var next23 = next2.getElementsByTagName("high")[0].getAttribute("data"); //최고온도(℃)    
    var next24 = next2.getElementsByTagName("icon")[0].getAttribute("data"); //날씨아이콘URL    
    var next25 = next2.getElementsByTagName("condition")[0].getAttribute("data"); //날씨

    /*글피날씨*/
    var next31 = next3.getElementsByTagName("day_of_week")[0].getAttribute("data"); //요일    
    var next32 = next3.getElementsByTagName("low")[0].getAttribute("data"); //최저온도(℃)    
    var next33 = next3.getElementsByTagName("high")[0].getAttribute("data"); //최고온도(℃)    
    var next34 = next3.getElementsByTagName("icon")[0].getAttribute("data"); //날씨아이콘URL    
    var next35 = next3.getElementsByTagName("condition")[0].getAttribute("data"); //날씨
}

window.onload = function(){
    get_weather();
}
 </SCRIPT>
	
	<div class="weather">날씨 : </div>
	




</body>
</html>