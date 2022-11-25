<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find ID</title>
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
	<form method="post" class="form-signin" action="/Account/findId.do" name="findForm">
        <h2>아이디 찾기</h2>
		<div class="form-label-group">
            <label for="fullName">이름</label><br>
			<input type="text" id="fullName" name="fullName" class="form-control"/>
            <hr>
		</div>
		
		<div class="form-label-group">
            <label for="phone">전화번호</label><br>
			<input type="text" id="phone" name="phone" class="form-control"/>
            <hr>
		</div>

		<div class="form-label-group">
			<input class="btn btn-lg btn-secondary btn-block text-uppercase" id="btnFind"
				type="button" value="입력완료">
		</div>


		<label id="findId_Result"></label>
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
					url : "/Account/findId.do",
					type : "post",
					data : $("#findForm").serialize(),
					success : function(obj) {
						if(obj == 'noexist') {
							alert("이 정보로 조회된 계정이 없습니다. 다시 확인해주세요.");
							return;
						}
						
						$("#findId_Result").text("회원님의 아이디는 " + obj + " 입니다.");
					}
					
				})
			});
		});
	</script>
</body>
</html>