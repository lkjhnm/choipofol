<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8">
<style>

.fakeimg{
	background : grey;
}
.row{
	width :100%;
	margin-bottom : 1%;
}

.star-color{
	width:0%;
	height:40px;
	background:url(/resources/img/sp_ico.png) no-repeat left bottom/202px;
}
.star {
	width:100%;
	height:40px;
	background:url(/resources/img/sp_ico.png) no-repeat left top/205px;
}

.star-button button{
	border:none;
	outline: none;
	float:left;
	width:7.4%;
	height:83%;
	background : transparent;
}

.star-color-table{
	width:0%;
	height:30px;
	background:url(/resources/img/sp_ico.png) no-repeat left -33px/ 150px;
}
.star-table{
	width:90%;
	height:30px;
	background:url(/resources/img/sp_ico.png) no-repeat left 0px/ 150px;
}
.bar {
	display:inline-block; 
	width:1px;
	height:13px; 
	background-color:#aaa;
	margin:0 19px;
}


</style>
<title>별점 한줄평 페이지</title>
</head>
<body>
	
	<jsp:include page="header.jsp"/>
	
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
		
		
		<%-- 한줄평 등록 및 별점 --%>
		<div class='row' id='starContainer' style='margin-top:10%; padding-left:1%;'>
			<div class='col-sm-3' style="position:relative">
				<div class='star' style="position:absolute; top:0; left :0;">					
				</div>
				<div class='star-color' style="position:absolute; top:0; left :0;">
				</div>
				<div class='star-button' style='width:100%; height:40px; position:absolute; left:0;'>
					<button type='button' title='1' class='star-btn'></button>
					<button type='button' title='2' class='star-btn'></button>
					<button type='button' title='3' class='star-btn'></button>
					<button type='button' title='4' class='star-btn'></button>
					<button type='button' title='5' class='star-btn'></button>
					<button type='button' title='6' class='star-btn'></button>
					<button type='button' title='7' class='star-btn'></button>
					<button type='button' title='8' class='star-btn'></button>
					<button type='button' title='9' class='star-btn'></button>
					<button type='button' title='10' class='star-btn'></button>
					<span id='starScore' style='margin:7%; font-size:1.5em;'><em>0</em></span>
				</div>
			</div>
			<div class='col-sm-9' style='padding-left : 0'>
			   	<form action="/oneline/register" class="commentRegister" method='post'>
					<div class="input-group mb-3 input-group-lg">
					  <input type="text" class="form-control"  maxlength='140'  placeholder="한줄평을 작성해 주세요. 최대  140자" id="commentBox">
					  <div class="input-group-prepend">
					    <button class="btn btn-outline-primary" type="button">등  록</button> 
					  </div>
					</div>
					<sec:authorize access="isAuthenticated()" var="isAnony" >
						<sec:authentication property="principal" var="user"/>
						<input type='hidden' name='writer' value='${user.member.userid }'/>
					</sec:authorize>
				</form>
		    </div>	
	   </div>
		
		<%-- 타이틀 및 총 데이터 수 --%>
		<div class='row' style='margin-top: 5%'>
			<div class='col-sm' style='font-size:1em'>
				<span><em>140자 평</em></span>
				<span class='bar'></span>
				<span style='font-size:1.3em'><em><c:out value='${pageData.total }'/></em></span>
				<span><em>건</em></span>
			</div>
		</div>
		
		<%-- 정렬 키워드 --%>
		<div class='row'>	
			<ul class="nav">
			  <li class="nav-item">
			    <a class="nav-link" onclick="displayOrder('latest')"  href="#">최신순</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" onclick="displayOrder('like')" href="#">평점 높은 순</a>
			  </li>
			  <li class="nav-item">
			    <a class="nav-link" onclick="displayOrder('dislike')" href="#">평점 낮은 순</a>
			  </li>
			</ul>
		</div>

		<%-- 한줄평 테이블 --%>
		<div class='row'>
			<div class='col-sm'>
				<ul class="list-group">
					<c:forEach items='${ScoreList }' var ="scoreBoard">
						  <li class="list-group-item starList">
						  	<div class='row'>
							  	<div class='col-sm-2' style='position:relative;'>
									<div class='star-table' style="position:absolute; top:0; left :0;">					
									</div>
									<div class='star-color-table' style='position:absolute; top:0; left :0;'>
										<input type='hidden' value='<c:out value="${scoreBoard.score }"/>'> 
									</div>									
								</div>
								<div class='col-sm-1' style='padding-left:0'>
									<span id='starScore-table' style='margin:7%; font-size:1.2em;'><em><c:out value="${scoreBoard.score}"/></em></span>
								</div>
									<div class='col-sm-9'>
										<p><c:out value="${scoreBoard.content }"/></p>
										<span class='d-flex' style='margin-top:8%'><em><c:out value="${scoreBoard.writer }"/></em>
										<span class='bar'></span>
										<em class='mr-auto'><fmt:formatDate value="${scoreBoard.regdate }" pattern="YYYY/MM/dd,  HH:mm "/></em>
										<button type="button" class="btn btn-outline-danger thumbs-up" style="padding-top:0s">
										<i class="far fa-heart"><c:out value="        ${scoreBoard.hits }"/></i></button>
										<input type='hidden' class='sno' value='<c:out value="${scoreBoard.sno }"/>'>
										</span>
									</div>
							 </div>
						  </li>
					</c:forEach>
				</ul>
			</div>
		</div>
		
		<%-- 페이징 --%>
		<div class='row'>
			<div class='col-sm'>
				<ul class="pagination justify-content-center">
					
					<li class="page-item"><a class="page-link" id='start' href="1"><i class="fas fa-angle-double-left"></i></a></li>
					
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
					<li class="page-item"><a class="page-link" id='end' href="${pageData.realEnd}"><i class="fas fa-angle-double-right"></i></a></li>
				
				</ul>
			</div>
		</div>	
		
		<form class="pageBtn" action="/oneline/commentView" method="get">
			<input name='mno' type='hidden' value='${pageData.pageInfo.mno }'>		
		</form>
		
	</div>
	
	<div class='jumbotron text-center' style="margin-botton:0">  <!-- 푸터 컨테이너 -->
	</div>
	
