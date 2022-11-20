<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<html>

<head>
	<title>Mainpage Banner</title>
</head>
<style>
  #box {width: 1200x;}
</style>
<!-- Home 메인 페이지 부분 -->
<!-- CSS파일은 일단 따로 만들지 않고, 작성하시면 됩니다. 작성하고 푸시할거면 카톡에 말해주세요.-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<body>
<div id="box">
    <h2>여행 준비</h2>
    <div class="images">
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/images/notice01.PNG">
        </a>
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/images/qna01.PNG">
        </a>
      </div>
    </div>
  </div>
</body>
</html>
