<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	String cid 		= request.getParameter("cid");
	String name 	= request.getParameter("name");
	String hp 		= request.getParameter("hp");
	String address 	= request.getParameter("address");
	String rdate 	= request.getParameter("rdate");
	
	try{
		// DBCP 커넥션 풀 객체 가져오기
		Context initCtx = new InitialContext(); // 환경 객체 생성
		Context ctx = (Context) initCtx.lookup("java:comp/env"); // java 기본 환경 객체 검색
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216"); // jdbc/lee2016 커넥션 풀 객체 검색
		
		// 커넥션 풀에서 접속 커넥션 가져오기
		Connection conn = ds.getConnection();
		
		// sql 실행 객체 생성
		String sql = "insert into customer values(?,?,?,?,?)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, cid);
		psmt.setString(2, name);
		psmt.setString(3, hp);
		psmt.setString(4, address);
		psmt.setString(5, rdate);
		
		// sql 실행
		psmt.executeUpdate();
		
		// 종료(커넥션 반납)
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 목록 이동
	response.sendRedirect("/ch05/customer/list.jsp");
%>






















