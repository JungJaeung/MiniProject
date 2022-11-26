<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>항공편 조회</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<!-- 상단 웹페이지 스크립트 -->
<style>
        #container{ width: 100%; height: 100%; text-align: center;justify-content: center;}
        #top_hr { background:#f2f2f2; height:1px; border:0; margin-bottom: 0;}

        /* 최 상단 로그인 메뉴 */
        #top_container{ width: 1200px; margin-top: -10px; display: inline-block;}
        #top_menu ul,  #top_menu li{ list-style: none;}
        #top_menu ul li{ margin-right: 30px; float: right;}
        #top_menu ul li a{ text-align: center; font-size: 0.9em; font-family: 'Noto Sans KR', sans-serif; font-weight : bolder;
            text-decoration: none; color: #828282;}
            
        /* 상단 메뉴 */
        #img_logo{ width: 250px; object-fit: cover;margin-top : -40px; margin-left : 0px}
        #img_menu{ width: 30px; object-fit: cover}
        #middle_container{ width: 1200px; height: 70px; display: inline-block;}
        #middle_menu{padding-top: 15px;}
        #middle_menu ul, #middle_menu li{ list-style: none;}
        #middle_menu ul li{ float: left;}
        #middle_menu ul li a{ text-align: center; font-size: medium ; margin-right: 50px; font-family: 'Noto Sans KR', sans-serif;
            text-decoration: none; color: inherit; font-weight : bolder;}
        #middle_menu ul li:first-child{margin-right: 30px;}
        #middle_menu ul li:last-child{float: right; margin-top: -5px;}
        
        /* 상단 메뉴 - 카테고리 메뉴*/
        #category{ width: 100%; height: 100%; border: solid #f2f2f2 1px; display: none;
            position: absolute; top: 120px; left: 0; text-align: center; z-index: 3;}
        #category_menu{ width: 1200px; background-color: aqua;}
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
        #category_black{ width: 100%; height: 100%; background-color: black; opacity: 0.2;}

        /*티케팅 창*/
        #ticketing{ width: 1200px; margin-top: 20px; display: inline-block;}
        #ticketing_box{ width: 100%; height: 220px; box-shadow: 0 0 4px #c8c8c8;
            border-radius: 10px; background-color : white;}
        #way ul, #way li{ list-style: none;}
        #way li{ float: left; margin-right: 30px; margin-top: 20px; font-weight: light;
            font-family: 'Jua', sans-serif; font-size: medium;}
        #round{ color: #ff5000; border-bottom: #ff5000 2px solid; text-decoration: none; margin-left : 125px}
        #oneway{ text-decoration: none; color: inherit; }

        #form_div{clear: both; padding-top: 20px; text-align: left;}
        #starting_point{width: 270px; height: 50px; color: #8c8c8c; cursor: pointer; margin-left: 165px;
            border: none; border-bottom: solid #c8c8c8 1px; background-color:transparent; 
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: x-large;}
        #swap{ width: 30px; height: 30px; border: none; margin-left: 10px; margin-right: 10px;
            background: url( "../../resources/images/arrow.png") no-repeat; cursor: pointer; border-radius: 100%;}
        #arrive_point{width: 270px; height: 50px; color: #8c8c8c; cursor: pointer;
            border: none; border-bottom: solid #c8c8c8 1px; background-color:transparent;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: x-large;}
        #calendar_date{ width: 250px; height: 43px; margin-left: 20px; background-color:transparent;
            background-image: url("../../resources/images/calendar.png"); background-repeat: no-repeat;
            background-size: 20px; background-position: left; cursor: pointer;
            border-style: none; border-bottom: solid #c8c8c8 1px;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: medium;}
        #person{ width: 270px; height: 43px; margin-top: 20px; background-color: transparent;
            background-image: url("../../resources/images/person.png"); background-repeat: no-repeat;
            background-size: 20px; background-position: 10px center; cursor: pointer;
            border-style: none;  border-bottom: solid #c8c8c8 1px; margin-left: 165px;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: medium;}
        #serch{ width: 200px; height: 50px; margin-left: 400px; margin-top: 30px; cursor: pointer;
            background-color: #aaaaaa; color: white; border: none; border-radius: 5px;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large;}
            
        /*출발지*/
        #starting_point_serch{ width: 950px; height: 400px; background-color: white;
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -35%); box-shadow: 0 0 4px #c8c8c8;
            margin-top: 150px;}
        #dummy_serch{ width: 100%; height: 60px;}
        #dummy_serch_img{ width: 20px; height: 20px; float: left; cursor: pointer;
             margin-top: 25px; margin-left: 30px;}
        #dummy_serch input{ width: 830px; height: 40px; margin: 10px; float: left; border: none;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large; outline: none;
            margin-top : 14px;}
        .close{ width: 20px; height: 20px; float: right; cursor: pointer;
            margin-top: 25px; margin-right: 25px;}

        #starting_point_list1{ width: 20%; height: 330px; float: left; background-color: #f2f2f2}
        #starting_point_list1 ul { margin-left : -40px; margin-top : -5px;}
        #starting_point_list1 li{ width: 100%; height: 40px; padding-top: 15px;
            background-color: #f2f2f2;  border-bottom: #dcdcdc solid 1px; list-style: none;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large;}
        #starting_point_list1 li:first-child{ background-color: white;}

        #starting_point_list2{ width: 80%; height: 330px; float: right; background-color: white}
        #starting_point_list2 ul { margin-top : -5px;}
        #starting_point_list2 li{ width: 100%; height: 35px; text-align: left; list-style: none;
            padding-top: 5px; padding-left: 20px; cursor: pointer;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large;}
        #starting_point_list2 li:first-child{ padding-top: 15px;}
        #starting_point_list2 li a{ color: #aaaaaa;}

        /* 도착지 */
        #arrive_point_serch{ width: 950px; height: 400px; background-color: white; 
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -35%); box-shadow: 0 0 4px #c8c8c8;
            margin-top: 150px;}
        #arrive_point_list1{ width: 20%; height: 330px; float: left; background-color: #f2f2f2}
        #arrive_point_list1 ul { margin-left : -40px; margin-top : -5px;}
        #arrive_point_list1 li{ width: 100%; height: 40px; padding-top: 15px;
            background-color: #f2f2f2;  border-bottom: #dcdcdc solid 1px; list-style: none;
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large;}
        #arrive_point_list1 li:first-child{ background-color: white;}
        #arrive_point_list2{ width: 80%; height: 330px; float: right; background-color: white}
        #arrive_point_list2 ul { margin-top : -5px;}
        #arrive_point_list2 li{ width: 100%; height: 35px; text-align: left; list-style: none;
            padding-top: 5px; padding-left: 20px; cursor: pointer; 
            font-family: 'Jua', sans-serif; font-weight: bold; font-size: large;}
        #arrive_point_list2 li:first-child{ padding-top: 15px;}
        
        /* 날짜 선택(달력) */
        #calendar{ width: 950px; height: 400px; background-color: white; 
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -47%); box-shadow: 0 0 4px #c8c8c8;}
        #calendar .close{ position: absolute; top: 0%; right: 0%;}
        #cal1_div{ width: 50%; height: 100%; float: left;}
        #cal2_div{ width: 50%; height: 100%; float: left;}
        
        #cal_pre{ width:30px; height 30px; position: absolute; left: 2%; top: 43%; border: none; background: none;}
        #cal_next{  width:30px; height 30px; position: absolute; right: 2%; top: 43%; border: none; background: none; }

        #cal1_year, #cal1_month{ position: absolute; font-size: large; font-weight: bold;}
        #cal1_year{left: 8%; top: 4%;}
        #cal1_month{left: 15%; top:4%;}
        #cal1 { display: flex; flex-wrap: wrap; width: 80%; margin-left: 13%; margin-top: 10%;}
        .asdf{ text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3;
             border-radius: 3px; color: #c8c8c8 !important;}
        #cal1 > .date {text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3; border-radius: 3px;} 
        #cal1 > .date:nth-child(7n){color: blue;}
        #cal1 > .date:nth-child(7n+1){color: red;}
        
        #cal2_year, #cal2_month{ position: absolute; font-size: large; font-weight: bold;}
        #cal2_year{left: 55%; top: 4%;}
        #cal2_month{left: 62%; top:4%;}
        #cal2 { display: flex; flex-wrap: wrap; width: 80%; margin-left: 7%; margin-top: 10%;}
        #cal2 > .date {text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3; border-radius: 3px; cursor: Z;} 
        #cal2 > .date:nth-child(7n){color: blue;}
        #cal2 > .date:nth-child(7n+1){color: red;}
        #cal2 > .date2 {text-align: center; width: calc(100%/7); height: 50px; box-sizing: border-box;line-height: 3; border-radius: 3px; cursor: Z;} 
        #cal2 > .date2:nth-child(7n){color: blue;}
        #cal2 > .date2:nth-child(7n+1){color: red;}
        
        #date_select{ width: 100px; height: 30px; position: absolute; bottom: 4%; left: 44.5%;
            border: none; background-color: #ff5000; color: white; font-family: 'Jua';}

        /*인원수*/
        #personnel{  width: 950px; height: 300px; background-color: white; 
            display: none; position: absolute; opacity: none; z-index: 2;
            top: 50%; left: 50%; transform: translate(-50%, -35%); box-shadow: 0 0 4px #c8c8c8; }
        #personnel img{ width: 30px; height: 30px; position: absolute; top: 10%; left: 47.5%;}
        #personnel_body input{ width: 30px; height: 30px; text-align: center;
            border: none; border-bottom: 1px solid #dcdcdc;}
        #personnel_body>div button{  width: 30px; height: 30px; border-radius: 100%; border: none; }
        #personnel_header{ height: 30%;}
        #personnel_header_left{ width: 50%; float: left; margin-top: 3%; font-family: 'Jua'}
        #personnel_header_right{ width: 50%; float: left; margin-top: 3%; font-family: 'Jua'}
        #p_start{ font-size: x-large;}
        #p_arrive{ font-size: x-large;}
        #personnel_body{ clear: both; width: 100%; height: 70%; }
        #personnel_body_left{ width: 33.33%; height: 100%; float: left;}
        #personnel_body_center{ width: 33.33%; height: 100%; float: left;}
        #personnel_body_right{ width: 33.33%; height: 100%; float: left;}
        .body_text_title{ margin-top: 10%; margin-left: 10%; text-align: left; }
        .body_text_content{ margin-top: 1%; margin-left: 10%; text-align: left; font-size: small;}
        #body_button_left{ position: absolute; left:21%; top: 40%;}
        #body_button_center{ position: absolute; left:54.33%; top: 40%;}
        #body_button_right{ position: absolute; left:87.66%; top: 40%;}

        #select_personnel{ width: 150px; height: 40px; position: absolute; bottom: 6%; left: 41%;
            background-color: #ff5000; border: none; color: white; border-radius: 5px; 
            font-family: 'Jua'; font-size: large;}
