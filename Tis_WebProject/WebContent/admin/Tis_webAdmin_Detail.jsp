<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
							        	<form method="get" action="productdetail" enctype="multipart/form-data" name="detailform" onsubmit="">
					                        <h3 class="t-p">상품확인</h3>
					                        <table class="table">
					                            <tbody>
					                                <tr>
					                                    <th>상품명</th>
					                                    <td class="" colspan="4">${dto.product_name }</td>
					                                </tr>
					                                <tr>
					                                    <th>상품코드</th>
					                                    <td class="" colspan="4">${dto.product_code }</td>
					                                </tr>
					                                <tr>
					                                    <th>판매가</th>
					                                    <td class="" colspan="4"><fmt:formatNumber value="${dto.product_price}" pattern="#,###" />원</td>
					                                </tr>
					                                <tr>
					                                	<th>첨부파일</th>
					                                	<td>
					                                	<c:forTokens var="fileName" items="${dto.product_img1}" delims="," varStatus="st">
						                                	<a download href="../${fileName }">${fn:toUpperCase(fileName)}</a>
					                                	</c:forTokens>
					                                	</td>
					                                </tr>
					                                <tr>
					                                    <th>이미지1</th>
					                                    <td colspan="3" class="text-align-left text-indent">
					                                    	<img alt="img1" src="../img/product/${dto.product_img1}" width="500px;">
					                                    </td>
					                                </tr>
		<%-- 			                                <tr>
					                                    <th>이미지2</th>
					                                    <td colspan="3" class="text-align-left text-indent">
					                                    	<img alt="img2" src="../upload/${img2}" width="500px;">
					                                    </td>
					                                </tr>
					                                <tr>
					                                    <th>이미지3</th>
					                                    <td colspan="3" class="text-align-left text-indent">
					                                    	<img alt="img3" src="../upload/${img3 }" width="500px;">
					                                    </td>
					                                </tr> --%>
					                                <tr class="content">
					                                    <td colspan="4"><textarea class="content" name="content">${dto.product_content }</textarea></td>
					                                </tr>
					                            </tbody>
					                        </table>
					                    	<div style="text-align: center;">
					                        	<a class="btn btn-danger" href="productlist">목록</a>
					                        	<a class="btn btn-danger" href="../admin/productedit?id=${dto.product_id}">수정</a>
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