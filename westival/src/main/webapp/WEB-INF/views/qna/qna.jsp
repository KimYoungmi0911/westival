<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/header.jsp" />

<!DOCTYPE html>
<html lang="ko">
<head>
<title>Travelix</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/main_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/about_responsive.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/responsive.css">
<style type="text/css">
	.intro {
		background-color: #fff;
		width: 100%;
    	padding-top: 40px;
    	padding-bottom: 40px;
    	color: black;
	}
	
	.searchDiv { text-align: center; }
	.searchDiv> * { display: inline-block; }
	#skeyword { width:270px; margin: 0 5px; }
	
	.table {
		border-bottom: 1px solid #f0f2f4;
		text-align:center;
	}
	
	.td4 { text-align:left; }
	
	.intro a:link { text-decoration: none; color:black; }
	.intro a:visited { text-decoration: none; color:black; }
	.intro a:hover { text-decoration: none; color:black; }
	.intro a:active { text-decoration: none; color:black; }
	
	#writeBtn { cursor:pointer; }
	
	.table img {
		width: 20px;
	}
	
	@media only all and (max-width: 1199px){
   		.qna_table { overflow-x: scroll; }
		.qnatable__body { white-space: nowrap; }
 		.searchDiv > * { display: block; }
		#skeyword { width:200px; margin: 0px; }
    }
</style>
</head>

<body>


