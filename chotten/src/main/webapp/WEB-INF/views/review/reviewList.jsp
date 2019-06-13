<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.fakeimg{
	background-color : grey;
}
</style>
<title>리뷰 페이지</title>
</head>
<body>

	<jsp:include page="../header.jsp"/>
	<sec:authorize access="isAnonymous()" var='isAnony'/>
	
	<%--메인 컨텐츠 컨테이너 --%>
	<div class='container' style ='margin-top:10%'>
		
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
			   <a class="dropdown-item" id="like" href="#"><i class="far fa-thumbs-up"></i> 꿀 잼</a>
		 	   <a class="dropdown-item" id="dislike" href="#"><i class="far fa-thumbs-down"></i> 노 잼</a>
			</div>
			<span class='order-by'></span>
		  <button type='button' class='btn btn-primary write' style='float:right' id="writeBtn">작성하기</button>
		</div>
		
		<%-- 리뷰 리스트 --%>
		<div class='row' style='margin-top:0.5%'>
			<div class='col-sm'>
				<div class="list-group">
					<table class="table table-striped text-center table-hover">
					    <thead>
					      <tr style='font-family: Gugi; font-size:18px'>
					      	<th>글번호</th>
					        <th>제 목</th>
					        <th>작성자</th>
					        <th>작성날짜</th>
					        <th>추천수</th>
					      </tr>
					    </thead>
					    <tbody>
				        <c:forEach items='${ReviewList}' var="review">
						      <tr style='font-family:Nanum Pen Script; font-size:25px'>
					        	<th>${review.rvno }</th>
					        	<th style='width:55%'><a class="text-body" href="#">${review.title }</a></th>
					        	<th style='width:20%'>${review.writer }</th>
					        	<th><fmt:formatDate value="${review.regDate }" pattern="YYYY/MM/dd"/></th>
					        	<th>${review.hits }</th>
						      </tr>
				        </c:forEach>
					    </tbody>
					</table>
				</div>
			</div>
		</div>
		
		
		<%-- 페이징 --%>
		<div class='row'>
			<div class='col-sm'>
				<ul class="pagination justify-content-center">
					
					<li class="page-item"><a class="page-link" id="start" href="1"><i class="fas fa-angle-double-left"></i></a></li>
					
					<li class="page-item">
					<a class="page-link pageMove" data-toggle="popover" data-placement="top" data-content="더 이상 이동할 수 없습니다." href="${pageData.pageInfo.page -1 }">
					<i class="fas fa-angle-left"></i></a></li>
					
				
					<c:choose>
						<c:when test="${pageData.noneMoveStart}">
							<c:forEach var="page" begin="1" end="${pageData.realEnd }" >
								<li class="page-item"><a class="page-link" href="${page}">${page }</a></li>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:choose>
								<c:when test="${(pageData.pageInfo.page < 4 ) }">
									<c:forEach var="page" begin="1" end="5">
										<li class="page-item"><a class="page-link" href="${page}">${page }</a></li>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${pageData.noneMoveEnd}">
											<c:forEach var="page" begin="${pageData.realEnd - 4}" end="${pageData.realEnd }">
												<li class="page-item"><a class="page-link" href="${page}">${page }</a></li>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<c:forEach var="page" begin="${pageData.pageInfo.page-2}" end="${pageData.pageInfo.page-1 }">
												<li class="page-item"><a class="page-link" href="${page}">${page }</a></li>
											</c:forEach>
											
												<li class="page-item"><a class="page-link" href="${pageData.pageInfo.page}">${pageData.pageInfo.page }</a></li>
												
											<c:forEach var="page" begin="${pageData.pageInfo.page+1}" end="${pageData.pageInfo.page+2 }">
												<li class="page-item"><a class="page-link" href="${page}">${page }</a></li>
											</c:forEach>	
										</c:otherwise>
									</c:choose>
								</c:otherwise>
							</c:choose>
						</c:otherwise>
					</c:choose>
					
					<li class="page-item"><a class="page-link pageMove" data-toggle="popover" data-content="더 이상 이동할 수 없습니다." data-placement="top"
					 href="${pageData.pageInfo.page +1 }"><i class="fas fa-angle-right"></i></a></li>
					<li class="page-item"><a class="page-link" id="end" href="${pageData.realEnd}"><i class="fas fa-angle-double-right"></i></a></li>
				
				</ul>
			</div>
		</div>	
		
		<form class="pageBtn" action="/review/list" method="get">
		</form>
		
		<form class="work-btn" action="" method="get">
		</form>
		
	</div>
	
	<%-- 푸터 컨테이너 --%>
	<div class='jumbotron text-center' style="margin-botton:0; margin-top: 10%">  
	</div>
	
