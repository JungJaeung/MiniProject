<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find Password</title>
<style>
    h2 { margin-bottom: 80px;} 
    form {
        display: flex;
		flex-direction: column;
		justify-content: center;
		align-items: center;
        margin-top:  250px;
    }
    .form-label-group { width : 400px;}
    input { border : 0px; width: 400px; height: 30px; margin-top: 10px;} 
    .btn { height: 40px; background-color: #787878; color: white; font-size: 1.0em;}

</style>
</head>
<body>
	<form method="post" class="form-signin" action="find_password" name="findForm">
	<h2>비밀번호 찾기</h2>
		<div class="form-label-group">
            <label for="email">아이디</label>
			<input type="text" id="email" name="email" class="form-control"/>
            <hr>
		</div>
		
		<div class="form-label-group">
            <label for="fullName">이름</label>
			<input type="text" id="fullName" name="fullName" class="form-control"/>
            <hr>
		</div>
		
		<div class="form-label-group">
            <label for="phone">전화번호</label>
			<input type="text" id="phone" name="phone" class="form-control"/>
            <hr>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase" id="btnFind"
				type="button" value="입력완료">
		</div>

	
		<label id="findPwd_Result"></label>
		<div class="form-label-group">
				<input class="btn btn-lg btn-secondary btn-block text-uppercase"
					type="button" value="닫기" onclick="closethewindow()">
		</div>
	</form>
	<script type="text/javascript">
		function closethewindow(){
			self.close();
		}
		
		$(function() {
			$("#btnFind").on("click", function() {
				$.ajax({
					url : "/Account/findPassword.do",
					type : "post",
					data : $("#findForm").serialize(),
					success : function(obj) {
						if(obj == 'noexist') {
							alert("이 정보로 조회된 계정이 없습니다. 다시 확인해주세요.");
							return;
						}
						
						$("#findPwd_Result").text("회원님의 비밀번호는 " + obj + " 입니다.");
					}
					
				})
			});
		});
	</script>
</body>
</html>