</style>

<script>
    $(document).ready(function(){
        let way = 0;        //왕복 편도
        let flag = false;   //유효성검사
        let start = $(".start").get();
        let arrive = $(".arrive").get();
        //날짜
        var CDate = new Date();
        let today = new Date();
        let day = ["일", "월", "화", "수", "목", "금", "토"];
        let
        e_target1;  //첫번째 클릭한 날짜 오브젝트 저장
        let e_target2;
        let text1;      //출발날짜 저장파일
        let text2;      //도착날짜 저장
        let textd1;     //.찍혀있는 날짜
        let textd2;
        let date_flag = 0;

        let dtemp = 0;
        //여행 날짜 기본설정
        $("#calendar_date").val(today.getFullYear() + "." + (today.getMonth()+1) + "." + today.getDate() + " ~ " + today.getFullYear() + "." + (today.getMonth()+1) + "." + today.getDate());
        
        
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
            $("#arrive_point_serch").css("display", "none");
            $("#calendar").css("display", "none");
            $("#personnel").css("display", "none");
        })
        for(let i = 0; i < start.length; i++){
            $(start[i]).click(function(e){
                $("#starting_point").val(start[i].innerHTML);
                $("#starting_point").css("color", "black");
                $("#starting_point_serch").css("display", "none");
                flag=true;
            })
        }

        //도착지 입력창
        $("#arrive_point").click(function(e){
            if(!flag){
                alert("선택할 항목을 모두 선택해주세요.")
                return;
            }
            else
                $("#arrive_point_serch").css("display", "inline-block");
            	$("#starting_point_serch").css("display", "none");
                $("#calendar").css("display", "none");
                $("#personnel").css("display", "none");
        })
        for(let i = 0; i < arrive.length; i++){
            $(arrive[i]).click(function(e){
                $("#arrive_point").val(arrive[i].innerHTML);
                $("#arrive_point").css("color", "black");
                $("#arrive_point_serch").css("display", "none");
            })
        }

        //출발지 도착지 스왑
        $("#swap").click(function(){
            if($("#arrive_point").val() == "도착지"){

            }
            else{ 
                let temp = $("#arrive_point").val();
                $("#arrive_point").val($("#starting_point").val());
                $("#starting_point").val(temp);
            }
        })

        //달력 만들기
        $.create_cal = function (num) {
	        let htmlDates = ''; 
            let prevLast = new Date(CDate.getFullYear(), CDate.getMonth(), 0); //지난 달의 마지막 날 
            let thisFirst = new Date(CDate.getFullYear(), CDate.getMonth(), 1); //이번 달의 첫쨰 날
            let thisLast = new Date(CDate.getFullYear(), CDate.getMonth() + 1, 0); //이번 달의 마지막 날
            const dates = []; 

            $("#cal1_year").html(CDate.getFullYear() + "년");
            $("#cal1_month").html((CDate.getMonth() + 1) + "월");
            if((CDate.getMonth() + 2) == 13){
                $("#cal2_year").html((CDate.getFullYear() + 1) + "년");
                $("#cal2_month").html( "1월");
            }
            else{
                $("#cal2_year").html(CDate.getFullYear() + "년");
                $("#cal2_month").html((CDate.getMonth() + 2) + "월");
            }
            
            

            if(thisFirst.getDay()!=0){ 
                for(let i = 0; i < thisFirst.getDay(); i++){
                    dates.unshift(prevLast.getDate()-i); // 지난 달 날짜 채우기
                } 
            } 
            for(let i = 1; i <= thisLast.getDate(); i++){
                    dates.push(i); // 이번 달 날짜 채우기 
            } 
            for(let i = 1; i <= 13 - thisLast.getDay(); i++){ 
                    dates.push(i); // 다음 달 날짜 채우기 (나머지 다 채운 다음 출력할 때 42개만 출력함)
            } 
            
            //inner html에 데이터 잔뜩 집어넣기
            if(num == 1){
                for(let i = 0; i < 42; i++){
                    if(i < thisFirst.getDay()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else if(today.getDate() > dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
                        htmlDates += '<div id="date_'+dates[i]+'" class="date">'+dates[i]+'</div>'; 
                    }else if(i >= thisFirst.getDay() + thisLast.getDate()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else{
                        htmlDates += '<div id="date_'+dates[i]+'" class="date">'+dates[i]+'</div>'; 
                    }
                }
            }
            else if(num == 2){
                for(let i = 0; i < 42; i++){
                    if(i < thisFirst.getDay()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else if(today.getDate() > dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else if(today.getDate()==dates[i] && today.getMonth()==CDate.getMonth() && today.getFullYear()==CDate.getFullYear()){
                        htmlDates += '<div id="date2_'+dates[i]+'" class="date">'+dates[i]+'</div>'; 
                    }else if(i >= thisFirst.getDay() + thisLast.getDate()){
                        htmlDates += '<div class="asdf">'+dates[i]+'</div>'; 
                    }else{
                        htmlDates += '<div id="date2_'+dates[i]+'" class="date2">'+dates[i]+'</div>'; 
                    }
                }
            }
            // div에 넣기
            return htmlDates;
        }

        //뒷배경 지우기 함수
        $.clear = function() {
            $(".date").css("background-color", "");
            $(".date").css("color", "");
            $(".date2").css("background-color", "");
            $(".date2").css("color", "");
        };

        //앞 달력 이벤트
        $(document).on("click", ".date", function(e){
            if(dtemp == 0){
                $.clear();
                $(e.target).css("background-color", "red");
                $(e.target).css("color", "white");

                e_target1 = e.target;
                dtemp = 1;
            }
            else if(dtemp == 1){
                if(e_target1.className == "date" && ((Number)(e_target1.textContent)) > ((Number)(e.target.textContent))){
                    alert("일정을 확인해주세요");
                    $.clear();
                }
                else if(e_target1.className == "date2"){
                    alert("일정을 확인해주세요");
                    $.clear();
                }
                else{
                    e_target2 = e.target;
                    $(e.target).css("background-color", "red");
                    $(e.target).css("color", "white");
                    for(let i = ((Number)(e_target1.textContent)) + 1; i < e.target.textContent; i++){
                        $("#date_"+i).css("background-color", "#FFDDDD");
                    }
                }
                dtemp = 0;
            }
        })
        //뒤 달력 이벤트
        $(document).on("click", ".date2", function(e){
            if(dtemp == 0){
                $.clear();
                $(e.target).css("background-color", "red");
                $(e.target).css("color", "white");
                
                e_target1 = e.target;
                dtemp = 1
            }
            else if(dtemp == 1){
                if(e_target1.className == "date2" && ((Number)(e_target1.textContent)) > ((Number)(e.target.textContent))){
                    alert("일정을 확인해주세요");
                    $.clear();
                }
                else{
                    e_target2 = e.target;
                    $(e.target).css("background-color", "red");
                    $(e.target).css("color", "white");
                    if(e_target1.className == "date"){
                        for(let i = ((Number)(e_target1.textContent)) + 1; i < 32; i++){
                            $("#date_"+i).css("background-color", "#FFDDDD");
                            for(let j = 1; j < e.target.textContent; j++){
                                $("#date2_"+j).css("background-color", "#FFDDDD");
                            }
                        }
                    }
                    else{
                        for(let i = ((Number)(e_target1.textContent)) + 1; i < e.target.textContent; i++){
                        $("#date2_"+i).css("background-color", "#FFDDDD");
                    }
                    }
                }
                dtemp = 0;
            }
        })


        //달력 열기
        $("#calendar_date").click(function(e){
            if($("#arrive_point").val() == "도착지"){
                alert("도착지를 설정해주세요");
            }
            else{ 
                $("#calendar").css("display", "inline-block");
                $("#starting_point_serch").css("display", "none");
                $("#arrive_point_serch").css("display", "none");
                $("#personnel").css("display", "none");
                CDate.setMonth(CDate.getMonth()+1);
                let text = $.create_cal(2);
                $("#cal2").html(text);
                CDate.setMonth(CDate.getMonth()-1);
                text = $.create_cal(1);
                $("#cal1").html(text);
            }
            
        })
        //이전달 버튼
        $("#cal_pre").click(function(e){
            let text = $.create_cal(2);
            $("#cal2").html(text);
            CDate.setMonth(CDate.getMonth()-1); 
            text = $.create_cal(1);
            $("#cal1").html(text);
        })
        //다음달 버튼
        $("#cal_next").click(function(e){
            CDate.setMonth(CDate.getMonth()+2);
            let text = $.create_cal(2);
            $("#cal2").html(text);
            CDate.setMonth(CDate.getMonth()-1); 
            text = $.create_cal(1);
            $("#cal1").html(text);
        })

        //달력 선택버튼
        $("#date_select").click(function(){
            let a = CDate.getFullYear().toString();
            let a2 = CDate.getFullYear().toString();
            let b = (CDate.getMonth()+1).toString();
            let b2 = (CDate.getMonth()+2).toString();
            let c = ((String)(e_target1.textContent));
            let c2 = ((String)(e_target2.textContent));

            if(b2 == 13){
                a2 = (CDate.getFullYear()+1).toString();
                b2 = 1;
            }

            text1 = a+b+c;
            text2 = a2+b2+c2;
            textd1 = a + "." + b + "." +  c ;
            textd2 =  a2 + "." + b2 + "." + c2;
            date_flag = 1;

            $("#calendar_date").val(textd1 + " ~ " + textd2);
            $("#serch").attr("disabled", false).css("background-color", "#ff5000");
            $("#calendar").css("display", "none");
        })
        
        //인원수 선택 버튼
        $("#person").click(function(){
            if(date_flag == 0){
                alert("여정 및 일정을 먼저 선택해주세요"); 
            }
            else if(date_flag == 1){
                $("#personnel").css("display", ("inline-block"));
                $("#p_start").text($("#starting_point").val());
                $("#p_startd").text(textd1);
                $("#p_arrive").text($("#arrive_point").val());
                $("#p_arrived").text(textd2);
            }
        })

        //인원수 처리 버튼
        //왼쪽
        $("#left_down").click(function(){
            let num = $("#left_text").val();
            num--;
            $("#left_text").val(num);
            if(num == 0){
                $("#left_down").attr("disabled",true);
            }
            else if(num == 8){
                $("#left_up").attr("disabled",false);
            }
        })
        $("#left_up").click(function(){
            let num = $("#left_text").val();
            num++;
            $("#left_text").val(num);
            if(num == 9){
                $("#left_up").attr("disabled",true);
            }
            else if(num == 1){
                $("#left_down").attr("disabled",false);
            }
        })
        //중앙
        $("#center_down").click(function(){
            let num = $("#center_text").val();
            num--;
            $("#center_text").val(num);
            if(num == 0){
                $("#center_down").attr("disabled",true);
            }
            else if(num == 8){
                $("#center_up").attr("disabled",false);
            }
        })
        $("#center_up").click(function(){
            let num = $("#center_text").val();
            num++;
            $("#center_text").val(num);
            if(num == 9){
                $("#center_up").attr("disabled",true);
            }
            else if(num == 1){
                $("#center_down").attr("disabled",false);
            }
        })
        //오른쪽
        $("#right_down").click(function(){
            let num = $("#right_text").val();
            num--;
            $("#right_text").val(num);
            if(num == 0){
                $("#right_down").attr("disabled",true);
            }
            else if(num == 8){
                $("#right_up").attr("disabled",false);
            }
        })
        $("#right_up").click(function(){
            let num = $("#right_text").val();
            num++;
            $("#right_text").val(num);
            if(num == 9){
                $("#right_up").attr("disabled",true);
            }
            else if(num == 1){
                $("#right_down").attr("disabled",false);
            }
        })

        //인원수 선택 버튼
        $("#select_personnel").click(function(){
            let txt = "";
            $("#personnel").css("display", "none");

            if($("#left_text").val() > 0){
                txt = "성인" + ((String)($("#left_text").val()));
            }
            if($("#center_text").val() > 0){
                txt += ", 소아" + $("#center_text").val();
            }
            if($("#right_text").val() > 0){
                txt += ", 유아" + $("#right_text").val();
            }
            $("#person").val(txt);
        })
        
        //닫기
        $(".close").click(function(e){
            $("#starting_point_serch").css("display", "none");
            $("#arrive_point_serch").css("display", "none");
            $("#calendar").css("display", "none");
        })

        //항공권 검색 버튼
        $("#serch").click(function(){
            console.log("asdf");
        })
        
    })

</script>
<body>
	<div id="container">
        <div id="ticketing">
            <div id="ticketing_box" style="position: relative; bottom: 60; z-index: 2;">
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
                        <input type="button" id="calendar_date" value="2022.11.20 ~ 2022.11.21">
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
                        </ul>
                    </nav>
                    <nav id="starting_point_list2">
                    	<ul>
	                        <li class="start"><span>서울(김포)</span><a href="#">GMP</a></li>
	                        <li class="start"><span>부산</span><a href="#">PUS</a></li>
	                        <li class="start"><span>제주</span><a href="#">CJU</a></li>
	                        <li class="start"><span>광주</span><a href="#">KWJ</a></li>
	                        <li class="start"><span>군산</span><a href="#">KUV</a></li>
	                        <li class="start"><span>청주</span><a href="#">CJJ</a></li>
	                        <li class="start"><span>대구</span><a href="#">TAE</a></li>
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
                    	</ul>
                    </nav>
                    <nav id="arrive_point_list2">
	                    <ul>
	                        <li class="arrive">서울(김포)<a href="#">GMP</a></li>
	                        <li class="arrive">부산 <a href="#">PUS</a></li>
	                        <li class="arrive">제주 <a href="#">CJU</a></li>
	                        <li class="arrive">광주 <a href="#">KWJ</a></li>
	                        <li class="arrive">군산 <a href="#">KUV</a></li>
	                        <li class="arrive">청주 <a href="#">CJJ</a></li>
	                        <li class="arrive">대구 <a href="#">TAE</a></li>
                    	</ul>
                    </nav>
                </div>
            </div>
            <!-- 달력 -->
            <div id="calendar">
                <div id="cal1_div">
                    <button id="cal_pre"><img src="${pageContext.request.contextPath}/resources/images/left_btn.png"></button>
                    <a id="cal1_year"></a>
                    <a id="cal1_month"></a>
                    <nav id="cal1"></nav>
                </div>
                <div id="cal2_div">
                    <button id="cal_next"><img src="${pageContext.request.contextPath}/resources/images/right_btn.png"></button>
                    <a id="cal2_year"></a>
                    <a id="cal2_month"></a>
                    <nav id="cal2"></nav>
                </div>
                <button id="date_select">선택</button>
                <img class="close" src="${pageContext.request.contextPath}/resources/images/X.png">
            </div>
            <!--인원수 선택-->
            <div id="personnel">
                <div id="personnel_header">
                    <div id="personnel_header_left">
                        <nav id="p_start"></nav>
                        <nav id="p_startd"></nav>
                    </div>
                    <img src="${pageContext.request.contextPath}/resources/images/arrow.png">
                    <div id="personnel_header_right">
                        <nav id="p_arrive"></nav>
                        <nav id="p_arrived"></nav>
                    </div>
                </div>
                
                <div id="personnel_body">
                    <hr>
                    <div id="personnel_body_left">
                        <div class="body_text_title">성인</div>
                        <div class="body_text_content">
                        <nav>12세 이상</nav>
                        </div>
                        <div id="body_button_left">
                            <button id="left_down">-</button>
                            <input type="text" id="left_text" value="1" readonly>
                            <button id="left_up">+</button>
                        </div>
                    </div>
                    <div id="personnel_body_center">
                        <div class="body_text_title">소아</div>
                        <div class="body_text_content">
                            <nav>12세 이상</nav>
                            <nav>(최초 출발일 기준)</nav>
                        </div>
                        <div id="body_button_center">
                            <button id="center_down" disabled>-</button>
                            <input type="text" id="center_text" value="0" readonly>
                            <button id="center_up">+</button>
                        </div>
                    </div>
                    <div id="personnel_body_right">
                        <div class="body_text_title">유아</div>
                        <div class="body_text_content">
                            <nav>생후 14일 이상~만 2세 미만</nav>
                            <nav>(만 24개월 미만/최종 탑승일 기준)</nav>   
                            <nav>유아의 여정이 동반 성인과 일치하지 않으면</nav>
                            <nav>환불 후 재구매해야 합니다.</nav>
                        </div>
                        <div id="body_button_right">
                            <button id="right_down" disabled>-</button>
                            <input type="text" id="right_text" value="0" readonly>
                            <button id="right_up">+</button>
                        </div>
                    </div>
                    <button id="select_personnel">선택</button>
                </div>
            </div>
        </div>
	</div>
	<jsp:include page="./searchDepartment.jsp"></jsp:include>
	<jsp:include page="../views/footer.jsp"></jsp:include>
</body>
</html>