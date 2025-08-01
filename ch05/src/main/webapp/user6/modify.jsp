<%@page import="vo.User6DTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String seq = request.getParameter("seq");
	
	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	User6DTO dto = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("select * from user6 where seq = ?");
		psmt.setString(1, seq);
		ResultSet rs = psmt.executeQuery();
		
		if(rs.next()){
			dto = new User6DTO();
			dto.setName(rs.getString(2));
			dto.setGender(rs.getString(3));
			dto.setAge(rs.getInt(4));
			dto.setAddr(rs.getString(5));
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
		<title>user5 테이블 수정</title>
	</head>
	<body>
		<h3>user5 테이블 수정</h3>
		<a href="/ch05/dbcp.jsp">처음으로</a>
		<a href="/ch05/user6/list.jsp">목록으로</a>
		<form action="/ch05/user6/proc/modify.jsp">
			<table border="1">
				<tr>
					<td>순번</td>
					<td><input type="number" readonly="readonly" name="seq" value="<%=seq%>"></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<input type="radio" name="gender" value="M">남자
						<input type="radio" name="gender" value="F">여자
					</td>
				</tr>
				<tr>
					<td>나이</td>
					<td><input type="number"  name="age" value="<%=dto.getAge()%>" placeholder="나이 입력"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td><input type="text" name="addr" value="<%=dto.getAddr()%>" placeholder="주소 입력"></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="수정하기"></td>
				</tr>
			</table>
		</form>
		
	</body>
</html>