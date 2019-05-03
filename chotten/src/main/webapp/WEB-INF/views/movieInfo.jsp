<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" 
integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">

<style>
.fakeimg{
	background : grey;
}
.row{
	width :100%;
	margin-bottom : 1%;
}
.row .fas{
	color : #272628;
}
.carousel-item img{
	width : 40%;
}

.carousel-indicators li {
	background-color :#272628;
}
</style>
<title>영화 요약 페이지</title>
</head>
<body>
	<div class='jumbotron text-center' style="margin-botton:0">  <!-- 헤더 컨테이너 -->
	</div>
	<div class='container' style ='margin-top:30px'> <!-- 메인 컨텐츠 컨테이너 -->
			
		<div class='row'>	<!-- 영화포스터 / 요약 정보 -->
			<div class='col-sm-3'>
				<div class='fakeimg' style='height:350px'>영화포스터</div>
			</div>
			<div class='col-sm-9'>
				<div class='fakeimg' style='height:350px'>영화 줄거리 요약</div>
			</div>
		</div>
	
			<div class='row' style='margin-top:5%'> <!-- 배우/감독 (타이틀) -->
				<div class='col-sm d-flex'>				
					<h4 class='mr-auto'>감독 및 배우</h4>
					<a href="#" class="btn btn-outline-primary" role="button">더 보기</a>
				</div>
			</div>
			
			<div class='row'> <!-- 배우/감독 사진 -->
				<div class='col-sm'>
					<div class='fakeimg' style='height:220px'>배우 및 감독사진</div>
				</div>
				<div class='col-sm'>
					<div class='fakeimg' style='height:220px'>배우 및 감독사진</div>
				</div>
				<div class='col-sm'>
					<div class='fakeimg' style='height:220px'>배우 및 감독사진</div>
				</div>
				<div class='col-sm'>
					<div class='fakeimg' style='height:220px'>배우 및 감독사진</div>
				</div>
				<div class='col-sm'>
					<div class='fakeimg' style='height:220px'>배우 및 감독사진</div>
				</div>
			</div>
		
			
			<!-- 영화관련 사진 슬라이드쇼 -->
			<div class='row justify-content-center' style="margin-top:5%" > 
				<div id="demo" class="carousel slide" data-ride="carousel" style="width:80%">
				 <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				
				  <!-- The slideshow -->
				  <div class="carousel-inner text-center">
				    <div class="carousel-item active">
				      <img src="/resources/img/default.png" alt="Los Angeles">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/default.png" alt="Chicago">
				    </div>
				    <div class="carousel-item">
				      <img src="/resources/img/default.png" alt="New York">
				    </div>
				  </div>
				
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <i class="fas fa-caret-left fa-5x"></i>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <i class="fas fa-caret-right fa-5x"></i>
				  </a>
				</div>
			</div>
		
		
		<!-- 한줄평 타이틀 -->
		<div class='row' style='margin-top : 7%'> 
			<div class='col-sm d-flex'>				
				<h4 class='mr-auto'>한줄평</h4>
				<a href="#" class="btn btn-outline-primary oneline-btn" role="button">더 보기</a>
			</div>	
		</div>
		
		<!-- 한줄평 컨테이너 -->
		<div class='row'>
			<div class='col-sm'>
				<div class='fakeimg' style='height:250px'>한줄평</div>			
			</div>
		</div>
		
		
		<!-- 리뷰 타이틀 -->
		<div class='row' style='margin-top : 3%'>
			<div class='col-sm d-flex'>				
				<h3 class='mr-auto'>리뷰</h3>
				<a href="#" class="btn btn-outline-primary" role="button">더 보기</a>
			</div>	
		</div>
		
		<!-- 좋아요 리뷰 -->
		<div class='row'>
			<div class='col-sm'>
				<div class='fakeimg' style='height:250px'>좋아요 리뷰</div>
			</div>
		</div>
		
		<!-- 싫어요 컨테이너 -->
		<div class='row'> 
			<div class='col-sm'>
				<div class='fakeimg' style='height:250px'>싫어요 리뷰</div>
			</div>
		</div>
	</div>
	
	<form class='moveBtn' action="" method="get">
	</form>
	
	<div class='jumbotron text-center' style="margin-botton:0">
	</div>
	
<script>
$(document).ready(function(){
	var poster = '<c:out value="${movie.poster}" />';
	
	if(!poster){
		console.log("들어왔다");
		$(".moviePoster").attr("src","/resources/img/default.png");	
	}
	
	
	//더 보기 버튼 동작 자바스크립트 -----------------------------------------//더보기 버튼들이 겹치는 경우 코드를 줄일 방법을 생각하자
	$(".oneline-btn").on("click", function(e){	
		e.preventDefault();
		
		var str ="";
		str += "<input type='hidden' name='mno' value='0'>";    //나중에 바인딩 필요! 테스트를 위해서 기본값 0으로 설정
		str += "<input type='hidden' name='latest' value='true'>"; //더보기 페이지의 기본값은 최신순
		
		$(".moveBtn").attr("action","/oneline/commentView").append(str).submit();
	});
	
});
</script>
</body>
</html>