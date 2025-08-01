<%@ page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>데이터 삽입</title>
	</head>
	<body>
		<h3>데이터 삽입</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<form action="/ch05/user3/proc/register.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="user_id" placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="hp" placeholder="전화번호 입력"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="삽입하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>