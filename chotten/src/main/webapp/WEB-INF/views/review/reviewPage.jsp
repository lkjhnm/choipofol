<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix='fmt' uri='http://java.sun.com/jsp/jstl/fmt' %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"  
integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Gugi|Nanum+Pen+Script" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
</head>
<body>

	<%--헤더 컨테이너 --%>
	<div class='jumbotron text-center' style="margin-botton:0">
	</div>
	
	 <%--메인 컨텐츠 컨테이너 --%>
	<div class='container font-weight-bold' style ='margin-top:7%; padding-left:8%; padding-right:8%; font-family:Nanum Pen Script;'>
		<div class='row' style='margin-bottom:4%'>
			<div class='col-sm d-flex justify-content-between'>
				<span style='font-family:Gugi; font-size:25px'>리뷰 보기</span>
				<button type="button" class="btn btn-outline-primary" id="list">목록으로</button>
			</div>
		</div>
		
		<div class='row'>
			<div class='col-sm'>
				<div class="form-group">
				  <label>영화 제목</label>
				  <input type="text" class="form-control form-control-lg" placeholder='영화 제목' readonly="readonly">
				</div>
			</div>
		</div>	
		
		
		<form class='actionForm' action='/review/modify' method='get'>		
			
			<div class="form-group">
				 <label>제 목</label>
				 <input type="text" class="form-control form-control-lg" name='title' value='<c:out value='${review.title }'/>' readonly="readonly">
			</div>

				
			<div class='row d-flex'>
				<div class='col-sm-5 text-center' style='font-size:30px; padding-top:3%'>
					<c:choose>
						<c:when test="${review.reviewlike }">
						리뷰   <i class="far fa-thumbs-up"></i>
						</c:when>
						<c:otherwise>
						리뷰   <i class="far fa-thumbs-down"></i>
						</c:otherwise>
					</c:choose>
				</div>
				
				<div class='col-sm-3'>
					 <div class="form-group">
					  <label>작성자</label>
					  <input type="text" class="form-control text-center" name='writer' value="<c:out value='${review.writer }'/>" readonly="readonly" >
					</div>	
				</div>
				
				<div class='col-sm-2'>
				<label>작성날짜</label>
				<input type="text" class="form-control text-center"
						value='<fmt:formatDate value="${review.regDate }" pattern="YYYY/MM/dd HH:mm "/>' readonly="readonly" >
				</div>
				
				<div class='col-sm-2'>
				<label>수정날짜</label>
				<input type="text" class="form-control text-center" 
						 value='<fmt:formatDate value="${review.updateDate }" pattern="YYYY/MM/dd HH:mm "/>' readonly="readonly" >
				</div>
				
			</div>
			
			<div class="form-group">
			  <label>내 용</label>
			  <textarea class="form-control" rows='8' id='review' name='content' style="display:none;font-size:25px" readonly="readonly">${review.content }</textarea>
			</div>
			
			<div class="form-group">
				<button type="submit" class="btn btn-outline-primary btn-lg" id='modify' style="float:right">수정하기</button>		
				<input type='hidden' name='rvno' value='<c:out value="${review.rvno }"/>' >
			</div>
		</form>
		
		<div class='row' style='margin-top:18%'>
		</div>
		
		
		<div class="input-group mb-3">
		  <textarea class="form-control" rows='2' maxlength='150' id='reply' name='content' style="font-size:15px" placeholder="최대 150자"></textarea> 
		  <div class="input-group-append">
		    <button class="btn btn-primary" id='register' type="button">등록하기</button> 
		  </div>
		</div>
		
		<label style="margin-top:5%; padding-left:1%; font-size:22px">댓 글   ???개</label>
		<div class='row'>
			<div class='col-sm'>
				<ul class="list-group">
				</ul>
			</div>
		</div>
	
	</div>
	
	
	<%-- 푸터 컨테이너 --%>
	<div class='jumbotron text-center' style="margin-botton:0; margin-top:10%">  
	</div>
	
<script>
	$(document).ready(function(){
		// 공통 변수 ------------------------------------------------------------------------
			var mno = '<c:out value="${review.mno}"/>';
			var reviewlike = '<c:out value="${review.reviewlike}"/>';
			var page ='<c:out value="${page}"/>';
			
		//-------------------------------------------------------------------------------
		
		
		// 버튼 자바 스크립트----------------------------------------------------------------
		$(".btn.btn-outline-primary").on("click",function(e){
			e.preventDefault();
			var type = $(this).attr('id');
			var str ="";
			
			if(type == 'list'){
				$(".actionForm").attr("method","get").attr("action","/review/list");
				str += "<input type='hidden' name='mno' value='"+mno+"'>";
				str += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
				str += "<input type='hidden' name='page' value='"+page+"'>";
				
				$(".actionForm").html(" ").append(str).submit();
			}else{
				
				str += "<input type='hidden' name='mno' value='"+mno+"'>";
				str += "<input type='hidden' name='page' value='"+page+"'>";
				str += "<input type='hidden' name='rvno' value ='<c:out value="${review.rvno}"/>'>";
				$(".actionForm").html(" ").append(str).submit();
			}	
		});
		//---------------------------------------------------------------------------------
		
		var content = $("textarea[id='review']").val();
		
		(function(){
			if(content.length > 357){
				var row = content.length/50;
				$("textarea[id='review']").attr("rows", row+1);
			}				
			$("textarea[id='review']").show();
		})();
		
		
		//ajax-----------------------------------------------------------------------------
		var rvno = "<c:out value='${review.rvno }'/>";
		
		$("button[id='register']").on("click",function(){
			
			var writer = "댓글 테스터";
			var content = $("textarea[id='reply']").val();
			var data = {"writer":writer, "rvno":rvno, "content":content};
			
			$.ajax({
				url : "/reply/register",
				type : "post",
				data : JSON.stringify(data),
				contentType : "application/json; charset=utf-8",
				success: function(data){
					alert(data + "등록 성공");			
				},
				error : function(){
					alert("데이터를 불러오는데 실패했습니다. 뭐 그냥 새로고침 하세요;;");
				}
			})
		});
		
		
		function getReply(){
			
			$.ajax({
				url : "/reply/list/"+rvno+"/1",
				type : "get",
				dataType:'json',
				success : function(data){
					
					$(data).each(function(){

						console.log($(this)[0].writer);
						var str ="";
						
						str += "<li class='list-group-item'>";
						str += "<div class='row'>";
						str += "<div class='col-sm'";
						str += "<p id='writer' style='margin-bottom:3px'>"+$(this)[0].writer+"</p>";
						str += "<p id='content' style='margin-bottom:5px'>"+$(this)[0].content+"</p>";
						str += "<span style='font-size:13px'>"+$(this)[0].regDate+"</span></div></div></li>";
						
						$(".list-group").append(str);
					});
				}
			});
		}
		
		getReply();
		
	});
	
	
</script>
</body>
</html>