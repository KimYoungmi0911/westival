<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/header.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Travelix</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/bootstrap4/bootstrap.min.css"> -->
<link
	href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/about_responsive.css">
<link rel="stylesheet" type="text/css"
	href="/westival/resources/styles/responsive.css">
	<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<style type="text/css">
.intro {
	background-color: #fff;
	width: 100%;
	padding-top: 40px;
	padding-bottom: 40px;
	color: black;
}

.searchDiv {
	text-align: center;
}

.searchDiv>* {
	display: inline-block;
}

#skeyword {
	width: 270px;
	margin: 0 5px;
}

.table {
	border-bottom: 1px solid #f0f2f4;
	text-align: center;
}

.td4 {
	text-align: left;
}

a:link {
	text-decoration: none;
	color: black;
}

a:visited {
	text-decoration: none;
	color: black;
}

a:hover {
	text-decoration: none;
	color: black;
}

a:active {
	text-decoration: none;
	color: black;
}

#writeBtn {
	cursor: pointer;
}

.table img {
	width: 20px;
}

@media only all and (max-width: 1199px) {
	.qna_table {
		overflow-x: scroll;
	}
	.qnatable__body {
		white-space: nowrap;
	}
	.searchDiv>* {
		display: block;
	}
	#skeyword {
		width: 200px;
		margin: 0px;
	}
}

/*  */
.main {
	position: absolute;
	top: 5%;
	left: 35%;
	margin-top: -51px;
	margin-left: -153px;
	width: 900px;
	height: 80px;
}

.main_common {
	display: inline-table;
	float: left;
	width: auto;
	height: auto;
}

.content {
	display: table-cell;
	vertical-align: middle;
	text-align: center;
}
#home {
      height: 90%;
      display: block;
   }
    
   .home_background {
      position: relative;
   }
   
   .titleV { cursor:pointer; }
   #searchBtn { cursor:pointer; }
   #allSearchBtn { cursor:pointer; }
   
   
