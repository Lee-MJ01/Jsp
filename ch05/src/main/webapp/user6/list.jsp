<%@page import="vo.User6DTO"%>
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
	
	List<User6DTO> dtolist = new ArrayList<>();
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from user6");
		
		while(rs.next()){
			User6DTO dto = new User6DTO();
			
			dto.setSeq(rs.getInt(1));
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getInt(4));
			dto.setAddr(rs.getString(5));
			
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
		<title>user6 테이블 목록</title>
	</head>
	<body>
		<h3>user6 테이블 목록</h3>
		
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user6/register.jsp?seq=<%=dtolist.size()%>">삽입하기</a>
		<table border="1">
			<tr>
				<td>순번</td>
				<td>이름</td>
				<td>성별</td>
				<td>나이</td>
				<td>주소</td>
				<td>관리</td>
			</tr>
			
			<%for(User6DTO dto : dtolist){%>
			<tr>
				<td><%=dto.getSeq() %></td>
				<td><%=dto.getName() %></td>
				<td><%=dto.getGender() %></td>
				<td><%=dto.getAge() %></td>
				<td><%=dto.getAddr() %></td>
				<td>
					<a href="/ch05/user6/modify.jsp?seq=<%=dto.getSeq()%>">수정</a>
					<a href="/ch05/user6/delete.jsp?seq=<%=dto.getSeq()%>">삭제</a>
				</td>
			</tr>
			<%} %>
		</table>
	</body>
</html>