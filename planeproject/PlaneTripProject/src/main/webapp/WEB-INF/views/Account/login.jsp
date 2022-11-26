<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body { background-color : #F6F6F6;}
	
	#p_location { 
		height : 50px;
		color:#848484; 
		background-color :#d2d2d2; 
		margin-top : 15px; 
		margin-bottom : 15px; 
		font-size : 0.9em;
		border-top : 2px solid orange;
		border-bottom : 2px solid orange;
	}
	 
	.form-wrapper {
		display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
		margin-bottom : 55px;
		margin-top : 55px;
	}
	hr { border : 1px solid #d2d2d2;}
	h2 { text-align: center; margin-bottom: 50px;}
	
	#loginForm {
		width: 300px;
		text-align: center;
		border : 2px solid #d2d2d2;
		padding-left : 200px;
		padding-right : 200px;
		padding-top : 40px;
		padding-bottom : 55px;
	}
	
	#loginForm .label-wrapper {
		margin-top: 30px;
		margin-bottom : 10px;
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	
	#loginForm input {
		width: 100%;
		background-color : #F6F6F6;
	}
	
	#loginForm div {
		display: flex;
		align-items: center;
	}
	.form-wrapper input { border : 0px; height: 30px;} 
	.btn_s { width: 300px; height: 50px; border-radius: 0; border : 0px; background-color: #787878; color: white; font-size: 1.0em;}
	#find { text-align: center; justify-content: center; margin-top: 15px; font-size : 0.9em;}
	#a_find { margin-left: 30px; margin-right: 30px;}
	
	
</style>
<style type="text/css">
    a:link { color: black; text-decoration: none;}
    a:visited { color: black; text-decoration: none;}
    a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- header 폭 정해지면 수정 -->
	<div id="p_location">
		<div>
			<span>홈 > 회원가입(수정예정)</span>
		</div>
	</div>
	<div class="form-wrapper">
		<form id="loginForm">
			<input type="hidden" id="joinMsg" value="${joinMsg }">
			<h2>로그인</h2>
			<div class="label-wrapper">
				<label for="email">아이디</label>
			</div>
			<input type="text" id="email" name="email" required>
			<hr>
			<div class="label-wrapper">
				<label for="password">비밀번호</label>
			</div>
			<input type="password" id="password" name="password" required>
			<hr>
			<div id="find">
				<a href="" onclick="window.open('/Account/findId.do','아이디 찾기', 'width=500px, height=500px');return false" id ="a_find">아이디 찾기</a>
				<a href="" onclick="window.open('/Account/findPassword.do','비밀번호 찾기', 'width=500px, height=500px');return false" id ="a_find">비밀번호 찾기</a>
			</div>
			<div style="display: block; margin: 8px auto; margin-top : 60px;">
				<button type="button" id="btnLogin" class="btn_s">로그인</button>
			</div>
			<div style="display: block; margin: 5px auto;">
				<button type="button" class="btn_s" onclick="location.href='/Account/join.do';">회원가입</button>
			</div>
		</form>
	</div>
	<jsp:include page="../footer.jsp"></jsp:include>
	
	<script>
		$(function() {
			//회원가입 성공 시 메시지 출력
			if($("#joinMsg").val() != "" && $("#joinMsg").val() != null) {
				alert($("#joinMsg").val());
			}
			
			//로그인 시 아이디나 비밀번호가 틀렸을 경우에
			$("#btnLogin").on("click", function() {
				$.ajax({
					url: "/Account/login.do",
					type: "post",
					data: $("#loginForm").serialize(),
					success: function(obj) {
						JSON.parse(obj);
						console.log(obj);
						//id 체크
						if(obj == "idFail") {
							alert("존재하지 않는 아이디입니다.");
							$("#email").focus();
							return;
						}
						
						//pw 체크
						if(obj =="pwFail") {
							alert("비밀번호가 틀렸습니다. 비밀번호를 확인해주세요.");
							$("#password").focus();
							return;
						}
						
						//로그인 처리
						location.href="../mainPage.jsp";
						
					},
					error: function(e) {
						console.log(e);
					}
				});
			});
		});
	</script>
</body>
</html>