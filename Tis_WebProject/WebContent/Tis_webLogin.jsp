<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="author" content="" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="csrf-token" content="MTYxNDU4Nzc4NTI1NjI2MTQxODQ5MDQwNDY3MDAwMjMzNjgzNjU1MjA4" />

    <link type="text/css" rel="stylesheet" href="css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/common.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/goods/list.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/button.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/member/member.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/goods/goods.css?ts=1545872428" />    
    <link type="text/css" rel="stylesheet" href="css/custom.css?ts=1545872428" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>
	function check() {
		var id = document.formLogin.loginId.value;
		var pwd = document.formLogin.loginPwd.value;
		
		if ( id == "" || id == null ) {
			alert("아이디를 입력해주세요.");
			 document.formLogin.loginId.focus();
			return false;
		}
		
		if ( pwd == "" || pwd == null ) {
			alert("비밀번호를 입력해주세요.");
			 document.formLogin.loginPwd.focus();
			return false;
		}

		
		return true;
	}
</script>

</head>

<body class="body-member body-login pc">
	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="common/Tis_webTop.jsp"></jsp:include>
		<div id="container">
			<div id="contents">
				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.html" class="local_home">HOME</a> &gt; 로그인</em>
					</div>
				</div>

				<div class="sub_content">

					<div class="content_box">
						<div class="member_wrap">
							<div class="member_tit">
								<h2>로그인</h2>
							</div>
							<div class="member_cont">

								<form name="formLogin" method="post" action="login.do">
									<div class="member_login_box">
										<h3>회원 로그인</h3>
										<div class="login_input_sec">
											<div>
												<input type="text" id="loginId" name="loginId" value="" placeholder="아이디" >
												<input type="password" id="loginPwd" name="loginPwd" value="" placeholder="비밀번호">
											</div>
											<button type="submit" onclick = "return check();">로그인</button>
										</div>
									</div>
									<div class="member_sns_login"></div>
									<div><font color ="red">${message}</font></div>
									<div class="btn_login_box">
										<ul>
											<li><button id="btnJoinMember" class="btn_member_join">회원가입</button></li>
											<li><button id="btnFindId" class="btn_member_white">아이디 찾기</button></li>
											<li><button id="btnFindPwd" class="btn_member_white">비밀번호 찾기</button></li>
										</ul>
									</div>
									
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="common/Tis_webFooter.jsp"></jsp:include>


	</div>
</body>
</html>