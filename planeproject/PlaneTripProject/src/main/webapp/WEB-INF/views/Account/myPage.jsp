<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>୧(๑•̀ᗝ•́)૭</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<style>
    body { background-color : #F6F6F6;}
    /* 전체 컨테이너 */
	#container{ width: 100%; display: inline-block; text-align: center;}
    /* 페이지 제목 */
    #page_name{ width: 1000px; display: inline-block; font-family: 'Jua'; font-size: xx-large; 
        text-align: left; margin-top: 20px;}
    #reservation{ width: 1000px; display: inline-block;}
    #reservation_name{ text-align: left; font-family: 'Jua';}

    /* 예약현황부분 */
    #reservation_table{ width: 1000px; border: 1px solid #bebebe;}
    #reservation_table table{ width: 100%;  border-collapse:collapse; font-family: 'Jua';}
    #reservation_table th, #reservation_table td{ border: 1px solid #bebebe;}
    #reservation_table th{ width: 16.5%; height: 50px; background-color: #dcdcdc; }
    #reservation_table td{ height: 30px; text-align: center;}

    /* 회원정보 */
    #guest_info{  width: 1000px; height: 10px; display: inline-block; margin-top: 30px;}
    #guest_info_name{  text-align: left; font-family: 'Jua';}
    #info1{ width: 450px; height: 200px; background-color: #dcdcdc; float: left; position: relative;}
    #info2{ width: 450px; height: 200px; background-color: #dcdcdc; float: right;}

    #info1 img{ width: 150px; height: 180px; margin-left: 20px; margin-top: 10px; float: left;}
    #info_id_title{ position: absolute; left: 190px; top: 60px;}
    #info_id{  position: absolute; left: 290px; top: 60px;}
    #correction_btn{ width: 100px; height: 30px; position: absolute; top: 120px; left: 260px;}
    #withdrawal_btn{ border: none; background: none; position: absolute; bottom: 5px; right: 5px; }
    
    #info2_div{ margin-left: 80px;}
    .info_head{ width: 30%; height: 10px; float: left; text-align: left; margin-top: 30px;}
    #info_name{ width: 50%; height: 10px; float: left; text-align: left; margin-top: 30px; margin-left: 30px;}
    #info_birth{ width: 50%; height: 10px; float: left; text-align: left; margin-top: 30px; margin-left: 30px;}
    #info_gender{ width: 50%; height: 10px; float: left; text-align: left; margin-top: 30px; margin-left: 30px;}
    #info_ph{ width: 50%; height: 10px; float: left; text-align: left; margin-top: 30px; margin-left: 30px;}

</style>
<script>
	$(document).ready(function(){
        //innerHtml에 넣는 내용
        let reservation_html = "<table><tr><th>예약번호<th>탑승일<th>탑승구간<th>탑승자<th>예약일<th>예약/취소여부" 
        let personnal_num = 3;              //예약 인원수(현재는 임의로 지정), 후에 넣을때는 (Number)로 형변환 해서 넣어주세요

        $("#headers").load("../asdf/header.html");

        //예약현황 테이블 만드는부분(내용이 들어가는 부분을 a태그에 각각 아이디를 줬음)
                                //ex)reservation_num1, reservation_num2
                                //넣을때 for문 돌려서 아이디 -> innerHtml값 건드시면 쉽게 넣으실거에요
        for(let i = 1; i <= personnal_num; i++){
            reservation_html += "<tr><td><a id='reservation_num"+i+"'>asdf123</a>";
            reservation_html += "<td><a id='depart_date"+i+"'>2022.11.27</a>";
            reservation_html += "<td><a id='section"+i+"'>서울(김포) - 제주</a>";       //innerHtml넣을때 '출발지' + '-' + '도착지'해야함
            reservation_html += "<td><a id='guest_name"+i+"'>ㅁㄴㅇㄹ</a>";
            reservation_html += "<td><a id='reservation_date"+i+"'>2022.11.27</a>";
            reservation_html += "<td><a id='cancellation"+i+"' class=cancellation>예약</a>";
        }
        $("#reservation_table").html(reservation_html);

        //임의로 한개 취소로 바꿈           나중에 지우세요
        $("#cancellation2").html("취소");

        //글자가 예약일때는 파랑 취소일때는 빨강
        for(let i = 1; i <= personnal_num; i++){
            if($("#cancellation"+i).html() == "예약"){
                $("#cancellation"+i).css("color","blue");
            }else if($("#cancellation"+i).html() == "취소"){
                $("#cancellation"+i).css("color","red");
            }
        }
        
        
	})
</script>
</head>
<body>
    <div id="headers"></div>
    
    <jsp:include page="/header.jsp"></jsp:include>
	<div id="container">
        <!--타이틀-->
        <div id="page_name">마이페이지</div>
        <br><br>
        <!--예약현황-->
        <div id="reservation">
            <div id="reservation_name">예약현황(예약 및 취소내역)</div>
            <!--div만 만들어두고 스크립트에서 인원수에 따라 for문 돌려 표로 작성-->
            <div id="reservation_table"></div>

        </div>
        <!--회원정보-->
        <div id="guest_info">
            <div id="guest_info_name">회원 정보</div>
            <div id="info1">
                <div><img src="${pageContext.request.contextPath}/resources/images/person.png"></div>
                <div id="info_id_title">아이디</div>
                <div id="info_id">abc1234</div>

                <button id="correction_btn">회원정보 수정</button>
                <button id="withdrawal_btn">회원 탈퇴</button>
            </div>
            <div id="info2">
                <div id="info2_div">
                    <div class="info_head">성명</div>
                    <div id="info_name">ㅁㄴㅇㄹ</div>
                    <div class="info_head">생년월일</div>
                    <div id="info_birth">20221127</div>
                    <div class="info_head">성별</div>
                    <div id="info_gender">M</div>
                    <div class="info_head">휴대전화 번호</div>
                    <div id="info_ph">01012341234</div>
                </div>

            </div>
        </div>
        

	</div>
    <jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>