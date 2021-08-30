<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

    <link type="text/css" rel="stylesheet" href="css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/common.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="css/goods/list.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/button.css?ts=1545872428">
	<link type="text/css" rel="stylesheet" href="css/member/member.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/goods/goods.css?ts=1545872428" />    
    <link type="text/css" rel="stylesheet" href="js/jquery/chosen/chosen.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="css/custom.css?ts=1545872428" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
	$(function(){
		$("#btn_confirm").on("click",function(){
			
			var regId = /^[0-9a-zA-Z]{3,}$/;
			if(regId.test($("#memId").val())==false) {
				alert("형식에 맞게 입력해주세요");
				$("#memId").css("border","1px solid red");
				$("#memId").focus();
				return false;
			}

			
			var regPwd = /^[0-9a-z!@#$%^&*()]{5,16}$/;
			if(regPwd.test($("#newPassword").val())==false) {
				alert("형식에 맞게 입력해주세요");
				$("#newPassword").css("border","1px solid red");
				$("#newPassword").focus();
				return false;
			}
			
				
			var regName = /^[가-힣]{2,}$/;
			if(regName.test($("input[name=memNm]").val())==false) {
				alert("형식에 맞게 입력해주세요");
				$("input[name=memNm]").css("border","1px solid red");
				$("input[name=memNm]").focus();
				return false;
			}
			
			
			var regEmail = /^[0-9a-zA-Z]*@[a-zA-Z]{3,}.[a-zA-Z]{2,3}$/;
			if(regEmail.test($("#email").val())==false) {
				alert("형식에 맞게 입력해주세요");
				$("#email").css("border","1px solid red");
				$("#email").focus();
				return false;
			}
			
		});
	});
</script>
</head>

<body class="body-member body-join pc">
	<div class="top_area"></div>
	<div id="wrap">
		<jsp:include page="common/Tis_webTop.jsp"></jsp:include>
		<div id="container">
			<div id="contents">
				<div class="location_wrap">
					<div class="location_cont">
						<em><a href="main.html" class="local_home">HOME</a> &gt; 회원가입 &gt;
							정보입력</em>
					</div>
				</div>
				<div class="sub_content">
					<div class="content_box">
						<div class="join_base_wrap">
							<div class="member_tit">
								<h2>회원가입</h2>
							</div>
							<div class="member_cont">
								<form id="formJoin" name="formJoin" action="" method="post">
									<div class="base_info_box">
										<h3>기본정보</h3>
										<span class="important">*표시는 반드시 입력하셔야 하는 항목입니다.</span>
										<div class="base_info_sec">
											<table border="0" cellpadding="0" cellspacing="0">
												<colgroup>
													<col width="25%">
													<col width="75%">
												</colgroup>
												<tbody>
													<tr>
														<th><span class="important">*아이디</span></th>
														<td>
															<div class="member_warning">
																<input type="text" id="memId" name="memId" data-pattern="gdMemberId" placeholder="최소 3자리 이상 입력">
															</div>
														</td>

													</tr>
													<tr class="">
														<th><span class="important">*비밀번호</span></th>
														<td class="member_password">
															<div class="member_warning">
																<input type="password" id="newPassword" name="memPw" autocomplete="off" placeholder="5~16자리">
															</div>
														</td>
													</tr>
													<tr class="">
														<th><span class="important">*비밀번호 확인</span></th>
														<td>
															<div class="member_warning">
																<input type="password" class="check-id" name="memPwRe" autocomplete="off">
															</div>
														</td>
													</tr>
													<tr>
														<th><span class="important">*이름</span></th>
														<td>
															<div class="member_warning">
																<input type="text" name="memNm" data-pattern="gdEngKor" value="" maxlength="30" placeholder="최소 두자리 이상">
															</div>
														</td>
													</tr>
													<tr>
														<th><span>*이메일</span></th>
														<td class="member_email">
															<div class="member_warning">
																<input type="text" name="email" id="email" value="" tabindex="-1" placeholder="ex) testemail@tis.com">
															</div>
															<div class="member_warning js_email"></div>
														</td>
													</tr>
													<tr>
														<th><span>휴대폰번호</span></th>
														<td class="member_address">
															<div class="address_postcode">
																<input type="text" id="cellPhone" name="cellPhone" maxlength="12" placeholder="- 없이 입력하세요." data-pattern="gdNum" value="">
															</div>
														</td>
													</tr>
													<tr>
														<th><span>주소</span></th>
														<td class="member_address">
															<div class="address_postcode">
																<input type="text" name="zonecode" readonly="readonly" value="">
																<button type="button" id="btnPostcode" class="btn_post_search">우편번호검색</button>
																<input type="hidden" name="zipcode" value="">
															</div>
															<div class="address_input">
																<div class="member_warning">
																	<input type="text" name="address" readonly="readonly" value="">
																</div>
																<div class="member_warning js_address_sub">
																	<input type="text" name="addressSub" value="">
																</div>
															</div>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>


									<div class="btn_center_box">
										<button type="button" id="btnCancel" class="btn_member_cancel">취소</button>
										<button type="button" id="btn_confirm" class="btn_comfirm js_btn_join" value="회원가입">회원가입</button>
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