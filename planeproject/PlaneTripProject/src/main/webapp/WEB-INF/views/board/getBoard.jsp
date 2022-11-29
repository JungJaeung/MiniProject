<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #container { width: 100%; display: flex; justify-content: center;}
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
    .btns {
      width: 80px;
      height: 30px;
      border: 1px solid black;
      border-radius: 20px;
      background-color: black;
      text-align: center;
      float: right; 
      margin-top: 10px;
      margin-right: 5px;

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
    }
     #btnUpdate {
       background-color: black;
       border: 1px solid black;
       color: white; font-size: 1.03rem;
    } 
    .btns a {
      text-decoration: none;
      color: #ffffff; font-size: 1.03rem;     
    }
     #clickReply{
       /* display: none; */
      float: left;
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
	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/header.jsp"></jsp:include>
	<div id="container">
	  <div id="box" >
	    <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
	    <input type="hidden" name="amount" value="${pageVO.cri.amount }">
	    <p class="qna_title">게시글 상세보기</p>
	    <div id="t_section">
	      <form action="/board/updateBoard.do" method="post"> 
	        <input type="hidden" name="boardId" id="boardId" value="${board.boardId }">
	          <table id="t_qna">
	            <tr>
	              <th>글번호</th>
	              <td>${board.boardId}</td>
	            </tr>
	            <tr>
	              <th>작성자</th>
	              <td>${board.fullName}</td>
	            </tr>
	            <tr>
	              <th>작성일자</th>
	              <td><fmt:formatDate value="${board.regdate }" pattern="yyyy-MM-dd"/></td>
	            </tr>
	            <tr>
	              <th>제목</th>
	              <td>${board.boardTitle}</td>
	            </tr>
	            <tr>
	              <th>내용</th>
	              <td>${board.boardContent }</td>
	            </tr>
	          </table>
	          <div id="btnWrap"><button type="submit" id="btnUpdate">수정</button></div>
	      </form>
	      <div class="btns" id="btnDeleteWrap" ><a href="/board/deleteBoard.do?boardId=${board.boardId }" id="btndelete" class="btndelete" >삭제</a></div>
	      <div class="btns" ><a href= "/board/getBoardList.do" id="btnList" class="btnList">글목록</a></div>
	  
	      
	       <!--답글기능-->
	      <input type="button" id="clickReply" value="답변하기"> hidden 속성 어떻게 부여  style="display: none;     
	      <div id="r_section">
	        <table>
	          <tr>
	            <td style="text-align: left;">답변 내용</td>
	          </tr>
	          <tr>
	            <td><textarea name="replyContent" id="replyContent" cols="100" rows="10"></textarea></td>
	          </tr>
	          <tr>
	            <td style="text-align: center;"><button type="submit" id="btnReply">확인</button></td>
	          </tr>
	        </table>        
	      </div> 
	    </div>
	  </div> 
	</div>	

	<jsp:include page="${pageContext.request.contextPath }/WEB-INF/views/footer.jsp"></jsp:include>
	
	<script>
		$(function(){
			// 세션, 리퀘스트 스코프에 담겨진 데이터를 빼오는 방식
			const loginUserId = '${loginUser.userId}';
			const boardWriter = '${board.userId}';
			
			console.log(loginUserId);
			console.log(boardWriter);
			
			// 게시글 작성자랑 로그인 유저가 다르면 게시글 수정 못하게 설정 
			if(loginUserId !== boardWriter){
				$("#btnWrap").hide();
				$("#btnDeleteWrap").hide();
				$("#boardTitle").attr("readonly", true);
				$("#boardContent").attr("readonly", true);		
			}
		})
	</script>
</body>
</html>