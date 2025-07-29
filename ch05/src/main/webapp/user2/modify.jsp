<%@page import="vo.User2VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");

	//DB정보
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	User2VO user2 = null;
	//insert
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//db 연결
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		// sql 실행 객체 생성
		String sql = "select * from user2 where user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			user2 = new User2VO();
			user2.setUser_id(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setHp(rs.getString(3));
			user2.setAge(rs.getInt(4));
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
		<title>update</title>
	</head>
	<body>
		<h3>user2 update</h3>
		<a href="../jdbc.jsp">처음으로</a>
		<a href="./list.jsp">목록이동</a>
		
		<form action="./proc/modify.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" readonly name="user_id" value="<%= user2.getUser_id()%>" placeholder="아이디 입력"> </td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%= user2.getName()%>" placeholder="이름 입력"> </td>
				</tr>
				<tr>
					<td>휴대폰</td>
					<td><input type="text" name="hp" value="<%= user2.getHp()%>" placeholder="전화번호 입력"> </td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number" name="age" value="<%= user2.getAge()%>" placeholder="나이 입력"> </td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정하기" >
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>