<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>수강목록</title>
	</head>
	<body>
		<h3>수강목록</h3>
		
		<a href="/ErdCollege">처음으로</a>
		
		<table border="1">
			<tr>
				<th>학번</th>
				<th>강의번호</th>
				<th>중간고사점수</th>
				<th>기말고사점수</th>
				<th>종합점수</th>
				<th>학점</th>
			</tr>
			<c:forEach var="reg" items="${dtoList}">
				<tr>
					<td>${reg.regStdNo}</td>
					<td>${reg.regLecNo}</td>
					<td>${reg.regMidScore}</td>
					<td>${reg.regFinalScore}</td>
					<td>${reg.regTotalScore}</td>
					<td>${reg.regGrade}</td>
					<td>					
						<a href="">수정</a>					
						<a href="">삭제</a>
					</td>
				</tr>
			</c:forEach>
		</table>		
	</body>
</html>