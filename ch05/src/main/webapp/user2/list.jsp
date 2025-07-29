<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User2VO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	//DB정보
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	List<User2VO> users = new ArrayList<>(); 
	
	//select
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		//db 연결
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		String sql = "select * from user2";
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			User2VO user2 = new User2VO();
			user2.setUser_id(rs.getString(1));
			user2.setName(rs.getString(2));
			user2.setHp(rs.getString(3));
			user2.setAge(rs.getInt(4));
			
			users.add(user2);
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>User2 Table</title>
	</head>
	<body>
		<h3>User2 Table</h3>
		<a href="../jdbc.jsp">처음으로</a>
		<a href="./register.jsp">등록하기</a>
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<%for(User2VO user2s : users) {%>
				<tr>
					<th><%= user2s.getUser_id() %></th>
					<th><%= user2s.getName() %></th>
					<th><%= user2s.getHp() %></th>
					<th><%= user2s.getAge() %></th>
					<th>
						<a href="./modify.jsp?user_id=<%= user2s.getUser_id() %>">수정</a>
						<a href="./delete.jsp?user_id=<%= user2s.getUser_id()%>">삭제</a>
					</th>
			</tr>
			<%} %>
			
		</table>
	</body>
</html>