<div class="super_container">
	
	<!-- Home -->
	<div class="home">
		<div class="home_background parallax-window" style="background-image:url(/westival/resources/images/about_background.jpg)"></div>
		<div class="home_content">
			<div class="home_title">QnA</div>
		</div>
	</div>
	
	<!-- Intro -->
	
	<div class="intro">
		<div class="container">
			<div class="row">
				<div class="col">
						
						<br><br>
						<!-- 검색 -->
						<div class="searchDiv" style="justify-content: center;">
							<select class="form-control" id="category" name="category" style="width:112.2px; height:38px;">
								<option value="total">분류</option>
								<option value="축제문의" >축제문의</option>
								<option value="티켓문의">티켓문의</option>
								<option value="환불문의" >환불문의</option>
								<option value="기타문의">기타문의</option>
							</select>
							<select class="form-control" id="search" name="search" style="width:97.8px; height:38px;">
								<option value="total">전체</option>
								<option value="subject" >제목</option>
								<option value="content">내용</option>
								<option value="user_id">작성자</option>
							</select>
							<input class="form-control" id="skeyword" type="text">
							<button class="btn btn-default" id="searchBtn" style="margin-bottom: 3px;">검색</button>
						</div>
						<br><br>
						
						<!-- 게시판 -->
						<div class="qna_table">
							<div class="qna_table__body">
								<table class="table table-hover">
								<colgroup>
									<col width='5%'>
									<col width='10%'>
									<col width='10%'>
									<col width='*%'>
									<col width='8%'>
									<col width='10%'>
									<col width='5%'>
								</colgroup>
								<thead>
									<tr>
										<th>번호</th>
										<th>분류</th>
										<th>상태</th>
										<th>제목</th>
										<th>작성자</th>
										<th>작성일</th>
										<th>조회</th>
									</tr>
									</thead>
									<tbody>
										<c:forEach items="${ list }" var="list">
											<tr>
												<td>${ list.qna_no }</td>
												<td>${ list.category }</td>
												<td>${ list.state }</td>
												<c:if test="${ list.active eq 'Y' }">
													<td class="td4"><a href="qnaDetail.do?no=${ list.qna_no }&page=${ currentPage }"><img src="resources/images/lock_open.png">${ list.subject }</a></td>
												</c:if>
												<c:if test="${ list.active eq 'N' }">
													<c:if test="${ member.user_id eq list.user_id or member.user_id eq 'admin' }">
														<td class="td4"><a href="qnaDetail.do?no=${ list.qna_no }&page=${ currentPage }"><img src="resources/images/lock_open.png">${ list.subject }</a></td>
													</c:if>
													<c:if test="${ member.user_id != list.user_id and member.user_id != 'admin' }">
														<td class="td4"><img src="resources/images/lock.png">${ list.subject }</td>
													</c:if>
												</c:if>
												<td>${ list.user_id }</td>
												<td>${ list.qna_date }</td>
												<td>${ list.read_count }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<a class="btn btn-light" href="qnaBoard.do?page=1">목록</a>
						<button type="button" class="btn btn-light pull-right" id="writeBtn">글쓰기</button>
						<br><br>
						<!-- 페이지 -->
							<div class="paginate">
									<ul class="pagination" style="justify-content: center;">
										<li class="page-item"><a class="page-link" href="#" style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>
										<c:forEach var="p" begin="${ startPage }" end="${ endPage }">
											<c:if test="${ p == currentPage }">
												<li class="page-item"><a class="page-link" href="qnaBoard.do?page=${ p }" style="background: rgba(53, 10, 78, 0.6);color: white;">${ p }</a></li>
											</c:if>
											<c:if test="${ p != currentPage }">
												<li class="page-item"><a class="page-link" href="qnaBoard.do?page=${ p }" style="color: rgba(53, 10, 78, 0.6);">${ p }</a></li>
											</c:if>
										</c:forEach>
										<li class="page-item"><a class="page-link" href="#" style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>
									</ul>
							</div>
					<!-- 페이지 끝 -->
				</div>
			</div>
		</div>
	</div>
	<br><br><br><br>
	<!-- Footer -->

   <footer class="footer" style="padding-top: 0px;">
      <div class="container">
         <div class="row">

            <!-- Footer Column -->
            <div class="col-lg-3 footer_column" style="height: 200px;">
               <div class="footer_col" style="width: 800px;">
                  <div class="footer_content footer_about">

                     <div class="logo">
                        <a href="#"><img src="" alt="">westival</a>
                     </div>
                     <p class="footer_about_text">&nbsp;&nbsp;&nbsp;westival은 다양한
                        문화생활을 즐기는 현대인들에게 여러가지 축제정보를 제공하고 자유롭게 공유 할 수 있는 공간입니다.</p>

                     <div class="footer_content footer_contact">

                        <ul class="contact_info_list">
                           <li class="contact_info_item d-flex flex-row">
                              <div class="footer_title">&nbsp;&nbsp;&nbsp;contact info</div>
                           </li>
                           <li class="contact_info_item d-flex flex-row">
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/placeholder.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">kh정보교육원&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/phone-call.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">1111-2222-3333&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/message.svg" alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">westival@gmail.com&nbsp;&nbsp;&nbsp;</div>
                              <div>
                                 <div class="contact_info_icon">
                                    <img src="/westival/resources/images/planet-earth.svg"
                                       alt="">
                                 </div>
                              </div>
                              <div class="contact_info_text">www.westival.com</div>

                           </li>

                        </ul>
                     </div>
                  </div>
               </div>
            </div>




         </div>
      </div>
   </footer>
</div>

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>


