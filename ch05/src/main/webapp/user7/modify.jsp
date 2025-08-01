<%@page import="vo.User7DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String id = request.getParameter("id");
	
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	User7DTO dto = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("select * from user7 where id = ?");
		psmt.setString(1, id);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			dto = new User7DTO();
			dto.setName(rs.getString(2));
			dto.setAge(rs.getInt(3));
			dto.setEmail(rs.getString(4));
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
		<title>user7 테이블 수정</title>
	</head>
	<body>
		<h3>user7 테이블 수정</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user7/list.jsp">목록으로</a>
		<form action="/ch05/user7/proc/modify.jsp">
			<table border="1">
				<tr>
					<td>순번</td>
					<td><input type="text" readonly="readonly" name="id" value="<%=id%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number"  name="age" value="<%=dto.getAge()%>" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="email" name="email" value="<%=dto.getEmail()%>" placeholder="메일 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>