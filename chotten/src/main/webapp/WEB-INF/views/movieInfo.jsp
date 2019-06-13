<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
	
	<jsp:include page="header.jsp"/>
	
	<div class='container' style ='margin-top:30px'> <!-- 메인 컨텐츠 컨테이너 -->
	
			<!-- 영화포스터 / 요약 정보 -->
		<div class='row'>	
			<div class='col-sm-3'>
				<div class='fakeimg' style='height:350px'>영화포스터</div>
			</div>
			<div class='col-sm-9'>
				<div class='fakeimg' style='height:350px'>영화 줄거리 요약</div>
			</div>
		</div>
	
		<!-- 배우/감독 (타이틀) -->
		<div class='row' style='margin-top:5%'> 
			<div class='col-sm d-flex'>				
				<h4 class='mr-auto'>감독 및 배우</h4>
				<a href="#" class="btn btn-outline-primary" role="button">더 보기</a>
			</div>
		</div>
		
		<!-- 배우/감독 사진 -->
		<div class='row'> 
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
		
		
		<!-- 영화 예고편 -->
		<div class='row'>
			<div class='col-sm' style="height:300px; position:relative">
				<video width="500px" height="300px" controls>	
					<source  src="/summary/display" type="video/mp4">		
				</video>
				<form action="/summary/uploadTrailer" method="post" enctype="multipart/form-data">
					<input type="file" name="trailer" style="position:absolute; top:50%; left:50%">
					<button type="submit" id="upload" style="position:absolute; top:60%; left:50%">업로드</button>
				</form>
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
				<a href="#" class="btn btn-outline-primary oneline-btn" id="oneline" role="button">더 보기</a>
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
				<a href="#" class="btn btn-outline-primary" id="review" role="button">더 보기</a>
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
	$(".btn-outline-primary").on("click", function(e){	
		e.preventDefault();
		
		var boundary = $(this).attr("id");
		var str ="";
		
		switch(boundary){
		case 'oneline' :
			$(".moveBtn").attr("action","/oneline/commentView"); // commentView -> list로 변환하자
			str += "<input type='hidden' name='latest' value='true'>"; //기본값은 최신순
			break;
		case 'review' :
			$(".moveBtn").attr("action","/review/list");
			str += "<input type='hidden' name='reviewlike' value='true'>";
			break;
		}

		str += "<input type='hidden' name='mno' value='0'>";    //나중에 바인딩 필요! 테스트를 위해서 기본값 0으로 설정
		
		$(".moveBtn").append(str).submit();
	});
	
	console.log($("video"));
});
</script>
</body>
</html>