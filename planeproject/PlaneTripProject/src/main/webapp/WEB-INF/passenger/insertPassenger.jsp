<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승객 정보 기입</title>
<style>
	#container {
		margin: 0 auto;
	}
	#myIdInfo {
		border: 1px solid black;
		width: 90%; height: 200px;	
		background-color: skyblue;
	}
	#flight {
		background-color: orange;
	}
	#
</style>
<script></script>
</head>
<body>
	<c:if test="${flightInfo } == null">
			
	</c:if>
	<div id="container">
		<div id="myIdInfo">
			<div></div>
			<div></div>
			<div></div>
			<div></div>
		</div>
		<div id="flight">
			<div>
			
			</div>
		</div>
		<div id="passengerList">
			<form>
				<input type="text" id="firstName" name="firstName" value="">
				<input type="text" id="lastName" name="lastName" value=""><br>
				<input type="text" id="phone" name="phone" value="">
				<input type="text" id="passportNo" name="passportNo" value=""><br>
				<input type="text" id="birthDate" name="birthDate" value="">
				<input type="text" id="gender" name="gender" value=""><br>
				<input type="hidden" id="" name="" value="">
			</form>
		</div>
	</div>
</body>
</html>