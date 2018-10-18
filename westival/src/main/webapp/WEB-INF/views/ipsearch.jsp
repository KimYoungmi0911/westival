<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link rel="stylesheet" href="/hifive/resources/css/bootstrap.min.css">
	
	<style type="text/css">
		/* .container{
			margin: 0 auto;
		} */
		
		#idsearch{
		width: 320px;
			
		}
		
		#passwordsearch{
		width: 320px;
			}
		
		
		.nav-link:active{
		background-color:#350a4e;
		}
	


	</style>
	<script type="text/javascript" src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
	<%-- var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); //이메일 유효성 검사 영문(대소문자),숫자 + @ + 영문(대소문자),숫자 + . + 영문(대소문자,숫자)
	 
	//틀린 이후 배경색 하얀색 초기화
	function changeembg(){
		$("#searchuseremail").css("background-color", "#FFFFFF");
		$("#searchuseremail").tooltip("dispose");
	}
	
	function changepwbg(){
		$("#usereid").css("background-color", "#FFFFFF");
		$("#usereid").tooltip("dispose");
	}
	function changepwbg1(){
		$("#useremail").css("background-color", "#FFFFFF");
		$("#useremail").tooltip("dispose");
	}
	
	//아이디 ajax 찾는구문
	function searchid(){
		
		
		var receiveremail = $('#searchuseremail').val();
		
		if($('#searchuseremail').val() == ''){
			$("#searchuseremail")
				.attr('data-original-title', '아이디를 입력해주세요')
				.attr('data-placement', 'right').tooltip('show')
			$("#searchuseremail").focus();
			$("#searchuseremail").css("background-color", "#FFCECE");
			
		} else if (!getMail.test($("#searchuseremail").val())) {
			$("#searchuseremail")
    			.attr('data-original-title', '이메일을 형식에 맞게 입력해주세요')
    			.attr('data-placement', 'right').tooltip('show')				
			$("#searchuseremail").val("");
			$("#searchuseremail").focus();
			$("#searchuseremail").css("background-color", "#FFCECE");
	    	return false; 
		} else {
			$.ajax({
				url : "/hifive/searchid",
				type : "post",
				data : { searchuseremail : receiveremail},
				success : function(data) {
					if(data =='0'){
						$("#supportMs").css("color", "red").text("이메일이 올바르지 않습니다");
			 			$("#supportMs").css("display", "block"); 
			 			$("#searchuseremail").val("");
						$("#searchuseremail").focus();
						$("#searchuseremail").css("background-color", "#FFCECE");
					}else if(data == '1'){
						alert("입력하신 이메일로  발송하였습니다")
						location.href = "/hifive/index.jsp";
					}else {
						alert("관리자에게 문의하십시요");					
					}									
				}
			});	
		}		
	}
	
	function searchpw(){
				 
		var spwid = $('#usereid').val();
		var spwemail = $('#useremail').val();
		
		 if($('#usereid').val() == ''){
				 $("#usereid")
 					.attr('data-original-title', '아이디를 입력해주세요')
 					.attr('data-placement', 'right').tooltip('show')
			 	/* $("#supportMS").css("color", "red").text("아이디 혹은 이메일을 입력해주세요");
		 		$("#supportMS").css("display", "block");  */
				$("#usereid").focus();
				$("#usereid").css("background-color", "#FFCECE");
				return false;
		 }else if($('#useremail').val() == ''){
			 	$("#useremail")
	    			.attr('data-original-title', '이메일을 입력해주세요')
	    			.attr('data-placement', 'right').tooltip('show')
				/* $("#supportMS").css("color", "red").text("아이디 혹은 이메일을 입력해주세요");
	 			$("#supportMS").css("display", "block");  */
				$("#useremail").focus();
				$("#useremail").css("background-color", "#FFCECE");
				return false;
	     }else if(!getMail.test($("#useremail").val())) {
				$("#useremail")
		    		.attr('data-original-title', '이메일을 형식에 맞게 입력해주세요')
		    		.attr('data-placement', 'right').tooltip('show')				
				$("#useremail").val("");
				$("#useremail").focus();
				$("#useremail").css("background-color", "#FFCECE");
			    return false; 
			
					
		 }else {
			//아이디 이메일 확인해서 해당 이메일로 임시 비밀번호 보내는 ajax 구문
			$.ajax({
				url : "/hifive/searchpwd",
				type : "post",
				data : { spwid : spwid, spwemail : spwemail },
				success : function(data){
					if(data == '0'){					
						$("#supportDs").css("color", "red").text("아이디 혹은 이메일이 올바르지 않습니다");
			 			$("#supportDs").css("display", "block"); 
			 			$("#usereid").val("");
			 			$("#useremail").val("");
			 			$("#usereid").focus();
			 			return false;
						
					}else if(data == '1'){
						changePwsend();
						
					}else{
						$("#supportDs").css("color", "red").text("오류 발생! 관리자에게 문의하십시요");
			 			$("#supportDs").css("display", "block");
			 			$("#usereid").val("");
			 			$("#useremail").val("");
						return false;
					}
				}				
			});			
		}
	}
	
	/* 
	alert("해당 이메일로 임시비밀번호를 발송하였습니다");
	location.href = "/hifive/index.jsp"; */
	function changePwsend(){
		
		var spwid = $('#usereid').val();
		var spwemail = $('#useremail').val();
	
		
		<% String changepw = ""; 
		for (int i = 0; i < 10; i++) 
			changepw += (char) ((Math.random() * 27) + 96);
		%>
		var changepw = "<%= changepw %>";
		var changepw2 = "<%= changepw %>";
		console.log(changepw + ", " + changepw2)

		$.ajax({
			url : "/hifive/searchpwdfinal",
			type : "post",
			data : { chpw : changepw, spwid : spwid, spwemail : spwemail, sincepw : changepw2 },
			success : function(data){
				if(data == '0'){
					$("#supportDs").css("color", "red").text("임시 비밀번호 발급 실패!");
		 			$("#supportDs").css("display", "block"); 
		 			$("#usereid").val("");
		 			$("#useremail").val("");
					return false;
					
				} else if ( data == '1'){
					alert("해당 이메일로 임시 비밀번호를 발급하였습니다");
					return true;
				} else {
					$("#supportDs").css("color", "red").text("오류 발생! 관리자에게 문의하십시요");
		 			$("#supportDs").css("display", "block");
		 			$("#usereid").val("");
		 			$("#useremail").val("");
					return false;
				}					
			}
		});
	} --%>
	
	</script>
	
	
	<title>search</title>
