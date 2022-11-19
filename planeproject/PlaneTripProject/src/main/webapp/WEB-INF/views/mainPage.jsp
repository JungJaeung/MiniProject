<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page Slide Banner</title>
<style>
	#f_banner, #s_banner { width: 1200px; margin: 0 auto; border: 1px solid white; text-align: center;}
	.banner_imgs { margin : 10 10;}
    b { font-size: 1.5em;}
    h2, p { font-family: 'Jua', sans-serif;margin-top: 25px;}
    h2 { text-align: left;}
    sup { font-size: 1em;}
</style>
<style type="text/css">
    a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: black; text-decoration: none;}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script>
	$(document).ready(function(){
      $('.banner_imgs').bxSlider({
        slideWidth : 1200,
        maxSlides : 5,
        minSlides : 3,
        moveSlides : 1,
        slideMargin : 20,
        pause : 5000,
        speed : 2000,
        auto : true,
        autoHover: true,
        infiniteLoop : true,
        pager : false, 
        stopAutoOnClick : true, 
        controls : true,
        captions: true
      })
      $('.banner_imgs2').bxSlider({
        slideWidth : 1200,
        slideHeight : 500,
        maxSlides : 1,
        minSlides : 1,
        moveSlides : 1,
        slideMargin : 20,
        pause : 5000,
        speed : 3000,
        auto : true,
        autoHover: true,
        infiniteLoop : true,
        pager : false, 
        stopAutoOnClick : true, 
        controls : false,
        captions: true,
        mode: 'vertical'
      })
	});
</script>
</head>
<body>
  <div id="f_banner">
    <h2>추천 항공권</h2>
    <div class="banner_imgs">
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/bs.jpg">
          <p><strong>서울(인천) - 부산</strong><br>
            <sup>편도총액</sup> <b>62,100원~</b><br>
            <span>2022.12.15~2023.01.15</span>
          </p>
        </a>
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/cc.jpg">
          <p><strong>서울(인천) - 충청도</strong><br>
            <sup>편도총액</sup> <b>49,100원~</b><br>
            <span>2022.12.24~2023.02.11</span>
          </p>
        </a> 
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/kj.jpg">
          <p><strong>서울(인천) - 경주</strong><br>
            <sup>편도총액</sup> <b>55,200원~</b><br>
            <span>2022.11.29~2023.01.19</span>
          </p>
        </a>
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/jj.jpg">
          <p><strong>서울(인천) - 제주</strong><br>
            <sup>편도총액</sup> <b>66,000원~</b><br>
            <span>2023.1.16~2023.02.23</span>
          </p>
        </a>
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/kw.jpg">
          <p><strong>서울(인천) - 강원도</strong><br>
            <sup>편도총액</sup> <b>45,700원~</b><br>
            <span>2022.11.23~2023.02.09</span>
          </p>
        </a>
      </div>
    </div>
  </div>
<div id="s_banner">
    <h2>공지사항</h2>
    <div class="banner_imgs2">
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/notice01.jpg">
        </a>
      </div>
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/qna01.jpg">
        </a>
      </div>
	</div>
</div>
</body>
</html>