<script>
	$(document).ready(function(){
		
		// 공통 변수 ---------------------------------------------------------------------
			var mno = '<c:out value="${pageData.pageInfo.mno}"/>';
			var reviewlike = '<c:out value="${reviewlike}"/>';
			var page = '<c:out value="${pageData.pageInfo.page}"/>';
			
		// ---------------------------------------------------------------------------
			orderBy(reviewlike);
		
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
			str += "<input type='hidden' name='page' value='1'>"
			str += "<input type='hidden' name='mno' value='"+mno+"'>";
			
			$(".work-btn").attr("action","/review/list").append(str).submit();
		});
				// 정렬 텍스트 함수 -------------------------------------------------------------------
				
				function orderBy(type){
					
					if(type == 'true'){
						$(".order-by").append('<i class="fas fa-caret-right"></i> 꿀  잼').css("font-family","Nanum Pen Script").css("font-size","23px");
					}else{
						$(".order-by").append('<i class="fas fa-caret-right"></i> 노  잼').css("font-family","Nanum Pen Script").css("font-size","23px");
					}
				};
				//--------------------------------------------------------------------------------
		
		//------------------------------------------------------------------------------
		
		// 작성 버튼 자바스크립트---------------------------------------------------------------
		
		$(".write").on("click",function(){
			
			if(isAnony()){
				var url = "<input type='hidden' name='url' value='/review/register'/>";
				url += "<input type='hidden' name='mno' value='"+mno+"'>";
				url += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
				url += "<input name='page' type='hidden' value='"+page+"'>";
				if(!($("#loginForm").attr("url"))){
					$("#loginForm").append(url);
				}
				return;
			}
			
			var str =""; 
			str += "<input type='hidden' name='mno' value='"+mno+"'>";
			str += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
			str +="<input name='page' type='hidden' value='"+page+"'>";
			$(".work-btn").attr("action","/review/register").append(str).submit();
		});
		//------------------------------------------------------------------------------
		
		// 리뷰 단일 페이지 가져오기 자바스크립트 ----------------------------------------------------
			
		$(".text-body").on("click",function(e){
			e.preventDefault();
			
			var rvno = $(this).parent().prev().text();
			var str ="";
			
			str += "<input type='hidden' name='mno' value='"+mno+"'>";
			str += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
			str += "<input type='hidden' name='rvno' value='"+rvno+"'>";
			str += "<input type='hidden' name='page' value='"+page+"'>";
			
			$(".work-btn").attr("action","/review/get").append(str).submit();
		});
		//------------------------------------------------------------------------------
		
		
		//페이징 처리 자바스크립트---------------------------------
		var pageStr = "";
		
		$(".page-link").on("click",function(e){
			e.preventDefault();
			
			var pageNum = $(this).attr("href");	
			console.log(pageNum);
			
			if(pageNum < 1 || pageNum > <c:out value="${pageData.realEnd}"/> ){	
				$('[data-toggle="popover"]').popover();
				return false;
			}else{
				pageStr +="<input name='page' type='hidden' value='"+pageNum+"'>";
				pageStr +="<input name='reviewlike' type='hidden' value='"+reviewlike+"'>";
				pageStr +="<input name='mno' type='hidden' value='"+mno+"'>";
				
				$(".pageBtn").append(pageStr);
				$(".pageBtn").submit();				
			}
		});
			//현재 페이지 버튼 색깔 --------------------------------
			
			$(".page-link").each(function(){
				
				var needColor = $(this).attr("href");
				var start = $(this).attr("id");
				var end = $(this).attr("id");
					
				if(page == needColor && !start && !end ){
					$(this).css("background-color","#9DE4FF");
				}
			});
		
		//--------------------------------------------------
		
	});
		
</script>	
</body>
</html>