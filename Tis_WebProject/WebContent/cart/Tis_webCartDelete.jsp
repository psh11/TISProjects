<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	cartDelete.jsp
	<input type="hidden" name="id" value="${id }">
	
	 <c:if test="${result>0 }">
	 	<script>
	 		var userId = document.getElementsByName("id")[0].value;
	 		alert("장바구니에서 삭제되었습니다.");
	 		location.href="cartList.do?id="+userId;
	 	</script>
	 </c:if>
</body>
</html>