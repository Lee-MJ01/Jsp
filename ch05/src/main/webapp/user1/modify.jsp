<%@page import="vo.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
	// 전송 데이터 수신
	String user_id = request.getParameter("user_id");
	
	//DB 정보
	final String HOST = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "lee0216";
	final String PASS = "1234";
	
	// 수정할 사용자 객체
	User1VO user1 = null;
	
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 데이터베이스 접속
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		String sql = "select * from user1 where user_id=?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user1 = new User1VO();
			user1.setUser_id(rs.getString(1));
			user1.setName(rs.getString(2));
			user1.setHp(rs.getString(3));
			user1.setAge(rs.getInt(4));
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
		<title>user1::modify</title>
	</head>
	<body>
		<h3>User1 수정</h3>
		<a href="../jdbc.jsp">처음으로</a>
		<a href="./list.jsp">목록이동</a>
		
		<form action="./proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="user_id" readonly value="<%=user1.getUser_id() %>" placeholder="아이디 입력">></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=user1.getName() %>" placeholder="이름 입력">></td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%=user1.getHp() %>" placeholder="휴대폰 입력(- 포함)">></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%=user1.getAge() %>" placeholder="숫자 입력">></td>
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