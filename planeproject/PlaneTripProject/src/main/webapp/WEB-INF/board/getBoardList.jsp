<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 테그 라이브러리 추가 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #container { width: 1000px;}
    #t_section {text-align: center;}
    .qna_title {font-size: 2rem; text-align: center; font-weight: bold;
      margin-bottom: 13px; 
    }
    #t_qna {width:100%; border-collapse: collapse;
    }
    #t_qna tr, #t_qna th{ height: 38px;}
    #t_qna thead { border-top: 2px solid black; 
      border-bottom: 1px solid lightgray;
    }
    #t_qna tbody { border-bottom: 1px solid lightgray;}
    .t_title {text-align: left;} 
    .t_title a {text-decoration: none;}
    .search {
      position:relative;    
      width: 200px;
      margin-bottom: 8px;
      margin-right: 25px;
      margin-left: 400px;
      float: right;
    }
    .search input {
      width: 100%;
      height: 10px;
      border: 1px solid black;
      border-radius: 8px;
      padding: 10px 12px;
      font-size: 14px;
    }
    .search img {
      position:absolute;
      width: 20px;
      top: 7px;
      right: -10px;
      margin:0;
    }
    .pagination {
      list-style: none;
      width: 100%;
      display: inline-block;	
  	}
    .pagination_button {
      float: left;
      margin-left: 5px;
    }
    .insert{
      width: 80px;
      height: 30px;
      border: 1px solid black;
      border-radius: 20px;
      background-color: black;
      text-align: center;
      float: right;
      margin-top: 15px;
    }
    .btnInsert {
      text-decoration: none;
      color: white;
      font-size: 1.03rem;
    }
    td a {text-decoration: none; color:black;} 
</style>
</head>
<body>
	<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
	<div id="container">
	    <p class="qna_title">질 문 게 시 판</p>
	    <form id="searchForm" action="/board/getBoardList.do" method="post">
		    <input type="hidden" name="pageNum" value="${pageVO.cri.pageNum }">
		    <input type="hidden" name="amount" value="${pageVO.cri.amount }">
	      <div class="search">
	        <input type="text" name="searchKeyword" value="${searchKeyword}" placeholder="Search">
	        <img src="images/search.png" style="width: 20px;">
	      </div>
	    </form>
	    <div id="t_section">
	      <table id="t_qna">
	        <thead>
	          <tr>
	            <th width="7%">NO</th>
	            <th width="60%">제목</th>
	            <th width="10%">작성자</th>
	            <th width="12%">작성일자</th>
	            <th width="11%">조회수</th>
	          </tr>
	        </thead>
	        <tbody>
	          <c:forEach items="${boardList}" var="board">
	          <tr>
	            <td>1</td>
	            <td class="t_title"><a href="#">제주도 항공권 관련 문의</a></td>
	            <td>abc</td>
	            <td>2022-11-24</td>					
	            <td>1235</td>
	          </tr>
	        </c:forEach>
	        </tbody>          
	      </table>
	    </div>
	    <div style="text-align: center;">
	      <ul class="pagination">
	        <c:if test="${pageVO.prev }">
	          <li class="pagination_button">
	            <a href="${pageVO.cri.pageNum -l}">이전</a>
	          </li>
	        </c:if>
	        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
	          <li class="pagination_button">
	            <a href="${num }">${num }</a>
	          </li>
	        </c:forEach>
	        <c:if test="${pageVO.next}">
	          <li class="pagination_button">
	            <a href="${pageVO.cri.pageNum +1}">다음</a>
	          </li>
	        </c:if>
	      </ul>
	    </div> 
	     <div class="insert" >
	       <a href="/board/insertboard.do" id="btnInsert" class="btnInsert">글쓰기</a>
	     </div>  
	</div>
    <script>
      //IMG 클릭시 검색화면으로 이동해야함
      $(function() {
        $(".search img").on("click", function(e) {
          console.log(e.target);
        });
      });
    </script>
</body>
</html>