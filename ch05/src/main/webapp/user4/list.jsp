<%@page import="java.util.ArrayList"%>
<%@page import="vo.User4DTO"%>
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
	
	List<User4DTO> dtolist = new ArrayList<>();
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user4");
		
		while(rs.next()){
			User4DTO dto = new User4DTO();
			dto.setName(rs.getString(1));
			dto.setGender(rs.getString(2));
			dto.setAge(rs.getInt(3));
			dto.setAddr(rs.getString(4));
			
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
		<title>user4 목록</title>
	</head>
	<body>
		<h3>user4 테이블 목록</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user4/register.jsp">삽입하기</a>
		<table border="1">
			<tr>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
				<td>주소</td>
				<td>관리</td>
			</tr>
			
			<%for(User4DTO dto : dtolist){ %>
			<tr>
				<td><%=dto.getName() %></td>
				<td><%=dto.getGender() %></td>
				<td><%=dto.getAge() %></td>
				<td><%=dto.getAddr() %></td>
				<td>
					<a href="/ch05/user4/modify.jsp?name=<%=dto.getName()%>">수정</a>
					<a href="/ch05/user4/delete.jsp?name=<%=dto.getName()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>