<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="net.tis.common.admin.Tis_admin_SQL"%>
<%@page import="net.tis.dto.Tis_ProductDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>상품 리스트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="csrf-token" content="MTYxNDU4Nzc4NTI1NjI2MTQxODQ5MDQwNDY3MDAwMjMzNjgzNjU1MjA4" />

    <link type="text/css" rel="stylesheet" href="../css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="../css/common/common.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="../css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="../css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="../css/goods/list.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="../css/button.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="../css/member/member.css?ts=1545872428" />
	<link type="text/css" rel="stylesheet" href="../css/order/order.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="../css/goods/goods.css?ts=1545872428" />    
    <link type="text/css" rel="stylesheet" href="../js/jquery/chosen/chosen.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="../css/custom.css?ts=1545872428" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	function codecheck() {
		
	}
</script>
<style type="text/css">
	a{
	 	color: #5D5D5D;
	 }
	.panel-title{
		padding-top: 30px;
	}
	.t-p{
		padding-top: 30px;
	}
	select {
		border: 0;
		background-color: #F9F9F9;
	}
	#q {
		border: 0;
		background-color: #F9F9F9;
	}
</style>
</head>

<body class="body-member body-join pc">
	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="../common/Tis_webTop2.jsp"></jsp:include>
		<div id="container">
			<div id="contents">
				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.html" class="local_home">HOME</a> &gt; 관리자페이지</em>
					</div>
				</div>
				<div class="sub_content">
					<div class="content_box">
						<div class="order_wrap">
							<div class="order_tit">
								<h2>관리자페이지</h2>
							</div>
							<div class="cart_cont">
								<div class="container">
							      <div class="row">
							        <div class="col-md-2" id="side">
							          <div class="panel panel-info">
									    <div class="panel-heading">
									      <h5 class="panel-title">상품관리</h5>
									    </div>
									    <!-- 사이드바 메뉴목록1 -->
									    <ul class="list-group">
									      <li class="list-group-item"><a href="../admin/productreg">상품등록</a></li>
									      <li class="list-group-item"><a href="../admin/productlist">상품목록</a></li>
									    </ul>
									</div>
									  <!-- 패널 타이틀2 -->
									<div class="panel panel-default">
									  <div class="panel-heading">
									    <h5 class="panel-title">회원관리</h5>
									  </div>
									    <!-- 사이드바 메뉴목록2 -->
									      <ul class="list-group">
									        <li class="list-group-item"><a href="../admin/memberlist">회원목록</a></li>
									      </ul>
									</div>      
									  <!-- 패널 타이틀3 -->
									<div class="panel panel-info">
									  <div class="panel-heading">
									    <h5 class="panel-title">게시판관리</h5>
									  </div>
									      <!-- 사이드바 메뉴목록3 -->
									      <ul class="list-group">
									        <li class="list-group-item"><a href="#">공지사항</a></li>
									      </ul>
									    </div>
									</div>
									 
									 
							        <div class="col-md-10">
			                        <h3 class="t-p">회원목록</h3>
							        	<form class="searchform">
							        	<fieldset style="text-align: right;">
					                        <select name="f">
					                        	<option value="id" ${param.f=="id"?"selected":""} >아이디</option>
					                        	<option value="name" ${param.f=="name"?"selected":""}>이름</option>
					                        </select>
					                        <label>검색어</label>
					                        <input type="text" name="q" id="q" value="${param.q }" />
					                        <input type="submit" onclick="" class="btn btn-light" value="검색" />
				                        </fieldset>
							        	</form>
							        	
							        	<form method="get" action="../admin/memberlist" style="padding: 10px;">
					                        <table class="table">
					                        	<thead>
					                        		<tr>
													<th scope="col" style="text-align: center; " class="">아이디</th>
													<th scope="col" style="text-align: center; " class="">이름</th>
													<th scope="col" style="text-align: center; " class="">이메일</th>
													<th scope="col" style="text-align: center; width: 200px;" class="">연락처</th>
													<th scope="col" style="text-align: center; " class="">가입일</th>
													<th scope="col" style="text-align: center; " class="">수정</th>
													<th scope="col" style="text-align: center; " class="">삭제</th>
													</tr>
					                        	</thead>
					                            <tbody>
					                            	<c:forEach var="m" items="${list}">
						                                <tr>
						                                <td scope="row" style="text-align: center;">${m.id}</td>
						                                <td scope="row" style="text-align: center;">${m.name}</td>
						                                <td scope="row" style="text-align: center;">${m.email}</td>
						                                <td scope="row" style="text-align: center;">${m.phone}</td>
						                                <td scope="row" style="text-align: center;">${m.regdate}</td>
						                                <td scope="row" style="text-align: center;">
						                                	<a class="badge bg-info text-white" href="../admin/memberedit?id=${m.id}">수정</a>
						                                </td>
						                                <td scope="row" style="text-align: center;">
						                                	<a class="badge bg-danger" href="../admin/Tis_webMember_del.jsp?id=${m.id}&name=${m.name}">
						                                	<input type="button" value="삭제" style="color: white;"/>
						                                	</a>
						                                </td>
						                                </tr>
					                             	</c:forEach>
					                             	<tr style="text-align: right;">
					                             	<td colspan="9" style="">
					                             		<b style="color: #ED0000; ">${pN}</b>
					                             		/ ${pageCount } [page]
					                             	</td>
					                             	</tr>
					                             	
					                             	<tr style="text-align: center;">
					                             	<td colspan="9" style=" border: none;">
					                             	<c:if test="${pStart > 5}">
						                             	<b><a href="memberlist?f=&q=&p=${pStart-5}">[이전]</a></b>
					                             	</c:if>
					                             	<c:forEach var="i" begin="${pStart}" end="${pEnd}" step="1">
						                             	<b><a href="memberlist?f=&q=&p=${i}" style="color: ${(pN==i)?'#ED0000;':'#828282;'}"> [${i}] </a></b>
					                             	</c:forEach>
					                             	<c:if test="${(pStart+5) <= pageCount}">
						                             	<b><a href="memberlist?f=&q=&p=${pStart+5}">[다음]</a></b>
						                             </c:if>
					                             	</td>
					                             	</tr>
					                            </tbody>
					                        </table>
					               		</form>
							        </div>
							      </div>
							    </div>
								
								
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

		<jsp:include page="../common/Tis_webFooter2.jsp"></jsp:include>


	</div>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>