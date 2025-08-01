<%@page import="java.util.ArrayList"%>
<%@page import="vo.User3DTO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	List<User3DTO> dtolist = new ArrayList<>();
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user3");
		while(rs.next()){
			User3DTO dto = new User3DTO();
			dto.setUser_id(rs.getString(1));
			dto.setName(rs.getString(2));
			dto.setHp(rs.getString(3));
			dto.setAge(rs.getInt(4));
			
			dtolist.add(dto);
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
		<title>user3 table</title>
	</head>
	<body>
		<h3>user3 목록</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user3/register.jsp">삽입</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>전화번호</td>
				<td>나이</td>
				<td>관리</td>
			</tr>
			<%for(User3DTO dto : dtolist) {%>
			<tr>
				<td><%= dto.getUser_id() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getHp() %></td>
				<td><%=dto.getAge() %></td>
				<td>
					<a href="/ch05/user3/modify.jsp?user_id=<%=dto.getUser_id()%>">수정</a>
					<a href="/ch05/user3/delete.jsp?user_id=<%=dto.getUser_id()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>