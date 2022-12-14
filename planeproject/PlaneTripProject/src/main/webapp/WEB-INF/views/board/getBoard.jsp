<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {background-color : #F6F6F6;}	
    #container { width: 100%; display: flex; justify-content: center;
    margin-top: 20px;
    margin-bottom: 80px;
    }
    #box { width: 900px;}
    #t_section {text-align: center;}
    .qna_title {font-size: 2rem; text-align: center; font-weight: bold;
      margin-bottom: 13px; 
    }
    #t_qna {width:100%; border-collapse: collapse;
      border-top: 2px solid black;
      border-bottom: 2px solid black;
    }
    #t_qna th {
      height: 40px;
      text-align: center;
      border-bottom: 1px solid lightgray;
    }
    #t_qna td{
      text-align: left;
      border-bottom: 1px solid lightgray;
    }
/* #buttons ul {list-sytle : none; padding : 0px; magin : opx;} 
#buttons ul li {list-sytle : none;padding : 0px; magin : opx;}  */
    .btns {
      width: 80px;
      height: 28px;
      border: 1px solid black;
      border-radius: 20px;
      background-color: black;
      text-align: center;
      float: right; 
      margin-top: 10px;
      margin-right: 5px;
      margin-bottom: 10px;
    } 
	 #btnWrap{
      width: 80px;
      height: 30px;
      border: 1px solid black;
      border-radius: 20px;
      background-color: black;
      text-align: center;
      float: right;
      margin-top: 10px;
      margin-right: 5px;
      margin-bottom: 10px;
    }
     #btnUpdate {
       background-color: black;
       border: 1px solid black;
       color: white; font-size: 1rem;
    } 
    .btns a {
      text-decoration: none;
      color: #ffffff; font-size: 1rem;   
    }
    #btnDeleteWrap{
    	padding-top: 1.85px;
    }
    #btnListWrap{
    	padding-top: 1.85px;
    }
     #clickReply{
       /* display: none; */
      float: left;
      margin-top: 5px;
      width: 80px;
      height: 30px;
      border:1px solid #FF8C00;
      background-color: #FF8C00;
      color: white;
    }
    #btnReply{
      margin-top: 5px;
      width: 80px;
      height: 30px;
      border:1px solid black;
      background-color: black;
      color: white;
    }
</style>
</head>
<body>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div id="container">
	  <div id="box" >	    
	    <p class="qna_title">????????? ????????????</p>
	    <div id="t_section">
	      <form id="updateForm" action="/board/updateBoard.do" method="get"> 
	        <input type="hidden" name="boardId" id="boardId" value="${board.boardId }">
	          <table id="t_qna">
	            <tr>
	              <th>?????????</th>
	              <td>${board.boardId}</td>
	            </tr>
	            <tr>
	              <th>?????????</th>
	              <td>${board.fullName}</td>
	            </tr>
	            <tr>
	              <th>????????????</th>
	              <td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></td>
	            </tr>
	            <tr>
	              <th>??????</th>
	              <td>${board.boardTitle}</td>
	            </tr>
	            <tr>
	              <th>??????</th>
	              <td>${board.boardContent }</td>
	             <%--   <td><input value="${board.boardContent }" name="boardContent" style="border: none; font-size: 1em;"></td> --%>
	            </tr>
	          </table>
	     	 <div id="btnWrap"><input type="button" id="btnUpdate" value="??????" style="font-size:0.9rem;"></div>
	      </form>   
	      <div class="btns" id="btnDeleteWrap" ><a href="/board/deleteBoard.do?boardId=${board.boardId }" id="btndelete" class="btndelete" style="font-size:0.9rem;">??????</a></div>
	      <div class="btns" id="btnListWrap"><a href= "/board/getBoardList.do" id="btnList" class="btnList" style="font-size:0.95rem;">?????????</a></div>
	      
	       <!--????????????-->
	       <div style="float: left;">
 	   	  	<input type="button" id="clickReply" value="????????????" style="display:none;">
 	   	  </div>
 	   	  <form id="replyForm" action="/board/insertReply.do" method="post">
 	   	  <input type="hidden" name="boardId" id="boardId" value="${board.boardId }">
		      <div id="r_section" style="display:none;">
		        <table style="width: 100%;">
		          <tr>
		            <td style="text-align: left; font-weight: bold;">?????? ??????</td>
		          </tr>
		          <tr>
		            <td><textarea name="boardReply" id="boardReply" rows="10" style="resize:none; width: 100%;">${board.boardReply }</textarea></td>
		          </tr>
		          <tr>
		            <td style="text-align: center;">
		            <button type="submit" id="btnReply">??????</button>
		            </td>
		          </tr>
		        </table>        
		      </div>
	      </form>  
	    </div>
	  </div> 
	</div>	

	<jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
	
		<script>
		$(function(){
			// ??????, ???????????? ???????????? ????????? ???????????? ????????? ??????
			const loginUserId = '${loginUser.userId}';
			const boardWriter = '${board.userId}';
			
			console.log(loginUserId);
			console.log(boardWriter);
			
			// ????????? ???????????? ????????? ????????? ????????? ????????? ?????? ????????? ?????? 
			if(loginUserId !== boardWriter){
				$("#btnWrap").hide();
				$("#btnDeleteWrap").hide();
				$("#boardTitle").attr("readonly", true);
				$("#boardContent").attr("readonly", true);		
			}
			
			// ???????????? ??????
			$("#btnUpdate").on("click", function(e){
				console.log(e);
				
				if(boardReply == null || boardReply == ""){
					$("#updateForm").submit();
				} else {
					alert("????????? ?????? ???????????? ????????? ??? ????????????.");
					
					return;
				}
			});
			
			//
			const loginUserRole = '${loginUser.userRole}';
			const boardReply = '${board.boardReply}';

				$("#clickReply").show();
				if(boardReply == null || boardReply == "") {
					if(loginUserRole == "admin"){
						$("#clickReply").val("????????????");
						$("#clickReply").attr("type", "button");
						
						$("#r_section").hide();
						$("#btnReply").show();
						
						$("#clickReply").on("click",function(){
							$("#r_section").show();
						});
						
					} else {
						$("#clickReply").hide();
					}
				} else {
					$("#clickReply").val("????????????");
					$("#clickReply").attr("type", "text");
					$("#clickReply").css("text-align", "center");
					
					$("#clickReply").off("click");
					
					$("#r_section").show();
					$("#btnReply").hide();		
				}	

		});
	</script>
</body>
</html>