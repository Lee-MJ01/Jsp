<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.User1VO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//DB 정보
	final String HOST = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "lee0216";
	final String PASS = "1234";
	
	List<User1VO> users = new ArrayList<>();
	
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 데이터베이스 접속
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		Statement stmt = conn.createStatement();
		
		String sql = "select * from user1";
		ResultSet rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			User1VO vo = new User1VO();
			vo.setUser_id(rs.getString(1));
			vo.setName(rs.getString(2));
			vo.setHp(rs.getString(3));
			vo.setAge(rs.getInt(4));
			
			users.add(vo);
		}
		
		rs.close();
		stmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>User1 목록</h3>
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
			
			<% for(User1VO user1VO : users){ %>
			<tr>
				<th><%= user1VO.getUser_id() %></th>
				<th><%= user1VO.getName() %></th>
				<th><%= user1VO.getHp() %></th>
				<th><%= user1VO.getAge() %></th>
				<th>
					<!-- 수정하고자하는 사용자 아이디를 modify.jsp로 전송-->
					<a href = "./modify.jsp?user_id=<%= user1VO.getUser_id() %>">수정</a>
					<a href = "./delete.jsp?user_id=<%= user1VO.getUser_id() %>">삭제</a>
				</th>
			</tr>
			
			<%} %>
			
		</table>
	</body>
</html>