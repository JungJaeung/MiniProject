<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page Slide Banner</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js" 
integrity="sha512-aVKKRRi/Q/YV+4mjoKBsE4x3H+BkegoM/em46NNlCqNTmUYADjBbeNefNxYV7giUp0VxICtqdrbqU7iVaeZNXA=="
 crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
<style>
	#f_banner, #s_banner { width: 1200px; margin: 0 auto; border: 1px solid white; text-align: center;}
	.banner_imgs { margin : 10px 10px;}
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
<style>
        #container{ width: 100%; height: 100%; text-align: center;}
        hr { background:#f2f2f2; height:1px; border:0; margin-bottom: 0;}

        /* 최 상단 로그인 메뉴 */
        #top_container{ width: 1000px; margin-top: -30px; display: inline-block;}
        #top_menu ul,  #top_menu li{ list-style: none;}
        #top_menu ul li{ margin-right: 10px; float: right;}
        #top_menu ul li a{ text-align: center; font-size: x-small; font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none; color: inherit;}

        /* 상단 메뉴 */
        #img_logo{ width: 100px; object-fit: cover}
        #img_menu{ width: 30px; object-fit: cover}
        #middle_container{ width: 1000px; height: 70px; display: inline-block;}
        #middle_menu{padding-top: 15px;}
        #middle_menu ul, #middle_menu li{ list-style: none;}
        #middle_menu ul li{ float: left;}
        #middle_menu ul li a{ text-align: center; font-size: medium ; margin-right: 20px; font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none; color: inherit;}
        #middle_menu ul li:first-child{margin-right: 30px;}
        #middle_menu ul li:last-child{float: right; margin-top: -5px;}
        
        /* 상단 메뉴 - 카테고리 메뉴*/
        #category{ width: 100%; height: 100%; border: solid #f2f2f2 1px; display: none;
            position: absolute; top: 120px; left: 0; text-align: center; z-index: 3;}
        #category_menu{ width: 1000px; background-color: aqua;}
        #category_menu{ background-color: white; width: 100%; height: 280px;}
        #category_menu ul, #category li{ list-style: none; padding: 0; margin: 0;}
        #category_menu ul{ margin-top: 40px; font-weight: bold;}
        #category_menu li:first-child{ margin-top: 10px;}
        #category_menu ul li a{ text-decoration: none; color: inherit; font-weight: lighter; font-family: 'Noto Sans KR', sans-serif;}
        /*메뉴 위치선정 */
        #category_menu nav{ display: inline-block; text-align: center;}
        .line1{ position: absolute; top: 0px; left: 8.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
        .line2{ position: absolute; top: 0px; left: 24.75%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
        .line3{ position: absolute; top: 0px; left: 41.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
        .line4{ position: absolute; top: 0px; left: 57.75%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;}
        .line5{ position: absolute; top: 0px; left: 74.25%; border-left: 1px solid #f2f2f2; width: 16.5%; height: 280px;
            border-right: 1px solid #f2f2f2;}
        /*아래 반투명 화면*/
        #category_black{ width: 100%; height: 100%; background-color: black; opacity: 0.2;}

        /*티케팅 창*/
        #ticketing{ width: 1000px; margin-top: 20px; display: inline-block;}
        #ticketing_box{ width: 100%; height: 220px; box-shadow: 0 0 4px #c8c8c8;
            border-radius: 10px;}
        #way ul, #way li{ list-style: none;}
        #way li{ float: left; margin-right: 30px; margin-top: 20px; font-weight: bold;
            font-family: 'Noto Sans KR', sans-serif; font-size: medium;}
        #round{ color: #ff5000; border-bottom: #ff5000 2px solid; text-decoration: none;}
        #oneway{ text-decoration: none; color: inherit; }

        #form_div{clear: both; padding-top: 20px; text-align: left;}
        #starting_point{width: 270px; height: 50px; color: #8c8c8c; cursor: pointer; margin-left: 55px;
            border: none; border-bottom: solid #c8c8c8 1px; background-color:transparent; 
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: x-large;}
        #swap{ width: 30px; height: 30px; border: none; margin-left: 10px; margin-right: 10px;
            background: url( "../../resources/images/arrow.png") no-repeat; cursor: pointer; border-radius: 100%;}
        #arrive_point{width: 270px; height: 50px; color: #8c8c8c; cursor: pointer;
            border: none; border-bottom: solid #c8c8c8 1px; background-color:transparent;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: x-large;}
        #calendar{ width: 250px; height: 43px; margin-left: 20px; background-color:transparent;
            background-image: url("../../resources/images/calendar.png"); background-repeat: no-repeat;
            background-size: 20px; background-position: left; cursor: pointer;
            border-style: none; border-bottom: solid #c8c8c8 1px;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: medium;}
        #person{ width: 270px; height: 43px; margin-top: 20px; background-color: transparent;
            background-image: url("../../resources/images/person.png"); background-repeat: no-repeat;
            background-size: 20px; background-position: 10px center; cursor: pointer;
            border-style: none;  border-bottom: solid #c8c8c8 1px; margin-left: 55px;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: medium;}
        #serch{ width: 200px; height: 50px; margin-left: 400px; margin-top: 30px; cursor: pointer;
            background-color: #aaaaaa; color: white; border: none; border-radius: 5px;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large;}
            
        /*출발지*/
        #starting_point_serch{ width: 950px; height: 400px; background-color: white;
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 4px #c8c8c8;}
        #dummy_serch{ width: 100%; height: 60px;}
        #dummy_serch_img{ width: 20px; height: 20px; float: left; cursor: pointer;
             margin-top: 25px; margin-left: 30px;}
        #dummy_serch input{ width: 830px; height: 40px; margin: 10px; float: left; border: none;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large; outline: none;}
        .close{ width: 20px; height: 20px; float: right; cursor: pointer;
            margin-top: 25px; margin-right: 25px;}

        #starting_point_list1{ width: 20%; height: 330px; float: left; background-color: #f2f2f2}
        #starting_point_list1 li{ width: 100%; height: 40px; padding-top: 15px;
            background-color: #f2f2f2;  border-bottom: #dcdcdc solid 1px; list-style: none;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large;}
        #starting_point_list1 li:first-child{ background-color: white;}

        #starting_point_list2{ width: 80%; height: 330px; float: right; background-color: white}
        #starting_point_list2 li{ width: 100%; height: 35px; text-align: left; list-style: none;
            padding-top: 5px; padding-left: 20px; cursor: pointer;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large;}
        #starting_point_list2 li:first-child{ padding-top: 15px;}
        #starting_point_list2 li a{ color: #aaaaaa;}

        /* 도착지 */
        #arrive_point_serch{ width: 950px; height: 400px; background-color: white; 
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -50%); box-shadow: 0 0 4px #c8c8c8;}
        #arrive_point_list1{ width: 20%; height: 330px; float: left; background-color: #f2f2f2}
        #arrive_point_list1 li{ width: 100%; height: 40px; padding-top: 15px;
            background-color: #f2f2f2;  border-bottom: #dcdcdc solid 1px; list-style: none;
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large;}
        #arrive_point_list1 li:first-child{ background-color: white;}
        #arrive_point_list2{ width: 80%; height: 330px; float: right; background-color: white}
        #arrive_point_list2 li{ width: 100%; height: 35px; text-align: left; list-style: none;
            padding-top: 5px; padding-left: 20px; cursor: pointer; 
            font-family: 'Noto Sans KR', sans-serif; font-weight: bold; font-size: large;}
        #arrive_point_list2 li:first-child{ padding-top: 15px;}
