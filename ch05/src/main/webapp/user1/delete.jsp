<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");

	//DB 정보
	final String HOST = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "lee0216";
	final String PASS = "1234";
	
	try{
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		
		String sql = "delete from user1 where user_id = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("./list.jsp");
%>



