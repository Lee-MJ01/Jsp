<%@page import="vo.CustomerDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cid = request.getParameter("cid");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String address = request.getParameter("address");
	String rdate = request.getParameter("rdate");
	
	try{
		// DBCP 커넥션 풀 객체 가져오기
		Context ctx = (Context) new InitialContext().lookup("java:comp/env"); // java 기본 환경 객체 검색
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216"); // jdbc/lee2016 커넥션 풀 객체 검색
		Connection conn = ds.getConnection();
		
		PreparedStatement psmt = conn.prepareStatement("update customer set name=?, hp=?, address=?, rdate=? where cid=?");
		
		psmt.setString(1, name);
		psmt.setString(2, hp);
		psmt.setString(3, address);
		psmt.setString(4, rdate);
		psmt.setString(5, cid);
		
		psmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	response.sendRedirect("/ch05/customer/list.jsp");
%>
