</style>
<script>
	var currentPage = 1;
	var all = "all";
	$(function(){
		var oParams = getUrlParams();
		//쿼리스트링 값 가져오기
		/* alert("category2 : " + oParams.category2 + "\n oParams.search2 : " + oParams.search2
				+ "\n oParams.keyword2 : " + oParams.keyword2 + "\n oParams.page : " + oParams.keyword2); */
		if(oParams.category2 != "undefined" || oParams.search2 != "undefined" || oParams.keyword2 != "undefined"){ 
	      var a = decodeURI(oParams.category2);
	      var b = decodeURI(oParams.search2);
	      var c = decodeURI(oParams.keyword2);
	      var d = oParams.page;
	      if( a != "undefined" || b != "undefined" || c != "undefined" ){
	    	  if(a == "undefined" && b == "undefined" && c == "undefined" &&  d != "undefined"){
		    	  location.href="commuPage.do?page="+d;
		      }
		      if(a == "undefined"){
		    	  $("#categoryFilter").val(all).prop("selected", true);
		      }else{
		    	  $("#categoryFilter").val(a).prop("selected", true);
		      }
		      if(b == "undefined"){
		    	  $("#searchFilter").val(all).prop("selected", true);
		      }else{
		    	  $("#searchFilter").val(b).prop("selected", true);
		      }     
		      if(c != "undefined"){
		    	  $("#keywordFilter").val(c);
		      }
		      
	         clickSearch(d);
			}
	      return false;
		}
		
		//검색 엔터키 이벤트
        $("#keywordFilter").keydown(function(key){
           if(key.keyCode == 13){
              $("#searchBtn").click();
           }
        });
		
		
	});
	//글쓰기 버튼 클릭시
	function writeBtnCilck(){
		if('${member.user_id}' != ""){
			location.href="commuWriteForm.do";
		}else{
			alert("로그인 후 작성 가능합니다");
		}
		return false;
	}
	
	//조회 버튼 클릭시
	function clickSearch(page){
		currentPage = page;
		//값 없이 입력시 전체조회 
		if($("#categoryFilter option:selected").val() == "all" 
				&& $("#searchFilter option:selected").val() == "all"
				&& $("#keywordFilter").val() == ""){
			location.href="commuPage.do?page="+page;
			}else{
				$.ajax({
					url : "commufilter.do",
					type : "post",
					dataType : "json",
					data : {"category" : $("#categoryFilter option:selected").val(),
						"search" : $("#searchFilter option:selected").val(),
						"keyword" : $("#keywordFilter").val(), "page" : page},
					success : function (obj){
						var objStr = JSON.stringify(obj);
			            var jsonObj = JSON.parse(objStr);
			            var outValues= '';
			            var pageValues='';
			            
			            if(obj.endPage == 0){
			            	 outValues += '<td colspan="7">검색 결과가 존재하지 않습니다.</td>';
			            }else{
			            	 for(var i in jsonObj.list){
			            		 for(var j=0; j < jsonObj.list[i].title.length; j++){
			            		 	jsonObj.list[i].title = jsonObj.list[i].title.replace("+", " ");
			            		 }
			            		 outValues += '<tr><td>'+jsonObj.list[i].community_no+'</td>';
			            		 outValues += '<td>'+decodeURIComponent(jsonObj.list[i].category)+'</td>';
			            		 outValues += '<td class="titleV" onclick="detailClick(' + jsonObj.list[i].community_no + ');">'+decodeURIComponent(jsonObj.list[i].title)+'</td>';	            		 
			            		 outValues += '<td>'+jsonObj.list[i].user_id+'</td>';
			            		 outValues += '<td>'+jsonObj.list[i].community_date+'</td>';
			            		 outValues += '<td>'+jsonObj.list[i].read_count+'</td></tr>';
			            	 }
			            }
			            
			            pageValues += '<li class="page-item"><a class="page-link" style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>';
			               for( p=1; p<=obj.endPage; p++ ){
			                  if( p == obj.currentPage ){
			                     pageValues += '<li class="page-item"><a class="page-link" onclick="clickSearch('+p+')" style="background: rgba(53, 10, 78, 0.6);color: white;">'+p+'</a></li>';
			                  }else{
			                     pageValues += '<li class="page-item"><a class="page-link" onclick="clickSearch('+p+')" style="color: rgba(53, 10, 78, 0.6);">'+p+'</a></li>';
			                  }
			               }
			               pageValues += '<li class="page-item"><a class="page-link" style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>';
			            
			            $(".table tbody").html(outValues);
			            $(".pagination").html(pageValues);

					},
					error : function (jqXHR, textstatus, errorThrown){
						console.log("error : " + jqXHR + ", " + textstatus + ", " + errorThrown);
					}
				
				});
		
			//}
		}
		return false;
	}
	
	//상세보기 클릭시
	function detailClick (community_no){
			if($("#keywordFilter").val() == ""){
			$("#tbody").append("<form id='detailForm' action='commuDetail.do?category2="+$("#categoryFilter option:selected").val()
					+"&search2="+$("#searchFilter option:selected").val()+"&keyword2="+$("#keywordFilter").val()+"&page=${paging.currentPage}' method='post'>"
					+"<input type='hidden' name='community_no' value='" + community_no + "'>"
					+"<input type='hidden' name='category' value='" + $("#categoryFilter option:selected").val() + "'>"
					+"<input type='hidden' name='search' value='" + $("#searchFilter option:selected").val() + "'>"
					+"<input type='hidden' name='keyword' value='" + $("#keywordFilter").val() + "'>"
					+"<input type='hidden' name='page' value='" + currentPage + "'>"
					+"</form>");
			}else{
				$("#tbody").append("<form id='detailForm' action='commuDetail.do?category2="+$("#categoryFilter option:selected").val()
						+"&search2="+$("#searchFilter option:selected").val()+"&keyword2="+$("#keywordFilter").val()+"&page="+currentPage+"' method='post'>"
						+"<input type='hidden' name='community_no' value='" + community_no + "'>"
						+"<input type='hidden' name='category' value='" + $("#categoryFilter option:selected").val() + "'>"
						+"<input type='hidden' name='search' value='" + $("#searchFilter option:selected").val() + "'>"
						+"<input type='hidden' name='keyword' value='" + $("#keywordFilter").val() + "'>"
						+"<input type='hidden' name='page' value='" + currentPage + "'>"
						+"</form>");
			}
			$("#detailForm").submit();
		
		return false;
	}
	
	//쿼리스트링 함수
   function getUrlParams() {
       var params = {};
       window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
       return params;
   }
	
 	//카테고리 변경시
	function categoryChange(){
		clickSearch(1);
		return false;
	}

