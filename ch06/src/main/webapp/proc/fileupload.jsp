<%@page import="java.sql.PreparedStatement"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.io.File"%>
<%@page import="java.util.UUID"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	/*
		- 일반 form이 아닌 파일 전송폼(multipart/form-data)으로 전송되는 데이터는 request 객체 수신 안됨
		- 파일 전송폼으로 전송되는 데이터 수신(파일 포함)은 라이브러리(commons-fileupload)로 수신
	*/
	
	// 파일업로드 디렉터리 경로 생성
	String path = application.getRealPath("/files");
	
	// 업로드 파일 Part(업로드된 파일) 첨부 파일에서 가져오기
	Part part = request.getPart("file1");
		
	// 파일명 추출
	String oriName = part.getSubmittedFileName();
	System.out.println("fname : " + oriName);
	
	// 중복되지 않는 파일명으로 생성
	String ext = oriName.substring(oriName.lastIndexOf("."));
	String savedName = UUID.randomUUID().toString() + ext; // 유니버셜 id (중복되지 않음)
	
	// 파일 저장(경로 + 구분자 + 중복되지 않는 파일명)
	part.write(path + File.separator + savedName); // 운영체제마다 파일 구분자(\, / 등)가 다르기에 File.separator로 구분
	
	String title = request.getParameter("title");
	String name = request.getParameter("name");
	
	System.out.println("title : " + title + ", name : " + name);
	
	// 데이터베이스에 원본 파일명 저장(Insert)
	try{
		Context ctx = (Context) new InitialContext().lookup("java:comp/env");
		DataSource ds = (DataSource) ctx.lookup("jdbc/lee0216");
		Connection conn = ds.getConnection();
		
		String sql = "insert into files(title, name, oname, sname, rdate) values (?,?,?,?,sysdate)";
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, name);
		psmt.setString(3, oriName);
		psmt.setString(4, savedName);
		
		psmt.executeUpdate();
		
		psmt.close();
		conn.close();
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	// 파일 목록 이동(리다이렉트)
	response.sendRedirect("/ch06/fileDownload.jsp");
	
%>









