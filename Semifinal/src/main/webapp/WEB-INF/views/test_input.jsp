<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
body{
background:#f1f1f1;
}
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #caabd5;
    border-bottom: 3px solid #caabd5;
    text-align: center;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
    text-align: center;
}
table.type09 td {
    width: auto;
    padding: 20px;
    vertical-align: top;
    text-align : auto;
     border-bottom: 1px solid #caabd5; 
}

.btn {
    /* 필수적으로 입력해 주어야 하는 속성 */
    vertical-align: middle; /* Input 과 타 요소들의 텍스트 높이를 동일하게 세로 정렬한다 */
    display: inline-block; /* a나 span 태그의 경우 inline-block 요소처리 */
    line-height: 1;
    cursor: pointer; /* input type에 따라 커서의 모양이 다르다. */
    
    /* 패딩은 Input과 다른 태그들이 달라야 한다 */
    padding: 12px 12px;
    /* 디자인 요소들 */
    transition: all 0.3s;
    box-shadow: inset 0 1px 0 rgba(255,255,255,.2);
/*     text-shadow: 0 -1px 0 rgba(0,0,0,.4); */
   	border-radius:2em;
    font-size: 12px;
    text-transform: uppercase;
    /* 요소마다 border 의 색상을 다르게 주기 위해서 속성들을 따로 기입한다 */
    border-style: solid;
     border-width: 0px; 
	text-align:center;
	letter-spacing:-0.5px; 
	font-weight:bold;
	 vertical-align: middle;
}
.btn--blue {
    border-color: #caabd5;
    background: #caabd5;
    color: white;
}
.btn--blue:hover {
    background:#fff;
    color:#caabd5;
}



</style>
<title>출판사 입력</title>
</head>
<body>


<!-- <div align="center">
<form action="listpage.do" method="post">
<input type="image" src ="http://oi66.tinypic.com/fbkdjq.jpg" width="180" >
</form>
</div>
<br/> -->

		<form action="write.do" method="post">
		<table border="0" class="type09" align="center">
					<div align="center" style="color:#caabd5; font-weight: bold; ">출판사 추가</div>
					<thead>
				<tr>
					 <th scope="col"></th>
					<th scope="col"></th>
					
					
					
				</tr>
				</thead>
					
		
			<tr>
				<td> 출판사 이름  </td>
				<td > <input  type="text" name="pName" size="20" style="height: 30px;"> </td>
			</tr>
			<tr>
				<td> 출판사 주소  </td>
				<td> <input type="text" name="pAddress" size = "50" style="height: 30px;"> </td>
			</tr>
			<tr>
				<td> 출판사 전화번호   </td>
				<td> <input type="text" name="pPhone" size = "40" style="height: 30px;"> </td>
			</tr>
			<tr >
				<td colspan="2" align="right"> <input type="submit" value="입력" class="btn btn--blue"> &nbsp;&nbsp; <a href="listpage.do" class="btn btn--blue">목록보기</a></td>
			</tr>
		
	</table>
	</form>

</body>
</html>