</script>

</head>

<body>
	<div class="super_container">

		<!-- Home -->
		<div class="home" id="home">
			<div class="home_background parallax-window"
				style="background-image: url(/westival/resources/images/about_background.jpg)"></div>
			<div class="home_content">
				<div class="home_title">동행게시판</div>
			</div>
		</div>

		<!-- Intro -->

		<div class="intro">
			<div class="container">
				<div class="row">
					<div class="col">

						<br>
						<br>
						<!-- 검색 -->
						<div class="main">
							<div class="main_1 main_common">
								<p class="content">
									<select class="form-control" id="categoryFilter"
										name="category" style="width: 100%;" onchange="categoryChange();">
										<option value="all">분류</option>
										<option value="nomal">일반</option>
										<option value="accompany">동행</option>
									</select>
								</p>
							</div>
							<div class="main_2 main_common">
								<p class="content">
									<select class="form-control" id="searchFilter" name="search">
										<option value="all">전체</option>
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
									</select>
								</p>
							</div>
							<div class="main_3 main_common">
								<p class="content">
									<input class="form-control" id="keywordFilter" type="text"
										style="width: 400px;">
								</p>
							</div>
							<div class="main_3 main_common">
								<p class="content">
									<button id="searchBtn" class="btn btn-default" type="button"
										style="margin-bottom: 3px;" onclick="clickSearch(1)">조회</button>
								</p>
							</div>
							<div class="main_3 main_common">
								<p class="content">
									<button class="btn btn-default" type="button" id="allSearchBtn"
										style="margin-bottom: 3px;" onclick="location.href='commuPage.do'">전체조회</button>
								</p>
							</div>
						</div>
						<br>
						<br>
						<br>
						<!-- 게시판 -->
						<div class="qna_table">
							<div class="qna_table__body">
								<table class="table table-hover">
									<colgroup>
										<col width='7%'>
										<col width='10%'>
										<col width='*%'>
										<col width='8%'>
										<col width='10%'>
										<col width='7%'>
									</colgroup>
									<thead>
										<tr>
											<th>글번호</th>
											<th>분류</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
										</tr>
									</thead>

									<tbody id="tbody">
										<!-- <form id="detailForm" action="commuDetail.do" method="post"> -->
										<c:forEach items="${ list }" var="list">
											<tr>
												<td>${ list.community_no }</td>
												<td>${ list.category }</td>
												<td class="titleV" onclick="detailClick(${list.community_no});">${ list.title }
												</td>
												<td>${ list.user_id }</td>
												<td>${ list.community_date }</td>
												<td>${ list.read_count }</td>
											</tr>
										</c:forEach>
										<!-- </form> -->
									</tbody>

								</table>
							</div>
						</div>
						<button type="button" class="btn btn-light pull-right"
							id="writeBtn" onclick="writeBtnCilck();">글쓰기</button>
						<br>
						<br>
						<!-- 페이지 -->
						<div class="paginate">
							<ul class="pagination" style="justify-content: center;">
								<li class="page-item"><a class="page-link" href="#"
									style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>
								<c:forEach var="p" begin="${ paging.startPage }"
									end="${ paging.endPage }">
									<c:if test="${ p == paging.currentPage }">
										<li class="page-item"><a class="page-link"
											href="commuPage.do?page=${ p }"
											style="background: rgba(53, 10, 78, 0.6); color: white;">${ p }</a></li>
									</c:if>
									<c:if test="${ p != paging.currentPage }">
										<li class="page-item"><a class="page-link"
											href="commuPage.do?page=${ p }"
											style="color: rgba(53, 10, 78, 0.6);">${ p }</a></li>
									</c:if>
								</c:forEach>
								<li class="page-item"><a class="page-link" href="#"
									style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>
							</ul>
						</div>
						<!-- 페이지 끝 -->
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
	</div>

	
<!-- 	<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
	<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script> -->
	<script
		src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
	<script src="/westival/resources/plugins/easing/easing.js"></script>
	<script src="/westival/resources/js/custom.js"></script>

</body>
<c:import url="/WEB-INF/views/footer.jsp" />
</html>