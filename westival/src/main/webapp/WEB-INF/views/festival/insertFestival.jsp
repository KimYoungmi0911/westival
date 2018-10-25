<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>축제 등록 페이지</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Travelix Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/bootstrap4/bootstrap.min.css">
<link href="/westival/resources/plugins/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_styles.css">
<link rel="stylesheet" type="text/css" href="/westival/resources/styles/contact_responsive.css">
<script src="/westival/resources/js/jquery-3.2.1.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script> <!-- Daum API -->

<style type="text/css">
   .red{
       color:red;
   }
   .form-area:after {
      content: "";
      position : absolute;
      z-index: 1;
      width: 350px;
      height: auto;
      background : red;
      content: "New";
      text-align : center;
      color:#fff;
      font-family: 'Arial';
      font-weight:bold;
      font-size : 25px;
      padding: 10px 30px;
      left: -80px;
      top: 30px;
      transform:rotate(-30deg);
      box-shadow: 0 4px 3px rgba(0, 0, 0, 0.3);
      
   }
   .form-area
   {
      width: 80%;
      align:left;
       background-color: #FFCD12;
      padding: 1px 10px 40px 60px;
      margin: 10px 0px 60px;
      border: 0px solid;
      position: relative;
      overflow:hidden;
      display:inline-block
   }
   
   h3, div{
      color:black;
   }
   
   /* a {
      background-color:#d5d5d0;
      border-color:#d5d5d0;
      border: 1px solid #ced4da;
      display: inline-block;
      height: 30px;
      border-radius: 3px;
      overflow: hidden;
      border-color:#929285;
   } */
   
   #tagResult {
      background-color:#d5d5d0;
      border-color:#d5d5d0;
      border: 1px solid #ced4da;
      display: inline-block;
      height: 30px;
      border-radius: 3px;
      overflow: hidden;
      border-color:#929285;
   }
   
   a:hover {
      color:#ffffff;
      background-color:#929285;
      border: 1px solid #ced4da;
      
   }
   
   .form-1, .chkbox_area, .tagbox_area, .tag_area{
       display: block;
       padding: .375rem .75rem;
       font-size: 1rem;
       line-height: 1.5;
       color: #495017;
       background-color: #fff;
       background-image: none;
       background-clip: padding-box;
       border: 1px solid #ced4da;
       border-radius: .25rem;
       transition: border-color cubic-bezier(0.4, 0, 1, 1) .15s,box-shadow ease-in-out .15s;
   }
   
   
   .tagbox_area{
       height: 120px;
       overflow:auto;
   }

   .tag_area{
       height: 80px;
       overflow:auto;
   }
   
   #ticket{
      width: 20%;
   }
   #start_date, #end_date, .chkbox_area{
      width: 30%;
   }
   #telephone, #manage{
      width: 40%;
   }
   #name, #file_name, #original_img_name{
      width: 50%;
   }
   #content, #theme, #address, #address2, .tagbox_area{
      width: 80%;
   }
   
   #home{
      height:90%;
      display:block;
   }
   
   .home_background {
      position:relative;
   }
   
   #a_ticket, #a_tag{
      background-color:#f1f1f1;
   }
   
   /* 스크롤 제거 */
    input[type=number]::-webkit-inner-spin-button,
    input[type=number]::-webkit-outer-spin-button {
        -webkit-appearance: none;             
        margin: 0;         
    } 


</style>

