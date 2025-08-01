<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	
	String name = request.getParameter("name");

	String host = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "lee0216";
	String pass = "1234";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(host, user, pass);
		
		PreparedStatement psmt = conn.prepareStatement("delete from user4 where name =?");
		psmt.setString(1, name);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();

	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/user4/list.jsp");
%>