<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>tabHeader</title>
</head>
<style type="text/css">		
	#tab div {
		border: none;
		border-radius: 20px;
		padding: 5px;
		margin: 0.5% 0 0.5% 0;
		background-color: #fffcfc;
		box-shadow: 1.5px 1.5px 3px #aaaaaa; 
	}
	
	#tab div button {
		background: none;
		border: 1.5px solid #fffcfc;
		font-size: 20px;
		margin: 0.2%;
		
	}
	
	#tab div button:hover {
		/* border: 1.5px solid #350a4e; */
		border-radius: 15px;
		box-shadow: 0.5px 0.5px 0.5px #aaaaaa; 
	}
	
	@media only screen and (max-width: 784px) {
		#tab div button {
			font-size: 15px;
		}
	}
	
	@media only screen and (max-width: 485px) {			
		#tab div button {
			width: 100%;
		}
	}
</style>
<script type="text/javascript">
	function memberInfo() {
		location.href = "memberInfo.do";
	}
	
	function recommendList() {
		location.href = "recommendList.do";
	}
	
	function likeFesta() {
		location.href = "likeFesta.do";
	}
	
	function myList() {
		location.href = "myList.do";
	}
</script>
<body>
<!-- Nav tabs -->
<nav id="tab">
	<div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
	     <button class="nav-item nav-link" onClick="memberInfo();" role="tab" data-toggle="tab">회원정보 관리</button>
	     <button class="nav-item nav-link" onClick="recommendList();" role="tab" data-toggle="tab">예매내역</button>
	     <button class="nav-item nav-link" onClick="likeFesta();" role="tab" data-toggle="tab">관심축제</button>
	     <button class="nav-item nav-link" onClick="myList();" role="tab" data-toggle="tab">등록한 축제</button>
	</div>
</nav>

</body>
</html>