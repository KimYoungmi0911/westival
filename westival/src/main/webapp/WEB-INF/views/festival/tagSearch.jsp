<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>태그 별 축제 페이지</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/Isotope/isotope.pkgd.min.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<script src="/westival/resources/js/offers_custom.js"></script>

<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/offers_responsive.css">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> <!-- 페이징 -->


<style type="text/css">
   
   
</style>

<script type="text/javascript">

   function scrap(no){
      
      console.log("스크랩버튼");
      $.ajax({
         url : "scrapCheck.do",
         data : { no : no },
         type : "post",
         success : function(result){   
            if(result == "insert"){
               alert("스크랩을 등록하였습니다.");
               location.reload();
            } else{
               alert("스크랩을 삭제하였습니다.")
               location.reload();
            }
         }         
      }); 
   }

</script>


<body>

<c:import url="/WEB-INF/views/header.jsp" />

<div class="super_container">
   
   <!-- Home -->
   <div class="home">
      <div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/tagbackground.jpg"></div>
      <div class="home_content">
         <div class="home_title">태그 별 축제 페이지</div>
      </div>
   </div>

   <!-- Offers -->

   <div class="offers" style="height:2000px;" >

      <!-- Offers -->
      <div class="container" >
        
         <div class="row">
         
            <div class="col text-center">
             <a href="searchFestivalPage.do">
                <div style="background-image:url(/westival/resources/images/contact_background.jpg); height:200px;">
                  <br><br><br><br>
                  <h2 style="font-weight:bold; color:white;">더 다양한 축제를 검색하려면 Click!</h2>
                </div>
             </a>   
               <br><br><br><br>
            
               <div class="section_title"><font color="pink">#${ tag }</font> 검색 결과</div>
               <br><br>
            </div>            
            
            <div class="col-lg-1 temp_col"></div>
            <br><br><br><br><br>
            
            <div class="col-lg-12">               

                  <!-- Offers Item -->
                  <c:forEach var="item" items="${ list }" varStatus="status">
                     <div class='offers_item'>
                        <div class='row'>
                        
                           <div class='col-lg-3 col-1680-4'>
                              <div class='offers_image_container'>
                                 <div class='offers_image_background' style="background-image:url(/westival/resources/uploadFiles/festivalImg/${ item.new_img_name });">
                                 </div>
                              </div>
                           </div>
                           
                           <div class='col-lg-8'>
                              <div class='offers_content'>
                                 <div class='offers_price'>${ item.name }
                                 </div>
                                 <p class='offers_text'>
                                    <font color="black">${ item.start_date }일 부터 ${ item.end_date }일 까지</font>
                                     <br> ${ item.content }
                                 
                                 </p>
                                 <div class='button book_button'>
                                    <c:url var="info" value="Info.do">
                                       <c:param name="no" value="${ item.no }" />
                                    </c:url>
                                    <a href='${ info }'>상세보기<span></span><span></span><span></span></a>
                                 </div>
                                 <div class='offer_reviews'>
                                    <div class='offer_reviews_content'>
                                       <div class="offer_reviews_subtitle"> ${ item.recommend } 명의 추천을 받았습니다.</div>
                                    </div>
                              
                                    <c:if test="${ scrap[status.index] eq 0}">
                                       <div class='offer_reviews_rating text-center' style="background-color:#f3f6f9;">
										   <a href='#' id='scrapCheck' onclick='scrap(${ item.no });'><img src="/westival/resources/images/jjim1.png"></a>
                                       </div>
                                    </c:if>   
                                    <c:if test="${scrap[status.index] eq 1}">
                                       <div class='offer_reviews_rating text-center' style="background-color:#f3f6f9;">
                                       		<a href='#' id='scrapCheck' onclick='scrap(${ item.no });'><img src="/westival/resources/images/jjim2.png"></a>
                                       </div>
                                    </c:if>                                 
                                 </div>
                                 
                              </div>
                           </div>
                           
                        </div>
                     </div>                     
                  </c:forEach>
                  
                 
                  <div align="center">
 
                  <div class="page-nation" >
                     <ul class="pagination pagination-large" id="todayPagination">
                     
                        <c:if test="${ currentPage <= 1 }">
                           <li class='disabled'><span>맨처음</span></li>
                     </c:if>
                     <c:if test="${ currentPage > 1 }">
                        <c:url var="tl" value="tagClick.do">
                           <c:param name="tag" value="${ tag }" />
                           <c:param name="page" value="1" />
                        </c:url>
                        <li><a href="${ tl }">맨처음</a></li>
                     </c:if>
                     
                     <c:if test="${ ((currentPage-10) >= 1) }">
                        <c:url var="tl2" value="tagClick.do">
                           <c:param name="tag" value="${ tag }" />
                           <c:param name="page" value="${ startPage-10 }" />
                        </c:url>
                        <li><a href='${ tl2 }'>이전</a></li>
                     </c:if>
                     <c:if test="${ ((currentPage-10) < 1) }">
                        <li class='disabled'><span>이전</span></li>
                     </c:if>
   
                     <c:forEach var="p" begin="${ startPage }" end="${ endPage }">      
                              <c:if test="${ p == currentPage}">
                                 <li class="active"><span>${ p }</span></li>
                              </c:if>
                              <c:if test="${ p != currentPage }">
                                 <c:url var="tl3" value="tagClick.do">
                                    <c:param name="tag" value="${ tag }" />
                                    <c:param name="page" value="${ p }" />
                                 </c:url>
                                 <li><a href="${ tl3 }">${ p }</a></li>
                              </c:if>
                           </c:forEach>
                     
                     <c:if test="${ ( (startPage+10) <= maxPage ) }">
                        <c:url var="tl4" value="tagClick.do">
                           <c:param name="tag" value="${ tag }" />
                           <c:param name="page" value="${ startPage+10 }" />
                        </c:url>
                        <li><a href='${ tl4 }'>다음</a></li>
                     </c:if>
                     <c:if test="${ ( (startPage+10) > maxPage ) }">
                        <li class='disabled'><span>다음</span></li>
                     </c:if>
                     
                     <c:if test="${ currentPage >= maxPage }">
                        <li class='disabled'><span>맨끝</span></li>
                     </c:if>
                     <c:if test="${ currentPage < maxPage }">
                        <c:url var="tl5" value="tagClick.do">
                           <c:param name="tag" value="${ tag }" />
                           <c:param name="page" value="${ maxPage }" />
                        </c:url>
                        <li><a href='${ tl5 }'>맨끝</a></li>
                     </c:if>
                

                     </ul>
                  </div>                     
                     
                  </div>
                  
            </div>  
                         
         </div>

      </div>
   </div>

</div>

</body>

</html>