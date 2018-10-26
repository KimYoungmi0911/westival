<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
      background-color: f3f6f9;
      width: 100%;
      padding-top: 40px;
      padding-bottom: 40px;
   }
   
   .doc {
      position: relative;
       width: 1100px;
       margin: 0 auto;
   }
   
   .fesHead h3 {
      margin-bottom: 15px;
       padding: 0 0 0 20px;
       background: none;
       text-align: left;
       color: black;
       margin: 40px 0 25px;
       font-size: 32px;
   }
   
   .fesHead ul {
      position: absolute;
       top: 25px;
       right: 0;
       width: auto;
       margin-bottom: 0;
       text-align: center;
   }
   
   .fesHead ul li {
      display: inline-block;
       padding-left: 20px;
       font-size: 15px;
       color: #666;
   }
   
   ul {
      list-style: none;
         list-style-image: none;
   }
   
   .fesInfo detail {
      position: relative;
   }
   
   .fes_image img{
      position: relative;
       width: 544px;
       height: 362px;
       overflow: hidden;
      float: left;
   }
   
   .detailView {
      float: right;
      width:525px;
      display:block;
   }

   .detailView ul {
      border: solid #aaa;
       border-width: 3px 0 1px;
       border-top-color: #350a4e;
   }
   
   .detailView ul li {
      padding: 12px;
       border-top: 1px solid #dbdbdb;
   }
   
   .detailView ul li * {
      display: inline-block;
       vertical-align: top;
   }
   
   .detailView ul li b {
       width: 20%;
       color: #333;
   }
   
   .detailView ul li span {
      width: 75%;
       color: #333;
   }
   
   .buttonSection {
      float: right;
       width: 525px;
       margin-top: 20px;
       /* text-align: right; */
       padding-left: 222px;
   }
   
   .intro_button {
      position: unset;
      bottom: 0px;
       left: 0px;
   }
   
   .button {
      border-radius: 5px;
      width: 112px;
   }
   
   .button a {
      padding-left: 17px;
       padding-right: 17px;
       text-align: center;
       background: rgba(53, 10, 78, 0.6);
   }
   
   .fesInfoview2_head p, .photos_header p {
      display: inline-block;
       font-size: 22px;
       font-weight: bold;
       color: black;
   }

   .content-box {
      border: 1px solid #e6e6e6;
       background: #f9f9f9;
       padding: 20px 20px 10px 20px;
       line-height: 1.7;
       margin-bottom: 50px;
   }
   
   .content-box p {
      color: black;
   }
   
   .content_gido {
      background: linear-gradient(to right, #fa9e1b, #8d4fff);
      width: 100%;
       height: 800px;
       z-index: 10;
   }
   
   .content_gido-box {
      width: 1100px;
       margin: 0 auto;
       padding: 60px 0 100px;
       overflow: hidden;
   }
   
   .content_gido_head {
      margin-bottom: 20px;
       overflow: hidden;
   }
   
   .content_gido_head ul {
      float: left;
       margin-right: 20px;
       overflow: hidden;
   }
   
   .content_gido_head ul li:first-child {
      margin-left: 0;
   }
   
   .content_gido_head ul li {
      float: left;
      margin-left: 10px;
   }

   .placesList {
      float: right;
       width: 278px;
       height: 560px;
       overflow: auto;
   }

   .comment_frame {
      display: block;
       width: 1100px;
       margin: 0 auto;
       margin-bottom: 60px;
   }
   
   .comment_box {
      height: 165px;
       border: 1px solid #e0d7d2;
       background: #ccd5ea;
       padding: 20px;
   }
   
   .comment_textarea {
       float: left;
       padding: 10px 15px;
       border: 1px solid #dedede;
       background: #fff;
       width: 937px;
       height: 100px;
   }
   
   .comment_textarea textarea {
      padding: 0;
       margin: 0;
       border: 0;
       width: 905px;
       height: 77px;
   }
   
   .comment_btn {
      float: right;
       width: 110px;
       height: 100px;
       text-align: center;
   }
   
   .textCount {
      clear: both;
       display: block;
       text-align: right;
       margin-right: 120px;
       vertical-align: baseline;
       padding-top: 10px;
       color: #4a5c83;
   }
   
   .comment_listbox {
      clear: both;
       margin-top: 30px;
   }
   
   .ptext1 {
      font-size: 12px;
       color: #555;
   }
   
   .comment_list_rapper {
      margin-top: 10px;
   }
   
   .comment_list_rapper th {
      text-align: center;
      height: 1px;
   }
   
   .comment_list_rapper td {
      vertical-align: top;
       color: #444444;
       padding: 20px 0;
       border-bottom: 1px dotted #c2c2c2;
   }
   
   .comment_list_rapper .center {
       text-align: center;
   }
   
   .comment_list_rapper td.number {
      text-align: center;
       color: #4a6943;
   }
   
   .comment_list_rapper .comment_content {
       margin-top: 8px;
       clear: both;
       white-space: pre-line;
   }
   
   .hide {
      position: fixed;
       top: -10000px;
       left: -10000px;
   }
   
   .paginate {
      margin: 20px 0 0;
       text-align: center;
   }
   
   .btn-sm {
      padding: .10rem .5rem;
   }
   
   .chart_box {
	  position: relative;
	  padding: 31px 0 54px;
	  background: url(/westival/resources/images/bg_chart.gif) repeat-x;
	  text-align: center;
   }
   
   .graph_Wrap {
	  position: relative;
	  display: inline-block;
	  clear: both;
	}
	
	.test {
	  width: 100px;
	  height: 100px;
	  background: url("/westival/resources/images/man (2).png") no-repeat;
	  background-size: cover;
	}
	
	.wtest {
	  width: 100px;
	  height: 100px;
	  background: url("/westival/resources/images/woman (2).png") no-repeat;
	  background-size: cover;
	}
	
	.Man {
	  position: relative;
	  float: left;
	  width: 100px;
	  height: 100px;
	  top: 0;
	  display: inline-block;
	}
	
	.Woman {
	  position: relative;
	  float: left;
	  width: 100px;
	  height: 100px;
	  top: 0;
	  display: inline-block;
	}
	
	.Man .tgraph {
	  position: absolute;
	  bottom: 0;
	  left: 0px;
	  width: 100px;
	  display: inline-block;
	  font-size: 0;
	  background: url("/westival/resources/images/man (1).png") 0 100% no-repeat;
	  background-size: cover;
	}
	
	.Woman .tgraph {
	  position: absolute;
	  bottom: 0;
	  left: 0px;
	  width: 100px;
	  display: inline-block;
	  font-size: 0;
	  background: url("/westival/resources/images/woman (1).png") 0 100% no-repeat;
	  background-size: cover;
	}
	
	.Man .graph_num {
	 	color: #d82e2e;
	    top: -22px;
	    width: 100px;
	    position: absolute;
	    left: 0;
	    text-align: center;
	    white-space: nowrap;
	    font-size: 14px;
	    font-weight: 700;
	}
	
	.Woman .graph_num {
	  	color: #d82e2e;
	    top: -22px;
	    width: 100px;
	    position: absolute;
	    left: 0;
	    text-align: center;
	    white-space: nowrap;
	    font-size: 14px;
	    font-weight: 700;
	}
	
	.chart_age {
		margin-left: 60px;
	}
	
	.chart_age_progress {
		position: relative;
	    float: left;
	    margin-left: 28px;
	    width: 32px;
	    height: 130px;
	}
	
	.chart_age_progress_in {
		position: absolute;
	    bottom: 0;
	    left: 0;
	    right: 0;
	    background: #d9dee3;
	}
	
	.chart_age_per {
		color: black;
		top: -22px;
    	width: 40px;
    	margin-left: -5px;
    	position: absolute;
	    left: 0;
	    text-align: center;
	    white-space: nowrap;
	    font-size: 14px;
	    font-weight: 700;
	}
	
	.chart_age_cnt {
		position: absolute;
	    left: 0;
	    text-align: center;
	    white-space: nowrap;
	    font-size: 12px;
	    color: #353535;
	    bottom: -24px;
    	width: 100%;
	}
   
   /*지도 css*/
   .map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
   .map_wrap {position:relative;width:100%;height:562px;}
   #placesList li:first-child {border-top-width: 0; padding-top: 0;}
   #placesList li {list-style: none; color:#fff; border-top: 1px dashed #6c7faa; padding-top:15px;}
   #placesList li img {float: left; width: 20px; margin-right: 5px; max-width: 100%; border: 0; vertical-align: top;}
   #placesList .item {order-bottom:1px solid #888;min-height: 65px;}
   #placesList .item span {display: block;margin-top:4px;}
   #placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
   #placesList .item .info{padding:0 0 10px 0;}
   #placesList .info .gray {color:#8a8a8a;}
   #placesList .info .jibun {padding-left:26px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
   #placesList .info .tel {color:#fff;}
   #placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
   #placesList .item .marker_1 {background-position: 0 -10px;}
   #placesList .item .marker_2 {background-position: 0 -56px;}
   #placesList .item .marker_3 {background-position: 0 -102px}
   #placesList .item .marker_4 {background-position: 0 -148px;}
   #placesList .item .marker_5 {background-position: 0 -194px;}
   #placesList .item .marker_6 {background-position: 0 -240px;}
   #placesList .item .marker_7 {background-position: 0 -286px;}
   #placesList .item .marker_8 {background-position: 0 -332px;}
   #placesList .item .marker_9 {background-position: 0 -378px;}
   #placesList .item .marker_10 {background-position: 0 -423px;}
   #placesList .item .marker_11 {background-position: 0 -470px;}
   #placesList .item .marker_12 {background-position: 0 -516px;}
   #placesList .item .marker_13 {background-position: 0 -562px;}
   #placesList .item .marker_14 {background-position: 0 -608px;}
   #placesList .item .marker_15 {background-position: 0 -654px;}
   #pagination {margin:10px auto;text-align: center;}
   #pagination a {display:inline-block;margin-right:10px;}
   #pagination .on {font-weight: bold; cursor: default;color:#777;}
   .placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
   .placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
   .placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
   .placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
   .placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
   .placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
   .placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
   .placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff; background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
   .placeinfo .tel {color:#0f7833;}
   .placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
</head>

<body>


<div class="super_container">
   
   <!-- Home -->
   <div class="home">
      <div class="home_background parallax-window" style="background-image:url(/westival/resources/images/about_background.jpg)"></div>
      <div class="home_content">
         <div class="home_title">information</div>
      </div>
   </div>
   
   
   <!-- Intro -->
   <div class="intro">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="fesInfoview1">
                  <div class="doc">
                     <div class="fesHead">
                        <h3>${ festival.name }</h3>
                        <ul>
                           <li class="look">조회 : ${ festival.read_count } </li>
                           <li class="likeButton"><img id="recommendBtn" src="/westival/resources/images/like.png" style="width:25px;cursor:pointer;"title="좋아요"><span id="recommend">${ festival.recommend }</span></li>
                           <li class="scrap"><img id="scrapBtn" src="/westival/resources/images/bookmark.png" style="width:25px; cursor:pointer;"title="관심축제 등록"></li>
                        </ul>
                     </div>
                     
                     <div class="fesInfo detail">
                        <div class="fes_image">
                           <img src="/westival/resources/uploadFiles/festivalImg/${ festival.new_img_name }">
                        </div>
                        
                        <div class="detailView">
                           <ul>
                              <li>
                                 <b>기간</b>
                                 <span>${ festival.start_date } ~ ${ festival.end_date }</span>
                              </li>
                              <li>
                                 <b>위치</b>
                                 <c:set var="address" value="${ festival.address }" />
                                 <c:set var="address1" value="${ fn:substring(address, 0, fn:indexOf(address, '#')-1) }" />
                                 <span>${ address1 }</span>
                              </li>
                              <li>
                                 <b>장소</b>
                                 <c:set var="address2" value="${ fn:substring(address, fn:indexOf(address, '#')+1, fn:length(address)) }" />
                                 <span>${ address2 }</span>
                              </li>
                              <li>
                                 <b>연락처</b>
                                 <span>${ festival.telephone }</span>
                              </li>
                              <li>
                                 <b>주최/주관</b>
                                 <span> ${ festival.manage } </span>
                              </li>
                           </ul>
                        </div>
                        
                        <div class="buttonSection">
                           <c:if test="${ festival.ticket == 'Y' }">
                              <div class="button intro_button">
                                 <a id="find_gido" target="_blank" href="#">찾아오시는길</a>
                              </div>
                              <div class="button intro_button">
                                 <a href="ticketing.do?no=${ festival.no }">티켓구매</a>
                              </div>
                           </c:if>
                           <c:if test="${ festival.ticket == 'N' }">
                              <div class="button intro_button">
                                 <a id="find_gido" target="_blank" href="#">찾아오시는길</a>
                              </div>
                              <div class="button intro_button">
                                 <a class="notTicket" href="#">티켓구매</a>
                              </div>
                           </c:if>
                        </div>
                     </div>
                  </div>
               </div>   
            </div>
         </div>
      </div>
   </div>
   <!-- intro 끝 -->
   
   <!-- 상세정보 -->
   
   <div class="content" style="padding:60px;">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="fesInfoview2">
               
                  <div class="fesInfoview2_head">
                     <img src="/westival/resources/images/information.png" style="width:30px;">
                     <p>행사소개</p>
                  </div>
                  
                  <div class="content-box">
                  	<pre>${ festival.content }</pre>
                  </div>
                  
               </div>   
            </div>
         </div>
      </div>
   </div>
   
   <!-- 상세정보 끝 -->
   <!-- 지도 -->
   
   <div class="content_gido">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="content_gido-box">
                  <div class="content_gido_head">
                     <ul id="category">
                        <li id="AT4" data-order="0"><button id="categoryTour" class="btn btn-secondary" type="button" style="width: 90px; cursor:pointer;">관광명소</button></li>
                        <li id="FD6" data-order="1"><button id="categoryFood" class="btn btn-secondary" type="button" style="width: 90px; cursor:pointer;">음식점</button></li>
                        <li id="AD5" data-order="2"><button id="categoryStay" class="btn btn-secondary" type="button" style="width: 90px; cursor:pointer;">숙박</button></li>
                     </ul>
                     <p style="color:white">항목 선택·해제 버튼을 통해 주변관광 정보를 확인하실 수 있습니다.</p>
                  </div>
                  
                  <div class="content_gido_body">
                     <!-- <div class="map_wrap"> -->
                         <div id="map" class="map" style="position: relative; overflow: hidden; width: 797px; height: 562px; float: left;"></div>
                        <ul class="placesList" id="placesList"></ul>
                     <!-- </div> -->
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 지도 끝 -->
   
   <!-- 통계 -->
   <div class="photos" style="padding:60px;">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="photos_header">
                  <img src="/westival/resources/images/post.png">
                  <p>어떤 사람들이 좋아요를 눌렀을까요?</p>
               </div>
               <div class="chart_box">
	               <div class="graph_Wrap test">
						<div class="Man">
							<span id="GrapMale" class="tgraph" style="height:${ male }%"></span>
							<span class="graph_num">${ male }<em>%</em></span>
							<span class="chart_age_cnt">
								<span>남자</span>
							</span>
							<%-- <span class="graph_num" style="color:black;">남자<br><strong id="PerMale">${ male }%</strong></span> --%>
						</div>
					</div>
					<div class="graph_Wrap wtest">
						<div class="Woman">
							<span id="GrapFemale" class="tgraph" style="height:${ female }%"></span>
							<span class="graph_num">${ female }<em>%</em></span>
							<span class="chart_age_cnt">
								<span>여자</span>
							</span>
							<%-- <span class="graph_num" style="color:black;">여자<br><strong id="PerFemale">${ female }%</strong></span> --%>
						</div>
					</div>
					<div class="graph_Wrap chart_age">
						<div class="chart_age_progress">
							<span class="chart_age_progress_in" style="height:${ age.age10 }%">
								<span class="chart_age_per">${ age.age10 }<em>%</em></span>
							</span>
							<span class="chart_age_cnt">
								<span>10대↓</span>
							</span>
						</div>
						<div class="chart_age_progress">
							<span class="chart_age_progress_in" style="height:${ age.age20 }%">
								<span class="chart_age_per">${ age.age20 }<em>%</em></span>
							</span>
							<span class="chart_age_cnt">
								<span>20대</span>
							</span>
						</div>
						<div class="chart_age_progress">
							<span class="chart_age_progress_in" style="height:${ age.age30 }%">
								<span class="chart_age_per">${ age.age30 }<em>%</em></span>
							</span>
							<span class="chart_age_cnt">
								<span>30대</span>
							</span>
						</div>
						<div class="chart_age_progress">
							<span class="chart_age_progress_in" style="height:${ age.age40 }%">
								<span class="chart_age_per">${ age.age40 }<em>%</em></span>
							</span>
							<span class="chart_age_cnt">
								<span>40대</span>
							</span>
						</div>
						<div class="chart_age_progress">
							<span class="chart_age_progress_in" style="height:${ age.age50 }%">
								<span class="chart_age_per">${ age.age50 }<em>%</em></span>
							</span>
							<span class="chart_age_cnt">
								<span>50대↑</span>
							</span>
						</div>
					</div>
				</div>
            </div>
         </div>
      </div>
   </div>
   <!-- 통계 끝  -->
   
   <!-- 태그 -->
   <div class="tags" style="padding-bottom:60px;">
      <div class="container">
         <div class="row">
            <div class="col">
            	<div class="photos_header">
            		<img src="/westival/resources/images/post.png">
            		<p>관련 태그</p>
            	</div>
				<c:set var="token" value="${ festival.tag }" /> <!-- Display Each token -->
				<c:forTokens var="list" items="${token}" delims="#">
					<c:url var="tagClick" value="tagClick.do">
						<c:param name="tag" value="${ list }" />
					</c:url>
					&nbsp;&nbsp;&nbsp;<a href="${ tagClick }">#${ list }</a>
                </c:forTokens>
            </div>
         </div>
      </div>
   </div>
   <!-- 태그 끝 -->
   
   <!-- 댓글 -->
   <div class="comment">
      <div class="container">
         <div class="row">
            <div class="col">
               <div class="comment_frame">
                  <form id="commentInsert" action="" method="post">
                     <div class="comment_box">
                        <div class="comment_textarea">
                           <textarea id="festival_comment" name="reply_content"></textarea>
                        </div>
                        <div class="comment_btn">
                           <button id="formBtn" type="button" class="btn btn-dark" style="width: 100px; height: 100%;">보내기</button>
                        </div>
                        <span id="textCount" class="textCount">
                           <span id="wordCount" class="wordCount">0</span>
                           / 
                           <span id="maxCount" class="maxCount">200</span>
                           byte(200자 이하만 입력가능합니다.)
                        </span>
                     </div>
                     <input type="hidden" name="reply_user_id" value="${ member.user_id }">
                     <input type="hidden" name="festival_no" value="${ festival.no }">
                  </form>
               </div>
               
               <!-- 댓글 목록 -->
               <div class="comment_listbox">
                  <p class="ptext1"> * 총 <strong>${ totalCount }</strong>개의 <span>댓글이 등록되었습니다.</span></p>
                  <div class="comment_list_rapper">
                     <table width="100%" id="replyTable">
                        <colgroup>
                           <col style="width: 81px;">
                           <col>
                        </colgroup>
                        <thead>
                           <tr class="hide">
                              <th scope="col">댓글 번호</th>
                              <th scope="col">댓글</th>
                           </tr>
                        </thead>
                        <tbody>
                           <c:if test="${ reply.size() == 0 }">
                              <td colspan="2" class="center">등록된 메시지가 없습니다.</td>
                           </c:if>
                           <c:if test="${ reply.size() != 0 }">
                              <c:forEach var="result" items="${ reply }" varStatus="status">
                                 <tr>
                                    <td class="number">${ result.reply_seq }</td>
                                    <td>
                                       <div class="comment_writer">
                                          <span style="margin-right: 10px; font-weight: bold;">${ result.reply_user_id }</span> 작성일 : ${ result.reply_date }
                                          &nbsp;&nbsp;&nbsp;&nbsp;
                                          <c:if test="${ member.user_id == result.reply_user_id }">
                                             <button id="${ result.reply_seq }" type="button" class="btn btn-secondary btn-sm">수정</button>&nbsp;<button id="deleteBtn${ result.reply_seq }" type="button" class="btn btn-secondary btn-sm">삭제</button>
                                          </c:if>
                                       </div>
                                       <div class="comment_content">${ result.reply_content }</div>
                                       <div class="modify_content" style="display:none;margin-top:10px;"><textarea style="height:85px;width:700px">${ result.reply_content }</textarea></div>
                                       <div class="modify_contentBtn" style="display:none;margin-top:10px;"><button id="${ result.reply_seq }Btn" type="button" class="btn btn-secondary btn-sm">수정하기</button>&nbsp;<button id="cancelBtn${ result.reply_seq }" type="button" class="btn btn-secondary btn-sm">취소</button></div>
                                       <div id="${ result.reply_no }" style="display:none;"></div>
                                    </td>
                                 </tr>
                              </c:forEach>
                           </c:if>
                        </tbody>
                     </table>
                  </div>
               </div>
               <!-- 댓글 목록 끝 -->
               
               <!-- 페이지 -->
               <div class="paginate">
                     <ul class="pagination" style="justify-content: center;">
                        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList(${ festival.no },1);" style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>
                        <c:forEach var="p" begin="${ startPage }" end="${ endPage }">
                        <c:if test="${ p == currentPage }">
                           <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList(${ festival.no }, ${ p });" style="background: rgba(53, 10, 78, 0.6);color: white;">${ p }</a></li>
                        </c:if>
                        <c:if test="${ p != currentPage }">
                           <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList(${ festival.no }, ${ p });" style="color: rgba(53, 10, 78, 0.6);">${ p }</a></li>
                        </c:if>
                     </c:forEach>
                        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList(${ festival.no }, ${ endPage });" style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>
                     </ul>
               </div>
               <!-- 페이지 끝 -->
            </div>
         </div>
      </div>
   </div>
   
   <!-- 댓글 끝 -->
   <br><br><br><br>
</div>
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

<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/OwlCarousel2-2.2.1/owl.carousel.js"></script>
<script src="/westival/resources/plugins/easing/easing.js"></script>
<script src="/westival/resources/js/custom.js"></script>


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=19b698969a5fbbf08d3bddab4e1ceacc&libraries=services"></script>
<script>
   /*jquery*/
   $(function(){
      
      var userid = "${ member.user_id }";
      var number = "${ festival.no }";   //축제번호
      //var userid = "user01";   //유저아이디
      
      /* var festival_content = $(".content-box").text().replace(/(?:\r\n|\r|\n)/g, '<br />');
      $(".content-box").text(festival_content); */
      
      //로그인 한 유저의 스크랩 여부
      $.ajax({
         url : "selectScrap.do",
         data : { user_id: userid, no: number },
         type : "post",
         success: function(result){
            if(result == "ok"){
               $("#scrapBtn").attr("src", "/westival/resources/images/bookmark_after.png");
            }else{
               $("#scrapBtn").attr("src", "/westival/resources/images/bookmark.png");
            }
         },
         error: function(request, status, errorData){
            alert("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                  + "error : " + errorData);
         }
      });
      
      //티켓구매 버튼 이벤트
      $(".notTicket").on("click", function(){
         alert("티켓을 판매하지 않는 행사입니다.");
      });
      
      //추천 버튼 이벤트
      $("#recommendBtn").on("click", function(){
         if(userid != ''){
            $.ajax({
               url: "updateRecommend.do",
               data: { user_id: userid, no: number },
               type: "post",
               dataType: "json",
               success: function(jsonData){
                  var values = jsonData.recommend;
                  if(jsonData.result === "ok"){
                     alert("추천 했습니다.");
                  }else{
                     alert("추천 해제 되었습니다.");
                  }
                  $("#recommend").html(values);
               },
               error: function(request, status, errorData){
                  alert("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
               }
            });   
         }else{
            alert("로그인 필요한 서비스입니다.");
         }
      });
      
      //스크랩 버튼 이벤트
      $("#scrapBtn").on("click", function(){
         if(userid != ''){
            $.ajax({
               url: "updateScrap.do",
               data: { user_id: userid, no: number },
               type: "post",
               success: function(result){
                  if(result == "ok"){
                     alert("관심축제로 등록 되었습니다.");
                     $("#scrapBtn").attr("src", "/westival/resources/images/bookmark_after.png");
                  }else{
                     alert("관심축제를 해제합니다.");
                     $("#scrapBtn").attr("src", "/westival/resources/images/bookmark.png");
                  }
               },
               error: function(request, status, errorData){
                  alert("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
               }
            });   
         }else{
            alert("로그인 필요한 서비스입니다.");
         }
      });
      
      //textarea 로그인 체크 이벤트
      $("#festival_comment").focus(function(){
         if(userid == ''){
            alert("로그인 후 작성 가능합니다.");
            $(this).blur();   
         }
      });
      
      //textarea 글자수 이벤트
      $("#festival_comment").keyup(function(e){
         var content = $(this).val();
         $("#wordCount").html(content.length);
         
         if(content.length > 200){
            alert("200자 이하만 입력 가능합니다.");
            $(this).val(content.substr(0,200));
            $(this).focus();
         }
      });
      $("#festival_comment").keyup();
      
      //댓글 입력 이벤트
      $("#formBtn").on("click", function(){
    	  var formData = $("#commentInsert").serialize();
    	  if(userid == ''){
              alert("로그인 후 등록 가능합니다.");
           }else{
        	   if($("#festival_comment").val() == ''){
        		   alert("내용을 입력하세요.");
        	   }else{
        		   $.ajax({
                       url: "insertReply.do",
                       data: formData,
                       type: "post",
                       success: function(result){
                          if(result == "fail")
                             alert("실패");
                          callReplyList(number, 1);
                          $("#festival_comment").val("");
                          $("#wordCount").text("0");
                       },
                       error: function(request, status, errorData){
                          console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                                + "error : " + errorData);
                       }
                    });
        	   }
           }
      });
      modifyReply(1, ${ totalCount } );
   });
   
   //댓글 수정
   function modifyReply(page, totalCount){
      var number = "${ festival.no }";
      
      for(i=1; i<=$(".number:first").text(); i++){
         var selector = '#' + i;
         var Btnselector = '#' + i + 'Btn';
         var cancelSelector = '#cancelBtn'+i;
         var deleteSelector = '#deleteBtn'+i;
         var replyseq;
         var content;
         var textarea;
         var textareaValue;
         var replyno;
         
         $(selector).on("click", function(){
            replyseq = $(this).attr("id");
            content = $(this).parents().next("div:first");
            textarea = content.next("div");
            var textareaBtn = textarea.next("div");
            replyno = textareaBtn.next("div").attr("id");
            content.css("display", "none");
            textarea.css("display", "");
            textareaBtn.css("display", "");
            
         });
         
         $(Btnselector).on("click", function(){
            var reply_btn = $(this).attr("id");
            textareaValue = textarea.children().val();
            
            $.ajax({
               url: "updateReply.do",
               data: { reply_no: replyno, reply_content:textareaValue },
               type: "post",
               success: function(result){
                  if(result == "ok")
                     alert("수정완료");
                  callReplyList(number, page);
               },
               error: function(request, status, errorData){
                  console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                        + "error : " + errorData);
               }
            });
         });
         
         $(cancelSelector).on("click", function(){
            var textareaBtn = textarea.next("div");
            content.css("display", "");
            textarea.css("display", "none");
            textareaBtn.css("display", "none");
         });
         
         $(deleteSelector).on("click", function(){
            replyno = $(this).parents().next("div:first").next("div").next("div").next("div").attr("id");
            
            if(confirm("정말 삭제하시겠습니까?") == true){
               $.ajax({
                  url: "deleteReply.do",
                  data: { reply_no: replyno },
                  type: "post",
                  success: function(result){
                     if(result == "ok")
                        alert("삭제완료");
                     callReplyList(number, page);
                  },
                  error: function(request, status, errorData){
                     console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                           + "error : " + errorData);
                  }
               });
            }else{
               return false;
            }
            
            
         });
      }
   }
//댓글 목록, 페이지 함수
   function callReplyList(a, b){
      userid = "${ member.user_id }";
      $(function(){
         $.ajax({
            url: "selectReply.do",
            data: {no: a, page: b},
            type: "post",
            dataType: "json",
            success: function(obj){
               var objStr = JSON.stringify(obj);
               var jsonObj = JSON.parse(objStr);
               
               var outValues= '';
               var pageValues='';
               
               if(obj.totalCount == 0){
                  outValues += '<td colspan="2" class="center">등록된 댓글이 없습니다.</td>';
               }else{
                  for(var i in jsonObj.list){
                     outValues += '<tr><td class="number">'+obj.list[i].reply_seq+'</td>';
                     outValues += '<td><div class="comment_writer">';
                     outValues += '<span style="margin-right: 10px; font-weight: bold;">'+decodeURIComponent(obj.list[i].reply_user_id)+'</span> 작성일 : '+obj.list[i].reply_date+'';
                     if(userid == obj.list[i].reply_user_id){
                        outValues += '&nbsp;&nbsp;&nbsp;&nbsp;<button id="'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">수정</button>&nbsp;<button id="deleteBtn'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">삭제</button></div>';   
                     }
                     outValues += '<div class="comment_content">'+decodeURIComponent(obj.list[i].reply_content)+'</div>';
                     outValues += '<div class="modify_content" style="display:none;margin-top:10px;"><textarea style="height:85px;width:700px">'+decodeURIComponent(obj.list[i].reply_content)+'</textarea></div>';
                     outValues += '<div class="modify_contentBtn" style="display:none;margin-top:10px;"><button id="'+obj.list[i].reply_seq+'Btn" type="button" class="btn btn-secondary btn-sm">수정하기</button>&nbsp;<button id="cancelBtn'+obj.list[i].reply_seq+'" type="button" class="btn btn-secondary btn-sm">취소</button></div>';
                     outValues += '<div id="'+obj.list[i].reply_no+'" style="display:none;"></div></td></tr>';
                  }
               }
               
               pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList('+a+',1);" style="color: rgba(53, 10, 78, 0.6);">&laquo;</a></li>';
               for( p=1; p<=obj.endPage; p++ ){
                  if( p == obj.currentPage ){
                     pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList('+a+', '+p+');" style="background: rgba(53, 10, 78, 0.6);color: white;">'+p+'</a></li>';
                  }else{
                     pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList('+a+', '+p+');" style="color: rgba(53, 10, 78, 0.6);">'+p+'</a></li>';
                  }
               }
               pageValues += '<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="callReplyList('+a+', '+obj.endPage+');" style="color: rgba(53, 10, 78, 0.6);">&raquo;</a></li>';
               
               $("#replyTable tbody").html(outValues);
               $(".pagination").html(pageValues);
               $(".ptext1 > strong").text(obj.totalCount);
               
               modifyReply(obj.currentPage, obj.totalCount);

            },
            error: function(request, status, errorData){
               console.log("error code : " + request.status + "\n" + "message : " + request.responseText + "\n"
                     + "error : " + errorData);
            }
         });
      });
   }

   /*지도 스크립트*/
   // 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
   var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
       contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
       markers = [], // 마커를 담을 배열입니다
       currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
    
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new daum.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
           level: 5 // 지도의 확대 레벨
       };  
   
   // 지도를 생성합니다    
   var map = new daum.maps.Map(mapContainer, mapOption); 
   
   // 장소 검색 객체를 생성합니다
   var ps = new daum.maps.services.Places(map); 
   
   // 지도에 idle 이벤트를 등록합니다
   daum.maps.event.addListener(map, 'idle', searchPlaces);
   
   // 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
   contentNode.className = 'placeinfo_wrap';
   
   // 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
   // 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
   addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
   addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);
   
   // 커스텀 오버레이 컨텐츠를 설정합니다
   placeOverlay.setContent(contentNode);  
   
   // 각 카테고리에 클릭 이벤트를 등록합니다
   addCategoryClickEvent();
   
   // 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
   function addEventHandle(target, type, callback) {
       if (target.addEventListener) {
           target.addEventListener(type, callback);
       } else {
           target.attachEvent('on' + type, callback);
       }
   }
   
   /* 지도 중심 좌표 */
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new daum.maps.services.Geocoder();
   
   //지도 중심좌표 변수 선언
   var coords;
   
   //좌표 검색할 주소
   var address = "${ address1 }";
   
   //위도, 경도
   var fes_lat;
   var fes_long;
   
   // 주소로 좌표를 검색합니다
   //geocoder.addressSearch('부산광역시 금정구 장전온천천로 48', function(result, status) {
   geocoder.addressSearch(address, function(result, status) {
       // 정상적으로 검색이 완료됐으면 
        if (status === daum.maps.services.Status.OK) {
   
           coords = new daum.maps.LatLng(result[0].y, result[0].x);
           
           //console.log(coords);
           
           // 결과값으로 받은 위치를 마커로 표시합니다
           var marker = new daum.maps.Marker({
               map: map,
               position: coords
           });
        
           // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
           map.setCenter(coords);
         
           fes_lat = coords.getLat();
           fes_long = coords.getLng();
           
           //찾아가는길 링크 만들기
           var link1 = "http://map.daum.net/link/to/"+address+","+fes_lat+","+fes_long;
           
           $(function(){
              $("#find_gido").attr("href", link1);
           });
           
       } 
   });
   
   // 카테고리 검색을 요청하는 함수입니다
   function searchPlaces() {
       if (!currCategory) {
           return;
       }
       
       // 커스텀 오버레이를 숨깁니다 
       placeOverlay.setMap(null);
   
       // 지도에 표시되고 있는 마커를 제거합니다
       removeMarker();
       
       ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
   }
   
   // 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
   function placesSearchCB(data, status, pagination) {
      
       if (status === daum.maps.services.Status.OK) {
   
           // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
           displayPlaces(data);
           
       } else if (status === daum.maps.services.Status.ZERO_RESULT) {
           // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
          alert('해당 주소가 존재하지 않습니다.');
           return;
           
       } else if (status === daum.maps.services.Status.ERROR) {
           // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
          alert('해당 주소가 존재하지 않습니다.');
           return;
       }
   }
   
	// 지도에 마커를 표출하는 함수입니다
	function displayPlaces(places) {
		var listEl = document.getElementById('placesList'),
	    fragment = document.createDocumentFragment();
		
		// 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
		
	    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
	    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
	    var order = document.getElementById(currCategory).getAttribute('data-order');
	
	    for ( var i=0; i<places.length; i++ ) {
	
	            // 마커를 생성하고 지도에 표시합니다
	            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order),
	    	    /* itemEl = displayPlaceInfo(places[i], order); */
	    	    itemEl = getListItem(places[i], order);
	
	            // 마커와 검색결과 항목을 클릭 했을 때
	            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
	            (function(marker, place) {
	                daum.maps.event.addListener(marker, 'click', function() {
	                    displayPlaceInfo(place, order);
	                });
	            })(marker, places[i]);

	         fragment.appendChild(itemEl);
	    }
	    
	 // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
	    listEl.appendChild(fragment);
	 
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, order) {
		var imageSrc;
		
		if ( order == 0){
			imageSrc = '/westival/resources/images/icon_map_tour.png'; // 마커 이미지 url
		}else if ( order == 1){
			imageSrc = '/westival/resources/images/icon_map_food.png';
		}else if ( order == 2){
			imageSrc = '/westival/resources/images/icon_map_stay.png';
		}

	     var imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
	        imgOptions =  {
	            /* spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
	            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표 */
	            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new daum.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(place, order) {
		var itemStr;
		
		//이미지 아이콘
		if ( order == 0){
			itemStr = '<img src="/westival/resources/images/icon_map_tour.png">'; // 마커 이미지 url
		}else if ( order == 1){
			itemStr = '<img src="/westival/resources/images/icon_map_food.png">';
		}else if ( order == 2){
			itemStr = '<img src="/westival/resources/images/icon_map_stay.png">';
		}
		
		//관광명소 등 목록  표시
		var el = document.createElement('li');
		itemStr +=
			'<div class="info">' +
           '   <h5><b>' + place.place_name + '</b></h5>';
           
		if (place.road_address_name) {
		    itemStr += '    <span>' + place.road_address_name + '</span>';
		} else {
		    itemStr += '    <span>' +  place.address_name  + '</span>'; 
		}
		             
		  itemStr += '  <span class="tel">' + place.phone  + '</span>' +
		            '</div>';
		            
		 el.innerHTML = itemStr;
		 el.className = 'item';
		 
		 return el;
	}
	
	// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
	function displayPlaceInfo (place) {
		
	    var content = '<div class="placeinfo">' +
	                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
	
	    if (place.road_address_name) {
	        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
	                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
	    }  else {
	        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
	    }                
	   
	    content += '    <span class="tel">' + place.phone + '</span>' + 
	                '</div>' + 
	                '<div class="after"></div>';
	
	    contentNode.innerHTML = content;

	    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
	    placeOverlay.setMap(map);
	    
	    
	}
	

	// 각 카테고리에 클릭 이벤트를 등록합니다
	function addCategoryClickEvent() {
	    var category = document.getElementById('category'),
	        children = category.children;
	
	    for (var i=0; i<children.length; i++) {
	        children[i].onclick = onClickCategory;
	    }
	}
	
	// 카테고리를 클릭했을 때 호출되는 함수입니다
	function onClickCategory() {
	    var id = this.id,
	        className = this.className;
	
	    placeOverlay.setMap(null);
	
	    if (className === 'on') {
	        currCategory = '';
	        changeCategoryClass();
	        removeMarker();
	    } else {
	        currCategory = id;
	        changeCategoryClass(this);
	        searchPlaces();
	    }
	}
	
	// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
	function changeCategoryClass(el) {
	    var category = document.getElementById('category'),
	        children = category.children,
	        i;
	
	    for ( i=0; i<children.length; i++ ) {
	        children[i].className = '';
	    }
	
	    if (el) {
	        el.className = 'on';
	    } 
	} 
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}

</script>

</body>

</html>