<script>
	
	$(document).ready(function(){
		
		var latest = '<c:out value="${pageData.pageInfo.latest}"/>';
		var like = '<c:out value="${pageData.pageInfo.like}"/>';
		var dislike = '<c:out value="${pageData.pageInfo.dislike}"/>';
		var mno = "<c:out value='${pageData.pageInfo.mno}'/>";
		
		//별 애니메이션 자바스크립트--------------------------------
		var i;			// mouseover시 점수값
		var tmp;		// mouseleave시 빨간색 별 width 고정값
		var fix=0;		// mouseleave시 점수 고정 값
	
		$(".star-button button").on("mouseover",function(){
			i = $(this).attr('title');
			$("#starScore").text(i);
			
			if(i > 5){
				i *= 7.425;
			}else if(i == 1){
				i *= 6.7;
			}else{
				i *= 7.325;
			}
			
			$(".star-color").css("width",i+"%");
		});
		
		
		$(".star-button button").on("click",function(){
			fix = $(this).attr('title');
			tmp = i;
		});
		
		$(".star-button button").on("dblclick",function(){
			tmp=0;
			fix=0;
			$(".star-color").animate({"width" : '0%'},50);
		});
		
		$(".star-button").on("mouseleave",function(){
			$(".star-color").animate({"width" : tmp+"%"},100);
			if(!fix){
				fix=0;
				$(".star-color").animate({"width" : '0%'},50);
			}
			$("#starScore").text(fix);
		})
		
		$(".star-color-table").each(function(i,e){
			var score = $(this).find("input").val();
			
			if(score == 3 || score == 1){
				score *=8.27;
			}else{
				score *=8.65;
			}
			$(this).animate({"width" : score+'%'},150);
		});
		 
		
		//-----------------------------------------------
		
		//등록 부분 자바스크립트---------------------------------
		var register = $(".commentRegister").find("button");
		
		
		
		
		var str = '';
		
		register.on("click",function(){
			
			var comment = $("#commentBox").val();
			
			if(!comment){
				alert("한줄평을 입력해 주세요");
				return;
			}
			
			
		
			str +="<input name='mno' type='hidden' value='"+mno+"'>";
			str +="<input name='page' type='hidden' value='1'>";
			str +="<input name='latest' type='hidden' value='"+latest+"'>";
			str +="<input name='like' type='hidden' value='"+like+"'>";
			str +="<input name='like' type='hidden' value='"+dislike+"'>";
			str +="<input name='score' type='hidden' value='"+ fix +"'>";
			str +="<input name='content' type='hidden' value='"+comment+"' >";
			
			$(".commentRegister").append(str);
			$(".commentRegister").submit();
		});
		//-------------------------------------------------
		
		
		//페이징 처리 자바스크립트---------------------------------
		var pageStr = "";
		
	
		
		$(".page-link").on("click",function(e){
			e.preventDefault();
			
			var pageNum = $(this).attr("href");	
			console.log(pageNum);
			
			if(pageNum < 1 || pageNum > <c:out value="${pageData.realEnd}"/>){				
				$('[data-toggle="popover"]').popover();
				return false;
			}else{
				pageStr +="<input name='page' type='hidden' value='"+pageNum+"'>";
				pageStr +="<input name='latest' type='hidden' value='"+latest+"'>";
				pageStr +="<input name='like' type='hidden' value='"+like+"'>";
				pageStr +="<input name='dislike' type='hidden' value='"+dislike+"'>";
				
				
				$(".pageBtn").append(pageStr);
				$(".pageBtn").submit();				
			}
		});
			
				//현재 페이지 버튼 색깔 --------------------------------
				
				$(".page-link").each(function(){
					var page = '<c:out value="${pageData.pageInfo.page}"/>';
					var needColor = $(this).attr("href");
					var start = $(this).attr("id");
					var end = $(this).attr("id");
						
					if(page == needColor && !start && !end ){
						$(this).css("background-color","#9DE4FF");
					}
				});
		//--------------------------------------------------
		
		//정렬 조건 버튼 자바스크립트 --------------------------------
		
	});
	
	function displayOrder(condition){
		
		event.preventDefault();
		
		switch(condition){
		case 'latest' : latest = true; like = false; dislike = false;
			break;
		case 'like'  : latest = false; like = true; dislike = false;
			break;
		case 'dislike' : latest = false; like = false; dislike = true;
			break;
		}
		
		var str ="";
		str +="<input name='page' type='hidden' value='1'>";
		str +="<input name='latest' type='hidden' value='"+latest+"'>";
		str +="<input name='like' type='hidden' value='"+like+"'>";
		str +="<input name='dislike' type='hidden' value='"+dislike+"'>";
		
		$(".pageBtn").append(str);
		$(".pageBtn").submit();	
	};
	
	//추천 수 증가 --------------------------------------------------------------------------
	$(".thumbs-up").on('click',function(){
		
		var snoVal = $(this).parent().find(".sno").val();
		var mnoVal = ${pageData.pageInfo.mno};
		var pageVal = ${pageData.pageInfo.page};
		var latestVal = ${pageData.pageInfo.latest};
		var likeVal = ${pageData.pageInfo.like};
		var dislikeVal = ${pageData.pageInfo.dislike};
		var str = {mno:mnoVal, page:pageVal, latest:latestVal, like:likeVal, dislike:dislikeVal};

		$.ajax({
			url:"/oneline/"+snoVal,
			type:'put',
			data: JSON.stringify(str),
			contentType: "application/json; charset=utf-8",
			success:function(data){
				if(data == 'success'){
					alert("추천하였습니다.");	
					window.location.reload();
				}
			}
		});
	});
	
	$("#commentBox").on("focus",function(){
		isAnony();
	});
</script>
	
</body>
</html>