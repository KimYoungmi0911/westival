<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입 페이지</title>

	<script src="/hifive/resources/js/jquery-3.3.1.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>


<style type="text/css">
</style>

<script type="text/javascript" >

	
	
</script>

</head>
<body>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
  				
  		<div> 
			<form action="" method="post" onsubmit = "return false;">
				<div class="form-group">
    				<label for="">ID</label>
    				<input type="text" class="form-control" name="user_id" id="user_id" 
    				placeholder="ID" oninput = "" autocomplete="off">
    			
  				</div>
  				<div class="form-group">
    				<label for="">Password</label>
    				<input type="password" class="form-control" name="user_pwd" id="user_pwd"
    				 placeholder="Password" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Confirm Password</label>
    				<input type="password" class="form-control" name="user_pwd" id="user_pwd"
    				 placeholder="Password" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Name</label>
    				<input type="text" class="form-control" name="user_name" id="user_name"
    				 placeholder="Name" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Birth</label>
    				<input type="date" class="form-control" name="user_birth" id="user_birth"
    				 placeholder="Birth" oninput = "" value="2018-01-01" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Address</label>
    				<input type="text" class="form-control" name="user_address" id="user_address"
    				 placeholder="Address" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Phone</label>
    				<input type="tel" class="form-control" name="user_phone" id="user_phone"
    				 placeholder="Phone" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
    				<label for="">Email</label>
    				<input type="email" class="form-control" name="user_email" id="user_email"
    				 placeholder="Email" oninput = "" autocomplete="off">
  				</div>
  				<div class="form-group">
  					<label for="">Gender</label><br>
  					<div class="btn-group btn-group-toggle" data-toggle="buttons">
    				 <label class="btn btn-secondary active" style="width:235px;">
    				 	<input type="radio"  name="user_gender" id="user_gender" autocomplete="off" value="m" checked> Man
    				 </label>
    				 <label class="btn btn-secondary" style="width:235px;">
    					<input type="radio"  name="user_gender" id="user_gender" autocomplete="off" value="w"> Woman
    				 </label>
    				 </div>
  				</div>
  					
  				
				<br>
 				<div class = "input-group-append" style="text-align:center;">
  				<input type="submit" class="btn btn-primary" value = "refister" id ="loginbtn" onclick = "checkidpw()" 
  				style="background: linear-gradient(to right, #fa9e1b, #8d4fff); border:0px solid; font-family: 'Open Sans', sans-serif; text-transform: uppercase;">
  				</div>
  				<br><br>
			</form>
		</div>
		
</body>
</html>