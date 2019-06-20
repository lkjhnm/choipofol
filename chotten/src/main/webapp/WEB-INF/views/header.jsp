
<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Gugi|Nanum+Pen+Script" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="/resources/ckeditor/ckeditor.js" charset="utf-8"></script>
<style>
.header{	
	font-size : 20px;
	font-family: Gugi;
	color: red;
}
.nav-tabs .nav-link:hover{
	border-color: red;
}

</style>
</head>
<body>
	<div class='jumbotron text-center' style="margin-bottom:8%; padding-bottom:2%; background-image:url('/resources/img/background2.jpg')">
		<div class='container'>
			<div class='row'>
				<div class='col-sm'>
					<sec:authentication property="principal" var='user'/>
					<sec:authorize access="isAnonymous()" var='isAnony'>
						<button type="button"  style="float:right;" class="btn btn-danger" data-toggle='modal' data-target='#myModal' id="loginBtn">로그인</button>
					</sec:authorize>
					<sec:authorize access="isAuthenticated()">
							<button type="button"  style="float:right" class="btn btn-danger" id="logout">로그아웃</button>
							<button type="button"  style="float:right; border:none; background-color:transparent; font-weight:bold; font-family:GUGI;" 
							class="btn btn-outline-dark">${user.member.userName } 님, 어서오세요</button>
					</sec:authorize>
				</div>
			</div>
			<div class='row' style="margin-bottom:0" >
				<div class='col-sm-6' >
					<a href="http://192.168.1.8:8080" style="float:left"><img style="width:300px; height:150px" src="/resources/img/chottenLogo2.png"></a>
				</div>
				<div class='col-sm-6' style="postion:relative">
					 <ul class="nav nav-tabs" style="position:absolute; bottom:0; right:0;">
					    <li class="nav-item">
					      <a class="nav-link header" href="#">상영작</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link header" href="#">영화랭킹</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link header" href="#">예 매</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link header" href="#">평 점</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link header" href="#">리 뷰</a>
					    </li>
					  </ul>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
  <div class="modal fade" id="myModal" style="margin-top:100px">
    <div class="modal-dialog">
      <div class="modal-content" style='background-color:#2E2E2E'>
        
        <!-- Modal body -->
        <div class="modal-body" style='padding:13%; color:white'>
        	<div class='d-flex justify-content-start' style='margin-bottom:30px'>
        		<h2 class="modal-title font-weight-bold">로그인</h2>
        	</div>
	          <form action="/login" method="post" id="loginForm">
				  <div class="form-group">
				    <input type="text" class="form-control form-control-lg" name="username" placeholder="아이디">
				  </div>
				  <div class="form-group">
				    <input type="password" class="form-control form-control-lg" name="password" placeholder="비밀번호" style="margin-bottom:35px">
				  </div>
					
			      <button type="submit" class="btn btn-danger btn-block btn-lg" >로그인</button>
			      <div class="custom-control custom-checkbox" style='margin-top:20px'>
				    <input type="checkbox" class="custom-control-input" id="remember" name="rememberme">
				    <label class="custom-control-label" for="remember">자동 로그인</label>
				  </div>
			      
			      <div style='margin-top:100px'>
			      	<a href='/signUp' style='float:right; color:white'>회원 가입</a>
			      </div>
			      
			  </form>
        </div>
        
        
      </div>
    </div>
  </div>
  <script>
	
	var loginFail = '${loginFail}';

	$(document).ready(function(){
  		
  		$("input").attr("autocomplete","off");
  		
  		$("#logout").on("click",function(){
  			history.replaceState("","","/");
  			location.href="/customLogout";
  		});
  		
  		$("#myModal").on("hide.bs.modal",function(){
  			$("#loginFail").text("");
  			$.ajax({
  				url:"/loginFail",
  				type:"get",
  				success:function(){
  					console.log('${loginFail}');
  				}
  			})
  		});
  		
  	});
	
	
	if(loginFail == 'true' && !history.state){
		var str = "<p style='color:red' id='loginFail'>아이디 또는 비밀번호가 잘못되었습니다. 다시 확인해주세요.</p>";
		$("#loginForm").find("input[name='password']").after(str);
		$("#myModal").modal("show");
		
		history.replaceState({},null,null);
	}
  	
  	function isAnony(){
		var isAnony = ${isAnony};
		
		if(isAnony){
			$("#myModal").modal("show");
			return true;
		}
  	}
  </script>
</body>
</html>