</style>

<!-- 상단 웹페이지 스크립트 -->
<script>
    $(document).ready(function(){
        //왕복 편도
        let way = 0;
        //유효성검사
        let flag = false;
        let start = $(".start").get();
        let arrive = $(".arrive").get();
        //메뉴 페이지 클릭 이벤트
        $("#img_menu").click(function(e){
            if($("#category").css("display")=="none"){
                $("#img_menu").attr("src", "../../resources/images/X.png");
                $("#category").css("display", "inline-block");
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
        //왕복, 편도(왕복일때 way=0, 편도일때 way=1)
        $("#round").click(function(e){
            way=0;
            $("#round").css("color","#ff5000").css("border-bottom", "#ff5000 2px solid");
            $("#oneway").css("color", "black").css("border-bottom", "none");
        })
        $("#oneway").click(function(e){
            way=1;
            $("#oneway").css("color","#ff5000").css("border-bottom", "#ff5000 2px solid");
            $("#round").css("color", "black").css("border-bottom", "none");
        })
        //출발지 입력창
        $("#starting_point").click(function(e){
            $("#starting_point_serch").css("display", "inline-block");
        })
        for(let i = 0; i < start.length; i++){
            $(start[i]).click(function(e){
                $("#starting_point").val(start[i].innerHTML);
                $("#starting_point_serch").css("display", "none");
                flag=true;
            })
        }

        //도착지 입력창
        $("#arrive_point").click(function(e){
            if(!flag){
                alert("에ㅇㅇ에에에에ㅔ")
                return;
            }
            else
                $("#arrive_point_serch").css("display", "inline-block");
        })
        for(let i = 0; i < arrive.length; i++){
            $(arrive[i]).click(function(e){
                $("#arrive_point").val(arrive[i].innerHTML);
                $("#arrive_point_serch").css("display", "none");
            })
        }

        //닫기
        $(".close").click(function(e){
            $("#starting_point_serch").css("display", "none");
            $("#arrive_point_serch").css("display", "none");
        })
    })
</script>
<!-- 여행지 정보 출력 , 공지사항 스크롤 -->
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
    <!--전체 화면 컨테이너-->
    <div id="container">
        <!--최상단 메뉴-->
        <div id="top_container">
            <nav id="top_menu">
                <ul>
                    <li><a href="#">공지사항</a></li>
                    <li><a href="#">고객센터</a></li>
                    <li><a href="#">나의 예약 현황</a></li>
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">로그인</a></li>
                </ul>
            </nav>
        </div>
        <hr>
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
        <!--표 예매-->
        <div id="ticketing">
            <div id="ticketing_box">
                <nav id="way">
                    <ul>
                        <li><a id="round" href="#">왕복</a></li>
                        <li><a id="oneway" href="#">편도</a></li>
                    </ul>
                </nav>
                <div id="form_div">
                    <form id="info" action="#" method="post">
                        <input type="button" id="starting_point" value="출발지">
                        <input type="button" id="swap">
                        <input type="button" id="arrive_point" value="도착지">
                        <input type="button" id="calendar" value="2022.11.20 ~ 2022.11.21">
                        <input type="button" id="person" value="성인1">
                        <input type="button" id="serch" value="항공권 검색" disabled>
                    </form>
                </div>
                <div id="starting_point_serch">
                    <nav id="dummy_serch">
                        <img id="dummy_serch_img" src="${pageContext.request.contextPath}/resources/images/serch.png">
                        <input type="text" placeholder="어디에서 출발하세요??" onfocus="this.placeholder=''" onblur="this.placeholder='어디에서 출발하세요??'">
                        <img class="close" src="${pageContext.request.contextPath}/resources/images/X.png">
                    </nav>
                    <hr>
                    <nav id="starting_point_list1">
                    	<ul>
	                        <li>대한민국</li>
	                        <li>동북아시아</li>
	                        <li>동남아시아</li>
	                        <li>대양주/괌/사이판</li>
                        </ul>
                    </nav>
                    <nav id="starting_point_list2">
                    	<ul>
	                        <li class="start">서울(김포)<a>GMP</a></li>
	                        <li class="start">부산 <a>PUS</a></li>
	                        <li class="start">제주 <a>CJU</a></li>
	                        <li class="start">광주 <a>KWJ</a></li>
	                        <li class="start">군산 <a>KUV</a></li>
	                        <li class="start">청주 <a>CJJ</a></li>
	                        <li class="start">대구 <a>TAE</a></li>
                    	</ul>
                    </nav>
                </div>
                <div id="arrive_point_serch">
                    <nav id="dummy_serch">
                        <img id="dummy_serch_img" src="${pageContext.request.contextPath}/resources/images/serch.png">
                        <input type="text" placeholder="어디로 여행가세요??" onfocus="this.placeholder=''" onblur="this.placeholder='어디로 여행가세요??'">
                        <img class="close" src="${pageContext.request.contextPath}/resources/images/X.png">
                    </nav>
                    <hr>
                    <nav id="arrive_point_list1">
                    	<ul>
	                        <li>대한민국</li>
	                        <li>동북아시아</li>
	                        <li>동남아시아</li>
	                        <li>대양주/괌/사이판</li>
                    	</ul>
                    </nav>
                    <nav id="arrive_point_list2">
	                    <ul>
	                        <li class="arrive">서울(김포)<a>GMP</a></li>
	                        <li class="arrive">부산 <a>PUS</a></li>
	                        <li class="arrive">제주 <a>CJU</a></li>
	                        <li class="arrive">광주 <a>KWJ</a></li>
	                        <li class="arrive">군산 <a>KUV</a></li>
	                        <li class="arrive">청주 <a>CJJ</a></li>
	                        <li class="arrive">대구 <a>TAE</a></li>
                    	</ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
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
      <div>
        <a href="#">
          <img src="${pageContext.request.contextPath}/resources/images/call01.jpg">
        </a>
      </div>
	</div>
</div>
</body>
</html>