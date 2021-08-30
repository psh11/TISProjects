<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
<link type="text/css" rel="stylesheet" href="./css/reset.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/common/common.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/common/layer/layer.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/layout/layout.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/goods/list.css?ts=1545872428">
    <link type="text/css" rel="stylesheet" href="./css/button.css?ts=1545872428" />
    <link type="text/css" rel="stylesheet" href="./css/board/board.css?ts=1545872428" />
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    
</head>
<body class="body-board body-popup-goods-board-write pc"  >
	<div class="board_write_popup">
	    <div class="ly_tit"><h4>상품후기 쓰기</h4></div>
	    	<div class="ly_cont">
        <form name="frmWrite" id="frmWrite" action="replyinsert.do" method="post" >
            <div class="scroll_box">
                <div class="top_item_photo_info">
                    <div class="item_photo_box">
                        <img src="./img/product/${dto.product_img1}" width="500" class="middle"  />
                    </div>
                    <div class="item_info_box">
                        <h5>${dto.product_name}</h5>
                    </div>
                </div>
                <div class="board_write_box">
                    <table class="board_write_table">
                        <colgroup>
                            <col style="width:15%" />
                            <col style="width:85%" />
                        </colgroup>
                        <tbody>
                        <tr>
                            <th scope="row">작성자</th>
                            <td> <input type = "text" id = "name" name = "name" value="${loginUser.id}">
                            		<input type= "hidden" id = "member_id" name = "member_id" value="${loginUser.id}">
                            		<input type= "hidden" id = "product_id" name = "product_id" value="${dto.product_id}">                                
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">내용</th>
                            <td class="wirte_editor">
                                <textarea title="내용 입력" id="comment" style="width:100%; min-width:510px;" name="comment" cols="50" rows="3"></textarea>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </form>
           <div class="btn_center_box">
	            <a href="javascript:window.close()"><button class="btn_ly_cancel"><strong>취소</strong></button></a>
	            <button class = "btn_ly_write_ok" onclick = "reply_save();"><strong>등록</strong></button>
       	   </div>
    </div>
</div>

<script type="text/javascript">
	function reply_save() {
		var comment = document.getElementById('comment').value;
		if ( comment == "" || comment == null ) {
			alert("내용을 입력해주세요.");
			document.frmWrite.comment.focus();
			return;
		} 
		/* document.frmWrite.action ='replyinsert.do';
		document.frmWrite.method = 'post';
		document.frmWrite.target = "_self";
		document.frmWrite.submit();
		alert("등록되었습니다.");
		window.opener.document.location.reload();
		 */

		 var params = $("#frmWrite").serialize();
 		$.ajax( {
			type : "POST",
			url : "replyinsert.do",
			data : params,
			
			success: function(data) {
				alert("등록되었습니다.");
				opener.parent.location.reload();
				window.close();
			}
		}); 
		
	}
</script>

</body>
</html>