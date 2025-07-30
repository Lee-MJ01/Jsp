<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>file upload</title>
		<%-- 
			날짜 : 2025.07.30.
			이름 : 이민준
			내용 : JSP 파일 업로드 실습
			
			JSP 파일 업로드 방식
			1) cos.jar 방식
			 - MultipartRequest를 이용한 파일업로드, 가장 많이 알려진 방식
			 - 너무 오래된 라이브러리로 버진 지원을 하지 않아 최신 Java17에서 이슈 발생
			 
			2) cpache-fileupload 방식
			 - apache 오픈소스로 제공되는 파일업로드 라이브러리
			 - Java 지원 재단이 Javax에서 Jakarta로 변경되어 너무 잦은 버전 변경으로 호환성 부족
			 
			3) WAS의 part 방식
			 - Tomcat 9버전부터 지원되는 파일 업로드 방식
			 - 업로드 파일을 part 객체로 처리됨
			 
			 WAS의 getPart 업로드 설정
			  - Server > context.xml > context 태크 allowCasualMultipartParsing="true" 속성 변경
			  - Server > server.xml > 63라인 Connector 태크에 maxPostSize="10485760" 속성 변경
		 --%>
	</head>
	<body>
		<h3>File Upload</h3>
		
		<form action="/ch06/proc/fileupload.jsp" method="post" enctype="multipart/form-data">
			<input type="text" name="title" placeholder="파일 제목 입력"> <br>
			<input type="text" name="name" placeholder="이름 입력"> <br>
			<input type="file" name="file1"> <br>
			<input type="submit" value = "파일 업로드 전송하기"> <br>
		
		
		</form>
	</body>
</html>