<script type="text/javascript">

   function sample6_execDaumPostcode() {
       new daum.Postcode({
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
               // 각 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullAddr = ''; // 최종 주소 변수
               var extraAddr = ''; // 조합형 주소 변수
   
               // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
               if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                   fullAddr = data.roadAddress;
                   console.log(data.sido);
   
               } else { // 사용자가 지번 주소를 선택했을 경우(J)
                   fullAddr = data.jibunAddress;
                   console.log(data.sido);
               }
   
               // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
               if(data.userSelectedType === 'R'){
                   //법정동명이 있을 경우 추가한다.
                   if(data.bname !== ''){
                       extraAddr += data.bname;
                   }
                   // 건물명이 있을 경우 추가한다.
                   if(data.buildingName !== ''){
                       extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                   fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
               }
   
               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               //document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('address').value = fullAddr;
   
               // 커서를 주소 필드로 이동한다.
               document.getElementById('address').focus();
            
           }
       }).open();
   }
   
   // 상세 내용 글자수
   $(function(){ 
       $('#characterLeft').text('2000 글자가 남았습니다.');
       $('#content').keydown(function () {
           var max = 2000;
           var len = $(this).val().length;
           if (len >= max) {
               $('#characterLeft').text('제한 된 글자수를 넘겼습니다.');
               $('#characterLeft').addClass('red');
               $('#btnSubmit').addClass('disabled');            
           } 
           else {
               var ch = max - len;
               $('#characterLeft').text(ch + ' 글자가 남았습니다.');
               $('#btnSubmit').removeClass('disabled');
               $('#characterLeft').removeClass('red');            
           }
       });    
   });
   
   function insertFestival(){
      if($("#start_date").val() > $("#end_date").val()){
         alert("날짜를 확인해주세요.");
         return false;
      } else if ($(":checkbox[name='theme']:checked").length==0){
         alert("빈칸을 확인해주세요.")   
         return false;
      } else{
         alert("축제가 등록 되었습니다.");
         document.insertFestival.submit(); // 폼태그 전송
      }
   }
   
   // 티켓 등록
   function ticketInsert(){      
      if($("#m_ticket_name").val() != '' && $("#m_ticket_price").val() != '' && $("#m_ticket_quantity").val() != '' && $("#m_company_name").val() != '' &&
            $("#m_ceo_name").val() != '' && $("#m_company_no").val() != '' && $("#m_phone").val() != '' && $("#m_bank_name").val() != '' &&
            $("#m_account_holder_name").val() != '' && $("#m_account_no").val() != ''){
         
         if(($("#m_ticket_price").val()%100) != 0 ){
            alert("티켓 가격을 확인해주세요.");
            return false;
         } else if($("#m_ticket_quantity").val()< 10 ) {
            alert("티켓 수량을 확인해주세요.");
            return false;
         } else if($("#m_company_no").val() < 999999999 || $("#m_company_no").val() > 10000000000 ) {
            alert("사업자번호를 확인해주세요.");
            return false;
         } else{
            $("#ticketModal").modal("hide"); // modal창 닫기
            $("#a_ticket").click(function () {return false;}); // modal창 못열게 a태그 막기
            $("#ticketDiv").html("<font color='red'>" + "티켓 등록이 완료되었습니다." + "</font>");
            
            $('#ticket_name').val($("#m_ticket_name").val());
            $('#ticket_price').val($("#m_ticket_price").val());
            $('#ticket_quantity').val($("#m_ticket_quantity").val());
            $('#company_name').val($("#m_company_name").val());
            $('#ceo_name').val($("#m_ceo_name").val());
            $('#company_no').val($("#m_company_no").val());
            $('#phone').val($("#m_phone").val());
            $('#bank_name').val($("#m_bank_name").val());
            $('#account_holder_name').val($("#m_account_holder_name").val());
            $('#account_no').val($("#m_account_no").val());
         } 
      } else{
         alert("빈칸을 확인해주세요.");
      }      
   }
   
   function addTag(){
      if($("#inputTag").val().length==0){
         alert("태그를 입력해주세요");
      } else{         
         var tagArray = ($("#tagbox_area").html()).split(" "); // 중복값 체크 위한 값 받아옴
         for(i=0; i<tagArray.length-1; i++){
            if(tagArray[i].substring(1)==$("#inputTag").val()){
               alert("이미 입력한 태그입니다.");
               return;
            }
         }         
         var inputTag = "#" + $("#inputTag").val()+" ";
         $("#tagbox_area").html($("#tagbox_area").html() + inputTag);
         document.getElementById("inputTag").value = '';
      }
   }
   
   function deleteTag(){
      $("#tagbox_area").html("");
   }
      
   function tagInsert(){
      var tagArray = ($("#tagbox_area").html()).split(" "); // 값 받아옴
      var tagDiv=""; // 태그 textarea에 표시할 값
      var tagInputValue=""; // 전송보낼 값
      var i;
      
      for(i=0; i<tagArray.length-1; i++){
         tagInputValue += tagArray[i];
         tagDiv +=  "<div id='tagResult'>" + tagArray[i] + "</div>&nbsp;";
      }    
      
      $('#tag').val(tagInputValue);
      $("#tag_area").html(tagDiv);
      $("#tagModal").modal("hide"); // modal창 닫기 
   }
   
</script>

</head>
<body>

<c:import url="/WEB-INF/views/header.jsp" />

