<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>JSP 내장객체 - request</title>
		
		<%--
			날짜 : 2025.07.28.
			이름 : 이민준
			내용 : JSP 내장객체 request 실습
		 --%>
	</head>
	<body>
		<h3>JSP 내장객체 - request</h3>
		
		<h4>GET 요청</h4>
		<a href="./proc/result1.jsp?uid=a101"> 요청1</a>
		<a href="./proc/result1.jsp?uid=a102&name=이민준"> 요청2</a>
		<a href="./proc/result1.jsp?uid=a103&name=김유신&age=23"> 요청3</a>
		
		<h4>POST 요청</h4>
		<form action="./proc/result2.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name ="uid" placeholder="아이디 입력하세요."/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name ="name" placeholder="이름 입력하세요."/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name ="birth"/></td>
				</tr>
				<tr>
					<td colspan="2" align = "right">
						<input type="submit" value="전송하기"/>
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>












