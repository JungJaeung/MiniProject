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
    #box { width: 1100px;}
    .a_title { font-size: 1.8rem; font-weight: bold;}
    .a_text {font-size: 0.9rem;}
    #img {width: 100%;}
    .a_info{ font-size: 1.5rem; font-weight: bold;}
    #box02 {width: 93%; border: 2px solid lightgray; padding: 20px 25px 50px 50px;}
    .a_select {font-weight: bold;}
    select { width: 700px; height: 80px; font-size: 1.1rem;}
    select option { font-size: 1.1rem;}
    #btnSelect {width: 100px; height: 40px;  margin-top: 30px;
      border: 1px solid #FF8C00;     background-color:#FF8C00; color:white; font-size: 1.1rem;
      }
</style>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath }/header.jsp"></jsp:include>
<div id="container">
    <div id="box01">
      <p class="a_title">취항지 공항 정보</p>
      <p class="a_text">가시는 곳 공항 정보가 궁금할 때, 공항 이름을 선택하여 [조회]를 누르시면 상세정보를 확인할 수 있습니다. </p>
      <img src="/images/airportInfo.png" id="img">
      <p class="a_info">취항지 선택</p>
      <div id="box02">
        <p class="a_select">취항지 공항선택</p>
        <form id="airportInfoForm" action="/airportInfo.do" method="post">
          <div id="box03">          
            <select>
              <option>서울(인천)</option>
              <option>서울(김포)</option>
              <option>부산(김해)</option>
              <option>제주</option>
              <option>광주</option>
              <option>군산</option>
              <option>청주</option>
              <option>대구</option>
            </select>
          </div>
          <div>
            <button type="submit" id="btnSelect">조회</button>
          </div>        
        </form>
      </div>
      <div id="box04">

      </div>
    </div>
  </div>
  <jsp:include page="${pageContext.request.contextPath }/footer.jsp"></jsp:include>
</body>
</html>