<div class="super_container">
   
   
   <!-- Home -->
   <div class="home" id="home">
      <div class="home_background parallax-window" data-parallax="scroll" data-image-src="/westival/resources/images/contact_background.jpg"></div>
      <div class="home_content">
         <div class="home_title"></div>
      </div>
   </div>
   
   <div class="contact_form_section">
      <div class="container">
         <c:if test="${sessionScope.member != null }">
         <div class="row">
            <div class="col">   
               <div class="container" align="center">
               
                   <div class="form-area">  
                       <form action="insertFestival.do" method="post" id="insertFestival" enctype="multipart/form-data">
                          <br style="clear:both">
                          <br><br><br>
                          <h2 style="margin-bottom: 25px; text-align: center; font-weight:bold">Festival registration!&nbsp;&nbsp;</h2>
                           <br><br>
                          <div class="form-group" align="left" style="font-weight:bold">
                             * 축제명 &nbsp;&nbsp; <input type="text" class="form-1" id="name" name="name" required><br>
                           * 축제 주소
                           <div class="form-inline form group" align="left">
                              <input type="text" class="form-1" id="address" name="address" required readonly>&nbsp;
                              <input type="button" class="btn btn-primary" onclick="sample6_execDaumPostcode()" value="주소 찾기"
                              style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:15%"><br>
                              <input type="text" class="form-1" id="address2" name="address2" placeholder="상세주소" required >
                           </div>
                           
                           <!-- <input type="button" class="btn btn-primary pull-center"  value="ID/PASSWORD 찾기" id="" onclick=""
                            style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:50%"> -->
                           
                           
                           
                           <br>
                           * 대표 이미지<input type="file" accept="image/*" class="form-1" id="img_name" name="img_name" required><br>
                        </div>
                        <div class="form-group" align="left" style="font-weight:bold">
                           * 상세 내용<textarea class="form-control" id="content" name="content" maxlength="2000" rows="7" required></textarea>
                              <p id="characterLeft" class="help-block"> You have reached the limit</p>                    
                          </div>
                          <div class="form-group" align="left" style="font-weight:bold">
                          <table>
                          <thead>
                          <tr>
                          <th>
                             * 시작일<input style= "width:200px"; type="date" class="form-1" id="start_date" name="start_date" required><br>
                             </th>
                             <th>
                             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                             </th>
                             <th>
                             
                             * 종료일<input style= "width:200px"; type="date" class="form-1" id="end_date" name="end_date" required><br>
                             </th>
                             
                          </tr>
                          </thead>
                          </table>
                          
                          
                             * 테마                          
                             <div class="chkbox_area" style= "width:350px; background-color: #FFCD12; border: 0px solid;"  >
                                <input type="checkbox" name="theme" value="축제" style="transform: scale(2);">&nbsp;&nbsp;축제&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="theme" value="파티" style="transform: scale(2);">&nbsp;&nbsp;파티&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="theme" value="전시회" style="transform: scale(2);">&nbsp;&nbsp;전시회&nbsp;&nbsp;&nbsp;&nbsp;
                                <input type="checkbox" name="theme" value="공연" style="transform: scale(2);">&nbsp;&nbsp;공연
                             </div>
                         </div>
                           <div class="form-group" align="left" style="font-weight:bold">                        
                            * 연락처<input type="text" class="form-1" id="telephone" name="telephone" required><br>
                             * 주최/주관<input type="text" class="form-1" id="manage" name="manage" required><br>
                             티켓 등록
                             <div class="form-inline form group" align="left">
                                <a id="a_ticket" data-toggle="modal" data-target="#ticketModal" class="center-block btn"
                                   style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:15%; color:white">티켓 등록</a>
                                
                                &nbsp;&nbsp;
                                <div id="ticketDiv" style="font-family:'Open Sans', sans-serif;">티켓이 등록되지 않았습니다.</div>
                            </div>
                            </div>
                         <div class="form-group" align="left" style="font-weight:bold">
                             첨부파일<input type="file" class="form-1" id="attached" name="attached"><br>
                             태그
                             <div class="form-inline form group" align="left" style="font-weight:bold">
                                <div class="tag_area" id="tag_area" style="width:80%;"></div>&nbsp;
                                <a id="a_tag" data-toggle="modal" data-target="#tagModal" class="center-block btn"
                                   style="background: #350a4e; border:0px solid; font-family: 'Open Sans', sans-serif; width:15%; color:white">태그 등록</a>
                                <input type="hidden" id="tag" name="tag" value="">
                             </div>
                        </div>
                        
                        <input id="ticket_name" name="ticket_name" type="hidden">
                        <input id="ticket_price" name="ticket_price" type="hidden">
                        <input id="ticket_quantity" name="ticket_quantity" type="hidden">
                        <input id="company_name" name="company_name" type="hidden">
                        <input id="ceo_name" name="ceo_name" type="hidden">
                        <input id="company_no" name="company_no" type="hidden">
                        <input id="phone" name="phone" type="hidden">
                        <input id="bank_name" name="bank_name" type="hidden">
                        <input id="account_holder_name" name="account_holder_name" type="hidden">
                        <input id="account_no" name="account_no" type="hidden">
                        <br>

                        <input type="submit" id="submit" class="btn btn-primary btn-lg pull-center" value="등록하기" onClick="insertFestival(); return false;"
                           style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; width:25%; font-weight:bold">&nbsp;&nbsp;&nbsp;
                     </form>
                  </div>
                  
                  
               </div>
            </div>
         </div>
         </c:if>
         <c:if test="${sessionScope.member == null }">
            <div align="center" style="margin-top: 5%;"><img src="resources/images/logo1.PNG" alt="logo" width="20%" height="10%"></div>
            <h3 style="text-align: center; margin-top: 5%;">로그인이 필요한 서비스 입니다.</h3>   
         </c:if>
      </div>
   </div>
