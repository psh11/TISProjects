function gopage() {
		var skey = document.getElementById("keyword").value;
		location.href = "productlist.do?code=${code}&pageNum=1&keyword="+skey;
}