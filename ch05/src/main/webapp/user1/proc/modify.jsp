<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("user_id");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String age = request.getParameter("age");
	
	// DB 정보
	final String HOST = "jdbc:oracle:thin:@localhost:1521:xe";
	final String USER = "lee0216";
	final String PASS = "1234";
	
	try{
		// 드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 데이터베이스 접속
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		Statement stmt = conn.createStatement();
				
		String sql = "update user1 set name = '"+name+"', hp ='" + hp + "', age ="+age+" ";
		sql += "where user_id = '"+user_id+"'";
		
		stmt.executeUpdate(sql);
		
		stmt.close();
		conn.close();
	}catch(Exception e){
		e.printStackTrace();
	}
	response.sendRedirect("../list.jsp");
%>
















