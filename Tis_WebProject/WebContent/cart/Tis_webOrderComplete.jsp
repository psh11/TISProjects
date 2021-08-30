<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function toMain(){
		var userId = document.getElementById("userid").value;
		alert("주문이 완료되었습니다");
		location.href="main.jsp?id="+userId;
	}
</script>
</head>
<body onload="toMain()">
	<input type="hidden" id="userid" value="${id }">
	Tis_webOrderComplete
</body>
</html>