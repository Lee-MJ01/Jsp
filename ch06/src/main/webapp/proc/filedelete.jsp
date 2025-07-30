<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="dto.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 파일 번호 수신 
	String no = request.getParameter("no");

	// 삭제할 파일명
	String savedName = null;
	// 데이터 베이스 파일정보 삭제
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
		Connection conn = ds.getConnection();
		
		String selectsql = "select sname from files where no = ?";
		PreparedStatement psmtSelect = conn.prepareStatement(selectsql);
		
		psmtSelect.setString(1, no);
		ResultSet rs = psmtSelect.executeQuery();
		
		if(rs.next()){
			savedName = rs.getString(1);
		}
		String deletesql = "delete from files where no = ?";
		PreparedStatement psmtDelete = conn.prepareStatement(deletesql);
		psmtSelect.setString(1, no);
		psmtSelect.executeUpdate();
		
		rs.close();
		psmtSelect.close();
		psmtDelete.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	// 저장된 파일 삭제
	String path = application.getRealPath("/files");
	File savedFile = new File(path + File.separator + savedName);
	
	savedFile.delete();
	
	// 목록이동
	response.sendRedirect("/ch06/fileDownload.jsp");
%>