</div>



<!-- 티켓 등록 modal -->
<div class="modal fade" id="ticketModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
   <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
         <h3 class="modal-title" id="lineModalLabel">티켓 등록창</h3>
      </div>
      <div class="modal-body">         
            <!-- content goes here -->         
         <div class="form-group">
                  <label for="ticket_name">티켓명</label>
                  <input type="text" class="form-control" id="m_ticket_name" name="m_ticket_name" placeholder="티켓명을 입력하세요" required>
               <label for="ticket_price">티켓 가격</label>
               <input type="number" class="form-control" id="m_ticket_price" name="m_ticket_price" min="0" step="100" placeholder="티켓 판매 가격을 입력하세요 (최소 0원부터 100원 단위로)" required>
               <label for="ticket_quantity">티켓 수량</label>
               <input type="number" class="form-control" id="m_ticket_quantity" name="m_ticket_quantity" min="10" step="1" placeholder="티켓 판매 수량을 입력하세요 (최소 10장)" required>
               <label for="company_name">회사명</label>
               <input type="text" class="form-control" id="m_company_name" name="m_company_name" placeholder="회사명을 입력하세요" required>
               <label for="ceo_name">대표자명</label>
               <input type="text" class="form-control" id="m_ceo_name" name="m_ceo_name" placeholder="대표자명을 입력하세요" required>
               <label for="company_no">사업자번호</label>
               <input type="number" class="form-control" id="m_company_no" name="m_company_no" min="1000000000" max="9999999999" placeholder="사업자번호 10자리를 숫자만 입력하세요" required>              
               <label for="phone">연락처</label>
               <input type="tel" class="form-control" id="m_phone" name="m_phone" placeholder="연락처를 입력하세요" required>
               <label for="bank_name">은행명</label>
               <input type="text" class="form-control" id="m_bank_name" name="m_bank_name" placeholder="은행명을 입력하세요" required>
               <label for="account_holder_name">예금주명</label>
               <input type="text" class="form-control" id="m_account_holder_name" name="m_account_holder_name" placeholder="예금주명을 입력하세요" required>
               <label for="account_no">계좌번호</label>
               <input type="number" class="form-control" id="m_account_no" name="m_account_no" placeholder="계좌번호를 숫자만 입력하세요" required>
            </div>
            <!-- <div class="checkbox">
                  <label>
                   <input type="checkbox"> Check me out
               </label>
            </div> -->
             <button type="submit" class="btn pull-right" onclick="ticketInsert(); return false;">등록하기</button>
      </div>      
   </div>
  </div>
</div>

<!-- 태그 modal -->
<div class="modal fade" id="tagModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
   <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
      </div>
      <div class="modal-body">         
            <!-- content goes here -->         
         <div class="form-group" >
                  <label for="tag">태그 입력 후 등록버튼을 눌러주세요</label>
                  <div class="form-inline form group" align="left" >
                     <input type="text" class="form-control" id="inputTag" name="inputTag" style="width:60%;" required > &nbsp;
                     <button class="btn" onclick="addTag();">등록</button>
                  </div><br>
                  <div class="tagbox_area" id="tagbox_area"></div>
           </div>
           <div style="text-align:center;">
               <button class="btn" onclick="deleteTag();">초기화하기</button>
               <button class="btn" onclick="tagInsert();" data-dismiss="modal">등록하기</button>
            </div>
      </div>      
   </div>
  </div>
</div>



               
   
<!-- Footer -->
<c:import url="/WEB-INF/views/footer.jsp" />

<script src="/westival/resources/styles/bootstrap4/popper.js"></script>
<script src="/westival/resources/styles/bootstrap4/bootstrap.min.js"></script>
<script src="/westival/resources/plugins/parallax-js-master/parallax.min.js"></script>
<!-- <script src="/westival/resources/js/contact_custom.js"></script> -->

</body>
</html>