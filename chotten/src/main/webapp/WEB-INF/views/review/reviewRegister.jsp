<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core' %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성하기</title>
</head>
<body>

	<jsp:include page="../header.jsp"/>
	<sec:authentication property='principal' var='user'/>
	
	 <%--메인 컨텐츠 컨테이너 --%>
	<div class='container font-weight-bold' style ='margin-top:7%; padding-left:8%; padding-right:8%; font-family:Nanum Pen Script;'>
		<div class='row' style='margin-bottom:4%'>
			<div class='col-sm d-flex justify-content-between'>
				<span style='font-family:Gugi; font-size:25px'>리뷰 작성</span>
				<button type="button" class="btn btn-outline-primary" id="list">목록으로</button>
			</div>
		</div>
		
		<div class='row'>
			<div class='col-sm'>
				<div class="form-group">
				  <label>영화 제목</label>
				  <input type="text" class="form-control form-control-lg" placeholder='영화 이름이 들어갈 공간' readonly="readonly">
				</div>
			</div>
		</div>	
		
		
		<form class='actionForm' action='/review/register' method='post'>		
			
			<div class="form-group">
				 <label>제 목</label>
				 <input type="text" class="form-control form-control-lg" name='title'>
			</div>

				
			<div class='row d-flex'>
				<div class='col-sm-1'>
				</div>
				
				<div class='col-sm-2 text-center'  style="font-size : 30px; padding-top:3%">
				  <div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio" name="reviewlike" value="true">
					<label class="custom-control-label" for="customRadio"><i class="far fa-thumbs-up"></i></label>
				  </div>	
				</div>
				
				<div class='col-sm-2 text-center' style='font-size : 30px; padding-top:3%'>
				  <div class="custom-control custom-radio custom-control-inline">
				    <input type="radio" class="custom-control-input" id="customRadio2" name="reviewlike" value="false">
				    <label class="custom-control-label" for="customRadio2"><i class="far fa-thumbs-down"></i></label>
				  </div> 
				</div>
				
				<div class='col-sm-3'>
				</div>
				
				<div class='col-sm-4'>
					 <div class="form-group">
					  <label>작성자</label>
					  <input type="text" class="form-control" name='writer' value="${user.member.userid }" readonly="readonly" >
					</div>	
				</div>
			</div>
			
			<div class="form-group">
			  <label>내 용</label>
			  <textarea name='content' id="ir1" rows="10" cols="135" ></textarea>
			</div>
		
			<button type="submit" class="btn btn-outline-secondary btn-lg" style="float:right" >등록하기</button>		
		</form>
		
		
		
	</div>
	
	
	<%-- 푸터 컨테이너 --%>
	<div class='jumbotron text-center' style="margin-botton:0; margin-top:10%">  
	</div>
	
<script>
	
	$(document).ready(function(){
		// 공통 변수 ------------------------------------------------------------------------
			var mno = '<c:out value="${pageInfo.mno}"/>';
			var reviewlike = '<c:out value="${reviewLike}"/>';
			var page = '<c:out value="${pageInfo.page}"/>';
			var oEditors = [];
			
		//-------------------------------------------------------------------------------
		
		// 에디터 자바 스크립트----------------------------------------------------------------
		
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder:"ir1",
			sSkinURI: "/resources/editor/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});	
					
		
		
		//------------------------------------------------------------------------------
		
		// 버튼 자바 스크립트----------------------------------------------------------------
		$(".btn").on("click",function(e){
			e.preventDefault();
			var type = $(this).attr('id');
			var str ="";
			
			if(type == 'list'){
				$(".actionForm").attr("method","get").attr("action","/review/list");
				str += "<input type='hidden' name='mno' value='"+mno+"'>";
				str += "<input type='hidden' name='reviewlike' value='"+reviewlike+"'>";
				str += "<input type='hidden' name='page' value='"+page+"'>";
				
				$(".actionForm").html(" ").append(str).submit();
			}else if(type == 'logout'){
			
			}else{
				
				if(nullCheck()){
					return false;
				}
				
				str += "<input type='hidden' name='mno' value='"+mno+"'>";
			
				$(".actionForm").append(str).submit();
			}	
		});
		//---------------------------------------------------------------------------------
		
		//폼 요소 널값 체크----------------------------------------------------------------------
		function nullCheck(){
			
			if(!$("input[name='title']").val()){
				alert("제목을 입력하세요!");
				return true;
			}
			
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			var textArea = $("#ir1").val();
			if(textArea == "<p><br></p>"){
				alert("본문을 입력하세요!");
				return true;
			}
			
			if(!($(":checked").val())){
				alert("버튼을 선택하세요!");
				return true;
			}
		};	
		//---------------------------------------------------------------------------------
		
	});
	
</script>
</body>
</html>