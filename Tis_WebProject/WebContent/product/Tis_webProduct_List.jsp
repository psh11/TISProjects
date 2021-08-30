<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri='http://java.sun.com/jsp/jstl/core' %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리스트</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="csrf-token" content="MTYxNDU4Nzc4NTI1NjI2MTQxODQ5MDQwNDY3MDAwMjMzNjgzNjU1MjA4" />

    <link type="text/css" rel="stylesheet" href="./css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/goods/list.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="./css/button.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/goods/goods.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="./js/jquery/chosen/chosen.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="./css/custom.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="./css/paging.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
    <link type="text/css" rel="stylesheet" href="./css/Search.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
    
<body class="body-goods body-goods-list pc">
<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="../common/Tis_webTop.jsp"></jsp:include>
	  	
	  	 <div id="container">
      	  <div id="contents">
      	  	<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.html" class="local_home">HOME</a> &gt; 상품리스트</em>
					</div>
				</div>
      	  	<div class = "sub_content">
	  			<div class="content">
				    <div class="location_wrap">
				    </div>
				
				    <div class="goods_list_item">
				
				        <div class="goods_list_item_tit">
				            <h2>PRODUCT</h2>
				        </div>
					  		<div class="goods_pick_list">
        					    <span class="pick_list_num">상품 <strong>${total}</strong> 개</span>
       						</div>
       						<div class="search-box">
						      <input type="text" class="search-txt" name="keyword" id = "keyword" placeholder="상품이름을 입력하세요" value = "${skey}">
 						      <a class="search-btn" href="javascript:gopage()">
						        <i class="fas fa-search"></i>
						      </a>
					      </div>
 <script type = "text/javascript">
	function gopage() {
		var skey = document.getElementById("keyword").value;
		location.href = "productlist.do?code=${code}&pageNum=1&keyword="+skey;
	}
</script>
        <div class="goods_list">
            <div class="goods_list_cont">
<div class="item_gallery_type">
    <ul>
    	<c:forEach var = "product" items = "${list}">
        <li  style="width:25%;">
            <div class="item_cont">
                <div class="item_photo_box" >
                    <a href="productlistDetail.do?id=${product.getProduct_id()}&code=${product.getProduct_code()}" >
                        <img src="./img/product/${product.getProduct_img1()}" width="180" class="middle"  />
                    </a>
                </div>
                <div class="item_info_cont">
                    <div class="item_tit_box">
                        <strong class="item_name">${product.getProduct_name()}</strong>
                    </div>
                    <div class="item_money_box">
                        <strong class="item_price">
                            <span >${product.getProduct_price()}원 </span>
                        </strong>
                    </div>
                    <div class="item_icon_box">
                        
                    </div>
                </div>
            </div>
        </li>
        </c:forEach>
    </ul>
</div>
            </div>
        </div>
        <div class="page_wrap">
            <div class = "page_nation">
            <c:if test ="${startpage > 10}">
            	<a class = "arrow pprev" href="prodcutlist.do?code=${code}&pageNum=1"></a>
            	<a class = "arrow prev" href="productlist.do?code=${code}&pageNum=${startpage-10}${returnpage}"></a>
            </c:if>
            
            <c:forEach var = "i" begin = "${startpage}" end="${endpage}">
            	<c:choose>
            		<c:when test="${i == pageNUM}">
            			<a class="active">${i}</a>
            		</c:when>
            		<c:otherwise>
            			<a href="productlist.do?code=${code}&pageNum=${i}${returnpage}">${i}</a>
            		</c:otherwise>
            	</c:choose>
            </c:forEach>
            
            <c:if test = "${endpage < pagecount}">
            	<a class = "arrow next" href="productlist.do?code=${code}&pageNum=${startpage+10}${returnpage}"></a>
            	<a class = "arrow nnext" href="productlist.do?code=${code}&pageNum=${pagecount}${returnpage}"></a>
            </c:if>
            </div>
        </div>
    </div>
    </div>
    </div>
    </div>
    </div>
	  		<jsp:include page="../common/Tis_webFooter.jsp"></jsp:include>
	  	
</div>
</body>
</html>