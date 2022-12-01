<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
</head>
<body>
	<div>
		<form id="reservationForm" action="/reservation/insertReservation.do" method="post">
			<input type="hidden" id="dptMap" name="dptMap" value="${dptMap }">
			<input type="hidden" id="arvMap" name="arvMap" value="${arvMap }">
			
			<input type="submit" value="예약">
		</form>
	</div>
	<script>
		$(function() {
			
		});
	</script>
</body>
</html>