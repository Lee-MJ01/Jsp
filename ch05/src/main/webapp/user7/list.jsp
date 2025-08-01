<%@page import="vo.User7DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page  contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	List<User7DTO> dtolist = new ArrayList<>();
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user7");
		
		while(rs.next()){
			User7DTO dto = new User7DTO();
			
			dto.setId(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setAge(rs.getInt(3));
			dto.setEmail(rs.getString(4));
			
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
		<title>user7 테이블 목록</title>
	</head>
	<body>
		<h3>user7 테이블 목록</h3>
		
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user7/register.jsp?">삽입하기</a>
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>이름</td>
				<td>나이</td>
				<td>메일</td>
				<td>관리</td>
			</tr>
			
			<%for(User7DTO dto : dtolist){%>
			<tr>
				<td><%=dto.getId() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getAge() %></td>
				<td><%=dto.getEmail() %></td>
				<td>
					<a href="/ch05/user7/modify.jsp?id=<%=dto.getId()%>">수정</a>
					<a href="/ch05/user7/delete.jsp?id=<%=dto.getId()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>