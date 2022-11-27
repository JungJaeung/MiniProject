<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>선택창</title>
<style>
	#container {
		width : 1000px; margin: 0 auto;
	}
	#flightList {
		width: 100%; height: 60px;
		border: 1px solid black;
	}
</style>
</head>
<body>
	<div id="container">
		<div id="flightList">
			<button id="selectButton">가는편 선택</button>
		</div>

	</div>
</body>
</html>