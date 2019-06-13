<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<style>
	body{
		height:1300px;
	}
	.box{
		display:inline-block;
		width : 150px;
		margin-bottom:12px;
	}
	.justify-content-start{
		margin-left:20px;
	}
</style>
<body>
	
	<jsp:include page='header.jsp'/>
	
	<div class='container' style='width:900px; margin: 0 auto; padding:50px; border:1px solid gray; border-radius:10px;'>
		<div class='row' style="margin-bottom:10%">
			<div class='col-sm' style='text-align:center'>
				<h1 style="color:gray">회원 가입</h1>
			</div>
		</div>
		
		<form action="/signup" class="sign" method="post" id = "signForm">
			<div class='row'>
			  	<div class='col-sm-2 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
			    	<label for="userid">아이디 </label>
			    </div>
			    <div class='col-sm-1' id="checkIcon" style="text-align:right">
			    </div>
			    <div class='col-sm-5' >
			  	  <div class="form-group">
			    	<input type="text" class="form-control" id="userid" name="userid">
			      </div>
			    </div>
			    <div class='col-sm-3'>
			    	<button class="btn btn-outline-primary" id="sameid">중복확인</button>
			    </div>
		  	</div>
		  <div class='row' style='margin-top:5%'>
		  	<div class='col-sm-3 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
		    	<label for="userpw">비밀번호 </label>
		    </div>
		    <div class='col-sm-5'>
		      <div class="form-group">
		    	<input type="password" class="form-control" id="userpw" name="userpw">
		      </div>
		    </div>
		  </div>
		  <div class='row' style='margin-top:5%'>
		  	<div class='col-sm-2 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
		    	<label for="userpwConfirm">비밀번호  확인</label>
		    </div>
		    <div class='col-sm-1' id="checkIcon2" style="text-align:right">
			</div>
		    <div class='col-sm-5'>
		    	<input type="password" class="form-control" id="userpwConfirm">
		    </div>
		  </div>
		  <div class='row' style='margin-top:5%'>
		  	<div class='col-sm-3 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
		    	<label for="userName">이 름 </label>
		    </div>
		    <div class='col-sm-5'>
		      <div class="form-group">
		    	<input type="text" class="form-control" id="userName" name="userName">
		      </div>
		    </div>
		  </div>
		  <div class='row' style='margin-top:5%'>
		  	<div class='col-sm-3 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
		    	<label for="userEmail">이메일 </label>
		    </div>
		    <div class='col-sm-5'>
		      <div class="form-group">
		    	<input type="text" class="form-control" id="userEmail" name="userEmail">
		      </div>
		    </div>
		  </div>
		  <div class='row' style='margin-top:5%'>
		  	<div class='col-sm-3 d-flex justify-content-start' style='text-align:center; padding-top:6px'>
		    	<span>선호하는 영화</span>
		    </div>
		  	<div class='col-sm-6'>
		  	  <div class="form-group">
		  		<div class="custom-control custom-checkbox"  style="padding-left:30px">
			   		<div class="box">
				   		<input type="checkbox" class="custom-control-input" id="comedy" name="taste" value="comedy">
				   		<label class="custom-control-label" for="comedy">코미디</label>
				   	</div>
				   	<div class='box'>
				   		<input type="checkbox" class="custom-control-input" id="adventure" name="taste" value="adventure">
				   		<label class="custom-control-label" for="adventure">어드벤처</label>
			   		</div>
			   		<div class="box">
			   			<input type="checkbox" class="custom-control-input" id="action" name="taste" value="action">
				   		<label class="custom-control-label" for="action">액션</label>
				   	</div>
				   	<div class='box'>
				   		<input type="checkbox" class="custom-control-input" id="drama" name="taste" value="drama">
				   		<label class="custom-control-label" for="drama">드라마</label>
			   		</div>
			   		<div class="box">
			   			<input type="checkbox" class="custom-control-input" id="thriller" name="taste" value="thriller">
				   		<label class="custom-control-label" for="thriller">스릴러</label>
				   	</div>
				   	<div class='box'>
				   		<input type="checkbox" class="custom-control-input" id="romance" name="taste" value="romance">
				   		<label class="custom-control-label" for="romance">로맨스</label>
			   		</div>
			   </div>
			</div>
			</div>
		  </div>
		  <div class='row' style="margin-top:40px">
		  	<div class='col-sm-3'>
		  	</div>
		  	<div class='col-sm-6' style="padding-left:32px; padding-right:62px;">
		  		<button type="submit" class="btn btn-primary btn-block" id="submit">가입하기</button>
		  	</div>
		  </div>
		</form>
	</div>
	
<script>
	var validate = false;
	var duplicated = false;
		
	$(document).ready(function(){
		
		$("#sameid").on("click",function(e){
			e.preventDefault();
			var userid = $("#userid").val();
			
			$.ajax({
				url:"/signup/check/"+userid,
				type: "get",
				success :function(data){
					checkid(data);
				}
			});
		});
		
		$("#userpwConfirm").focusout(function(){
			checkpw();
		});
		
		$("#userpw").focusout(function(){
			checkpw();
		});
		
		$("#signForm").on("submit",function(e){
			if(!(duplicated && validate)){
				alert("아이디 및 비밀번호를 확인 해주세요!");
				return false;
			}		
		});
	});
	
	function checkpw(){
		var pw = $("#userpw").val();
		var pwCheck = $("#userpwConfirm").val();
		
		if(!pw){
			$("#checkIcon2").html("");
			$("#checkIcon2").append('<i class="fas fa-check" style="color:red"></i>');
			$()
			validate = false;
			return;
		}
		if(pw != pwCheck){
			$("#checkIcon2").html("");
			$("#checkIcon2").append('<i class="fas fa-check" style="color:red"></i>');
			$("#userpwConfirm").css("border-color","red");
			validate = false;
		}else{
			$("#checkIcon2").html("");
			$("#checkIcon2").append('<i class="fas fa-check" style="color:green"></i>');
			$("#userpwConfirm").css("border-color","green");
			validate = true;
		}		
	}
	
	function checkid(data){
		if(data){
			alert("이미 사용 중인 아이디 입니다.");
			$("#checkIcon").html("");
			$("#checkIcon").append('<i class="fas fa-check" style="color:red;"></i>');
			$("#userid").css("border-color","red");
			duplicated = false;
		}else{
			alert("사용할 수 있는 아이디 입니다.");
			$("#checkIcon").html("");
			$("#checkIcon").append('<i class="fas fa-check" style="color:green;"></i>');
			$("#userid").css("border-color","green");
			duplicated = true;
		}
	}
</script>
</body>
</html>