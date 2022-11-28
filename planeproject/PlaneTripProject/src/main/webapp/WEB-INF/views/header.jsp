<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>୧(๑•̀ᗝ•́)૭</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
		#header{width: 100%; text-align: center; display: inline-block;}

	    /* 최 상단 로그인 메뉴 */
	    #top_container{ width: 100%; margin-top: -10px;}
	    #top_menu{ width: 1200px; display: inline-block;}
	    #top_menu ul,  #top_menu li{ list-style: none;}
	    #top_menu ul li{ margin-right: 30px; float: right;}
	    #top_menu ul li a{ text-align: center; font-size: 0.9em; font-family: 'Noto Sans KR', sans-serif; font-weight : bolder;
	        text-decoration: none; color: #828282;}
	        
	    /* 상단 메뉴 */
	    #img_logo{ width: 250px; object-fit: cover;margin-top : -40px; margin-left : 0px}
	    #img_menu{ width: 30px; object-fit: cover}
	    #middle_container{ width: 1200px; height: 90px; display: inline-block;}
	    #middle_menu{padding-top: 15px;}
	    #middle_menu ul, #middle_menu li{ list-style: none;}
	    #middle_menu ul li{ float: left;}
	    #middle_menu ul li a{ text-align: center; font-size: medium ; margin-right: 50px; font-family: 'Noto Sans KR', sans-serif;
	        text-decoration: none; color: inherit; font-weight : bolder;}
	    #middle_menu ul li:first-child{margin-right: 30px;}
	    #middle_menu ul li:last-child{float: right; margin-top: -5px;}
	    
	    /* 상단 메뉴 - 카테고리 메뉴*/
	    #category{ width: 100%; height: 100%; display: none;
	        position: absolute; top: 130px; left: 0; text-align: center; z-index: 3;}
	    #category_menu{ width: 1200px;}
	    #category_menu{ background-color: white; width: 100%; height: 280px;}
	    #category_menu ul, #category li{ list-style: none; padding: 0; margin: 0;}
	    #category_menu ul{ margin-top: 40px; font-weight: bold;}
	    #category_menu li:first-child{ margin-top: 10px;}
	    #category_menu ul li a{ text-decoration: none; color: inherit; font-weight: lighter; font-family: 'Jua', sans-serif;}
	    /*메뉴 위치선정 */
	    #category_menu nav{ display: inline-block; text-align: center;}
	    .line1{ position: absolute; top: 0px; left: 8.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
	    .line2{ position: absolute; top: 0px; left: 24.75%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
	    .line3{ position: absolute; top: 0px; left: 41.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
	    .line4{ position: absolute; top: 0px; left: 57.75%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
	    .line5{ position: absolute; top: 0px; left: 74.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;
	        border-right: 1px solid #f2f2f2;}
	    /*아래 반투명 화면*/
	    #category_black{ width: 100%; height: 100%; background-color: black; opacity: 0.5;}
</style>
<script>
	$(document).ready(function(){
		//메뉴 페이지 클릭 이벤트
        $("#img_menu").click(function(e){
            if($("#category").css("display")=="none"){
                $("#img_menu").attr("src", "../../resources/images/X.png");
                $("#category").css("display", "inline-block");
                
                $('#header').on('scroll touchmove mousewheel', function(event) {
                	  event.preventDefault();
                	  event.stopPropagation();
                	  return false;
                	});
            }
            else{
                $("#img_menu").attr("src", "../../resources/images/menu.png");
                $("#category").css("display", "none");
            }
        })
        //메뉴가 열려있을때 바깥의 반투명 페이지 클릭시
        $("#category_black").click(function(e){
            $("#img_menu").attr("src", "../../resources/images/menu.png");
            $("#category").css("display", "none");
        })
	})
</script>
</head>
<body>
	<div id="header">
		<!--최상단 메뉴-->
        <div id="top_container">
            <nav id="top_menu">
                <ul>
                    <li><a href="/board/getBoardList.do">질문게시판</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">나의 예약 현황</a></li>
                    <c:choose>
                    	<c:when test="${loginUser eq null}">
                    		<li><a href="/Account/join.do">회원가입</a></li>
                    		<li><a href="/Account/login.do">로그인</a></li>
                    	</c:when>
						<c:otherwise>
						    <li><a href="/Account/logout.do">로그아웃</a></li>
                    		<li><a href="#">${loginUser.fullName}님</a></li>
						</c:otherwise>
					</c:choose>
                </ul>
            </nav>
        </div>
        <!-- 상단 메뉴-->
        <div id="middle_container">
            <nav id="middle_menu">
                <ul>
                    <li><a href="#"><img id="img_logo" src="${pageContext.request.contextPath}/resources/images/logo.png"></a></li>
                    <li><a href="#">항공권 예매</a></li>
                    <li><a href="#">마이페이지</a></li>
                    <li><a href="#">부가서비스 안내</a></li>
                    <li><a href="#">모바일탑승권</a></li>
                    <li><a href="#">이벤트</a></li>
                    <li><a href="#"><img id="img_menu" src="${pageContext.request.contextPath}/resources/images/menu.png"></a></li>
                </ul>
            </nav>
        </div>
        <!--카테고리 메뉴-->
        <div id="category">
            <div id="category_menu">
                <nav class="line1">
                <ul class="menu1">메뉴
                    <li><a href="#">내용1</a></li>
                    <li><a href="#">내용2</a></li>
                    <li><a href="#">내용3</a></li>
                    <li><a href="#">내용4</a></li>
                    <li><a href="#">내용5</a></li>
                    <li><a href="#">내용6</a></li>
                    <li><a href="#">내용7</a></li>
                </ul>
                </nav>
                <nav class="line2">
                <ul class="menu2">여행준비 안내
                    <li><a href="#">내용1</a></li>
                    <li><a href="#">내용2</a></li>
                    <li><a href="#">내용3</a></li>
                    <li><a href="#">내용4</a></li>
                    <li><a href="#">내용5</a></li>
                    <li><a href="#">내용6</a></li>
                    <li><a href="#">내용7</a></li>
                </ul>
                </nav>  
                <nav class="line3">
                <ul class="menu3">마이페이지
                    <li><a href="#">내용1</a></li>
                    <li><a href="#">내용2</a></li>
                    <li><a href="#">내용3</a></li>
                    <li><a href="#">내용4</a></li>
                    <li><a href="#">내용5</a></li>
                    <li><a href="#">내용6</a></li>
                    <li><a href="#">내용7</a></li>
                </ul>
                </nav>
                <nav class="line4">
                <ul class="menu4">메뉴4
                    <li><a href="#">내용1</a></li>
                    <li><a href="#">내용2</a></li>
                    <li><a href="#">내용3</a></li>
                    <li><a href="#">내용4</a></li>
                    <li><a href="#">내용5</a></li>
                    <li><a href="#">내용6</a></li>
                    <li><a href="#">내용7</a></li>
                    <li><a href="#">내용8</a></li>
                </ul>
                </nav>
                <nav class="line5">
                <ul class="menu5">프리미엄 혜택 안내
                    <li><a href="#">비지니스 라이트</a></li>
                    <li><a href="#">스포츠 멤버십</a></li>
                    <li><a href="#">제휴서비스</a></li>
                    <li><a href="#">온라인몰 제이샵</a></li>
                </ul>
                </nav>
                <nav class="line6"></nav>
            </div>
            <div id="category_black"></div>
        </div>
	</div>

</body>
</html>