</head>

<body>
	<script src="/hifive/resources/js/jquery-3.3.1.min.js" ></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
	
	
		<ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="border:0px solid;">
  			<li class="nav-item">
    			<a class="nav-link active" id="pills-id-tab" data-toggle="pill" href="#pills-id" role="tab" aria-controls="pills-id" aria-selected="true">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  			</li>
  			<li class="nav-item">
    			<a class="nav-link" id="pills-password-tab" data-toggle="pill" href="#pills-password" role="tab" aria-controls="pills-password" aria-selected="false">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PASSWORD
    			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
  			</li>
  		</ul> 
  		
		<div class="tab-content" id="pills-tabContent">
  			<div class="tab-pane fade show active" id="pills-id" role="tabpanel" aria-labelledby="pills-id-tab"><p style="text-align: center;">아이디를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 아이디를 보내드립니다.</p>			
  				<div>				
  					<!-- 이메일 쓰는란 -->
					<form action="/hifive/searchid" method="post" onsubmit = "return false;">
					<div class="form-group row" id = "supportMs" style = "display:none; text-indent:15px;">
              <label class="col-form-label"> </label>
              <div class="col-sm-10"></div>
         		</div>
						<div class="form-group">
    						<label for="">Email</label>
    						<input type="email" class="form-control" id="searchuseremail" oninput = "changeembg()"
    						name = "searchuseremail" placeholder="Email">
    			
  						</div>
  						<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<button type="submit" class="btn btn-primary" onclick = "searchid()" id ="idsearch" style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">FIND ID</button>
						
					</form>
					<br><br>
				</div>  			 			
  			</div>
  			
  			<div class="tab-pane fade" id="pills-password" role="tabpanel" aria-labelledby="pills-password-tab"><p style="text-align: center;">비밀번호를 잊어버리셨나요? <br> 가입할 때 입력한 이메일로 비밀번호를  보내드립니다.</p>		
  				<div>
  					<!-- 아이디 & 이메일 치는란 -->
					<form action="/hifive/searchpwd" method="post" onsubmit = "return false;">
					 <div class="form-group row" id = "supportDs" style = "display:none; text-indent:15px;">
              			<label class="col-form-label"></label>
              		 	<div class="col-sm-10"></div>
         			 </div>
						<div class="form-group">
    						<label for="">ID</label>
    						<input type="text" class="form-control" id="usereid" oninput = "changepwbg()" placeholder="ID">
    			
  						</div>
  						<div class="form-group">
    						<label for="">Email</label>
    						<input type="email" class="form-control" id="useremail"  oninput = "changepwbg1()" placeholder="Email">
  						</div>
  						<br>
  						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  						<button type="submit" class="btn btn-primary" onclick = "searchpw()" id ="passwordsearch" style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">FIND PASSWORD</button>
  						
					</form>
					<br><br>
				</div>  			 
  			</div> 
		
		</div>
		
		
	
</body>

</html>