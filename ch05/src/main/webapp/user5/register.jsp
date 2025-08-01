<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user5 데이터 삽입</title>
	</head>
	<body>
		<h3>user5 데이터 삽입</h3>
		
		<a href="/ch05/dbcp.jsp">처음으로</a>
	 	<form action="/ch05/user5/proc/register.jsp">
	 		<table border="1">
	 			<tr>
	 				<td>이름</td>
	 				<td><input type="text" name="name" placeholder="이름 입력"></td>
	 			</tr>
	 			<tr>
	 				<td>성별</td>
	 				<td>
		 				<input type="radio" name="gender" value="M">남자
		 				<input type="radio" name="gender" value="F">여자
	 				</td>
	 			</tr>
	 			<tr>
	 				<td>나이</td>
	 				<td><input type="number" name="age" placeholder="나이 입력"></td>
	 			</tr>
	 			<tr>
	 				<td>주소</td>
	 				<td><input type="text" name="addr" placeholder="주소 입력"></td>
	 			</tr>
	 			<tr>
	 				<td colspan="2" align="right"><input type="submit" value="삽입하기"></td>
	 			</tr>
	 		</table>
	 	</form>
	</body>
</html>