<script>
	/*jquery*/
	$(function(){
		userid = "${ member.user_id }";
		
		//쿼리스트링 값 가져오기
		var oParams = getUrlParams();
		var a = decodeURI(oParams.category);
		var b = decodeURI(oParams.search);
		var c = decodeURI(oParams.skeyword);
		var d = oParams.page;
		
		if( a != "undefined" && b != "undefined" && c != "undefined" ){
			searchQna(a, b, c, d);
			$("#category").val(a).prop("selected", true);
			$("#search").val(b).prop("selected", true);
			$("#skeyword").val(c);
		}
		
		//글쓰기 버튼
		$("#writeBtn").on("click", function(){
			if(userid != ""){
				location.href="qnaWriteForm.do";
			}else{
				alert("로그인 후 작성 가능합니다");
			}
		});
		
		//검색 엔터키 이벤트
        $("#skeyword").keydown(function(key){
           if(key.keyCode == 13){
              $("#searchBtn").click();
           }
        });
		
		//검색 버튼
		$("#searchBtn").on("click", function(){
			var categoryValue =$("#category").val();
			var searchValue = $("#search").val();
			var skeywordValue = $("#skeyword").val();
			
			if(skeywordValue == ""){
				alert("검색 키워드를 입력하세요.");
			}else{
				searchQna(categoryValue, searchValue, skeywordValue, 1);
			}
			
		});
	});
	
	//검색 함수
	function searchQna(categoryValue, searchValue, skeywordValue, Page){
		var userid = "${ member.user_id }";
			$.ajax({
				url: "qnaSearch.do",
				data: {category:categoryValue, search:searchValue, skeyword:skeywordValue, page:Page},
				type: "post",
				dataType: "json",
				success: function(obj){
					var objStr = JSON.stringify(obj);
		            var jsonObj = JSON.parse(objStr);
		               
		            var outValues= '';
		            var pageValues='';
		            
		            if(obj.totalCount == 0){
		            	 outValues += '<td colspan="7">검색 결과가 존재하지 않습니다.</td>';
		            }else{
		            	 for(var i in jsonObj.list){
		            		 outValues += '<tr><td>'+obj.list[i].qna_no+'</td>';
		            		 outValues += '<td>'+obj.list[i].category+'</td>';
		            		 outValues += '<td>'+obj.list[i].state+'</td>';
		            		 if(obj.list[i].active == 'Y'){
		            			 outValues += '<td class="td4"><a href="qnaDetail.do?no='+obj.list[i].qna_no+'&page='+obj.currentPage+'&category1='+obj.category+'&category2='+obj.search+'&keyword='+obj.skeyword+'">';
		            			 outValues += '<img src="resources/images/lock_open.png">'+obj.list[i].subject+'</td>';
		            		 }else{
		            			 if(userid == obj.list[i].user_id || userid == 'admin'){
			            			 outValues += '<td class="td4"><a href="qnaDetail.do?no='+obj.list[i].qna_no+'&page='+obj.currentPage+'&category1='+obj.category+'&category2='+obj.search+'&keyword='+obj.skeyword+'">';
			            			 outValues += '<img src="resources/images/lock_open.png">'+obj.list[i].subject+'</td>';
			            		 }else if(userid != obj.list[i].user_id && userid != 'admin'){
			            			 outValues += '<td class="td4"><img src="resources/images/lock.png">'+obj.list[i].subject+'</td>';
			            		 }
		            		 }
		            		 outValues += '<td>'+obj.list[i].user_id+'</td>';
		            		 outValues += '<td>'+obj.list[i].qna_date+'</td>';
		            		 outValues += '<td>'+obj.list[i].read_count+'</td></tr>';
		            	 }
		            }
		            
		            pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick=\'searchQna("'+categoryValue+'","'+searchValue+'","'+skeywordValue+'",1)\'; style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>';
		               for( p=1; p<=obj.endPage; p++ ){
		                  if( p == obj.currentPage ){
		                     pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick=\'searchQna("'+categoryValue+'","'+searchValue+'","'+skeywordValue+'","'+p+'")\'; style="background: rgba(53, 10, 78, 0.6);color: white;">'+p+'</a></li>';
		                  }else{
		                     pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick=\'searchQna("'+categoryValue+'","'+searchValue+'","'+skeywordValue+'","'+p+'")\'; style="color: rgba(53, 10, 78, 0.6);">'+p+'</a></li>';
		                  }
		               }
		               pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick=\'searchQna("'+categoryValue+'","'+searchValue+'","'+skeywordValue+'","'+obj.endPage+'")\'; style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>';
		            
		               
		            $(".table tbody").html(outValues);
		            $(".pagination").html(pageValues);
		            
				},
				error: function(request, status, errorData){
		               console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
		                     + "error : " + errorData);
		        }
			});
	}
	
	//쿼리스트링 함수
	function getUrlParams() {
	    var params = {};
	    window.location.search.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(str, key, value) { params[key] = value; });
	    return params;
	}
</script>

</body>

</html>