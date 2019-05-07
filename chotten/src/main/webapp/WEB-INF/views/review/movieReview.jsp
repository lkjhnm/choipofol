<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="https://fonts.googleapis.com/css?family=Gugi|Nanum+Pen+Script" rel="stylesheet">
<meta charset="UTF-8">

<style>
.fakeimg{
	background-color : grey;
}
</style>
<title>리뷰 페이지</title>
</head>
<body>

	<%--헤더 컨테이너 --%>
	<div class='jumbotron text-center' style="margin-botton:0">
	</div>
	
	 <%--메인 컨텐츠 컨테이너 --%>
	<div class='container' style ='margin-top:30px'>
		
		<%-- 영화포스터 / 요약 정보 --%>
		<div class='row'>
			<div class='col-sm-3'>
				<div class='fakeimg' style='height:350px'>영화포스터</div>
			</div>
			<div class='col-sm-9'>
				<div class='fakeimg' style='height:350px'>영화 줄거리 요약</div>
			</div>
		</div>
		
		<%-- 리뷰 정렬타입 --%>
		<div class="dropdown" style="margin-top:5%">
		  <button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">정  렬 </button>
			 <div class="dropdown-menu">
			   <a class="dropdown-item" id="like" href="#">좋아요</a>
		 	   <a class="dropdown-item" id="dislike" href="#">싫어요</a>
			</div>
		</div>
		
		<%-- 리뷰 리스트 --%>
		<div class='row'>
			<div class='col-sm'>
				<div class="list-group">
					<table class="table table-striped text-center table-hover">
					    <thead>
					      <tr style='font-family: Gugi; font-size:18px'>
					      	<th>글번호</th>
					        <th>제 목</th>
					        <th>작성자</th>
					        <th>최근날짜</th>
					        <th>추천수</th>
					      </tr>
					    </thead>
					    <tbody>
				        <c:forEach items='${ReviewList}' var="review">
						      <tr style='font-family:Nanum Pen Script; font-size:25px'>
					        	<th>${review.rvno }</th>
					        	<th style='width:55%'><a class="text-body" href="#">${review.title }</a></th>
					        	<th style='width:20%'>${review.writer }</th>
					        	<th><fmt:formatDate value="${review.updateDate }" pattern="YYYY/MM/dd"/></th>
					        	<th>${review.hits }</th>
						      </tr>
				        </c:forEach>
					    </tbody>
					</table>
				</div>
			</div>
		</div>
		
		<form class="work-btn" action="" method="get">
		</form>
		
	</div>
	
<script>
	$(document).ready(function(){
		
		// 정렬 버튼 자바스크립트 -------------------------------------------------------------
		$(".dropdown-item").on("click",function(e){
			e.preventDefault();
			
			var viewType =$(this).attr("id");
			var reviewlike;
			
			if(viewType == 'like'){
				reviewlike = true;
			}else{
				reviewlike = false;
			}
			
			var str = "";
			str += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
			str += "<input type='hidden' name='mno' value='0'>";
			
			$(".work-btn").attr("action","/review/list").append(str).submit();
		});
		//------------------------------------------------------------------------------
	});
		
</script>	
</body>
</html>