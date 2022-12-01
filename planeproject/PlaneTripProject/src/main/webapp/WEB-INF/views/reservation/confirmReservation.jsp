<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>୧(๑•̀ᗝ•́)૭</title>
<style>
   body { background-color : #F6F6F6;}
    #container{ width: 100%; display: inline-block; text-align: center;}
   #content{ width: 600px; height: 300px; text-align: center; border : 2px solid #d2d2d2;
         border-radius : 10px; display: inline-block; margin-top: 150px;}
   #msg{ width: 100%; font-size: xx-large; margin-top: 90px; font-weight: bold;}
    #btn_div{ margin-top: 50px;}
   #back_home{ padding: 10px; text-decoration: none; border-radius: 5px; color: white;
        background-color: #ff5000;}
   
</style>
<script>
    $(function() {
        
    });
</script>
</head>

<body>
   <jsp:include page="/header.jsp"></jsp:include>
    <div id="container">
        <div id="content">
            <div id="msg">예약에 성공하셨습니다!</div>
            <nav id="btn_div">
                <a href="/mainPage.do" id="back_home">돌아가기</a>
            </nav>
        </div>
    </div>
   <jsp:include page="/footer.jsp"></jsp:include>
</body>
</html>