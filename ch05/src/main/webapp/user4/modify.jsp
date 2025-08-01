<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="vo.User4DTO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String name = request.getParameter("name");

	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	User4DTO dto = null;
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("select * from user4 where name = ?");
		psmt.setString(1, name);
		
		ResultSet rs = psmt.executeQuery();
		if(rs.next()){
			dto = new User4DTO();
			dto.setName(rs.getString(1));
			dto.setGender(rs.getString(2));
			dto.setAge(rs.getInt(3));
			dto.setAddr(rs.getString(4));
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
		<title>user4 테이블 수정</title>
	</head>
	<body>
		<h3>user4 테이블 수정</h3>
		
		<form action="/ch05/user4/proc/modify.jsp">
			<table>
				<tr>
					<td>이름</td>
					<td><input type="text" readonly="readonly" name="name" value="<%=dto.getName()%>"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td><input type="text" name="gender" value="<%=dto.getGender()%>" placeholder="성별 입력"></td>
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