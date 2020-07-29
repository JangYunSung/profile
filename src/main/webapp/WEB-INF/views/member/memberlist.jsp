<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>회원 리스트</h2>
<table border="1" width="700px">
	<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>이메일</th>
		<th>가입일자</th>
		<th>회원 삭제</th>
	</tr>
<c:forEach var="row" items="${list }">
	<tr>
		<td align="center">${row.userid}</td>
		<td align="center"><a href="memberview.do?userid=${row.userid}" style="text-decoration:none">${row.username}</a></td>
		<td align="center">${row.useremail}</td>
		<td align="center"><fmt:formatDate value="${row.join_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td align="center"><a href="memberdelete.do?userid=${row.userid}" style="text-decoration:none">삭제</a></td>
	</tr>
</c:forEach>
</table><br><br>
<a href="main.do" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;
<a href="/" style="text-decoration:none">로그아웃</a>
</center>
</body>
</html>