<%@page import="vo.User3DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	User3DTO dto = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "select * from user3 where user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			dto = new User3DTO();
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAge(rs.getInt(4));
		}
		
		rs.close();
		psmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>데이터 수정</title>
	</head>
	<body>
		<h3>데이터 수정</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<form action="/ch05/user3/proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" readonly name="user_id" value="<%=user_id%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=dto.getName()%>" placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="hp" value="<%=dto.getHp()%>" placeholder="전화번호 입력"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%=dto.getAge()%>" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>