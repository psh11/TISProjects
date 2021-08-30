<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
							        <div class="col-md-3" id="side">
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
									 
							        <div class="col-md-9">
							        	<form method="post" action="../admin/memberdel?id=${param.id}" name="delform" onsubmit="">
					                        <h3 class="t-p">회원정보 삭제</h3>
					                        <div class="mt-5 ml-5">
					                        	<h5>아이디 : [ ${param.id } ]</h5>
					                        	<h5>회원명 : [ ${param.name } ]</h5>
					                        	정말 회원삭제를 진행 하시겠습니까?</div>
					                    	<div style="text-align: center;">
					                        	<input class="btn btn-danger" type="submit" value="삭제" />
					                        	<a class="btn btn-secondary" href="productlist">취소</a>
					                    	</div>
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