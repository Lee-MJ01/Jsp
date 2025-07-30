<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String user_id = request.getParameter("cid");

	try{
		// DBCP 커넥션 풀 객체 가져오기
		Context initCtx = new InitialContext(); // 환경 객체 생성
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // java 기본 환경 객체 검색
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216"); // jdbc/lee2016 커넥션 풀 객체 검색
		
		// 커넥션 풀에서 접속 커넥션 가져오기
		Connection conn = ds.getConnection();
				
		String sql = "delete from customer where cid = ?";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, user_id);
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/customer/list.jsp");
%>



