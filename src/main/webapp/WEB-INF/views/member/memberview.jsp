<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<center>
<h2>회원 상세정보</h2>
<form name="memberview" action="modifyForm.do" method="post">
<input type="hidden" name="userid" value="${memberdto.userid}">
<input type="hidden" name="userpw" value="${memberdto.userpw}">
<input type="hidden" name="useremail" value="${memberdto.useremail}">
<input type="hidden" name="username" value="${memberdto.username}">
<input type="hidden" name="usernum1" value="${memberdto.usernum1}">
<input type="hidden" name="usernum2" value="${memberdto.usernum2}">
<table border="1" width="700px">
	<tr>
		<td align="center">아이디</td>
		<td align="center">${memberdto.userid}</td>
	</tr>
	<tr>
		<td align="center">비밀번호</td>
		<td align="center">${memberdto.userpw}</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td align="center">${memberdto.useremail}</td>
	</tr>
	<tr>
		<td align="center">이름</td>
		<td align="center">${memberdto.username}</td>
	</tr>
	<tr>
		<td align="center">주민번호</td>
		<td align="center">${memberdto.usernum1} - ${memberdto.usernum2}</td>
	</tr>
	<tr>
		<td align="center">가입일자</td>
		<td align="center">${memberdto.join_date}</td>
	</tr>
</table>
</form>
<br><br>
<%if(session.getAttribute("userid").equals("admin") || session.getAttribute("userid").equals("ADMIN")) { %>
<a href="javascript:history.back()" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;
<a href="./" style="text-decoration:none">로그아웃</a>
<% } else { %>
<a href="main.do" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;

<a href="#" onclick="javascript:document.memberview.submit();" style="text-decoration:none">회원정보수정</a>&nbsp; | &nbsp;

<%-- <a href="#" onclick="location.href=modifyForm.do?userid=${userid}">회원정보수정</a> 도 가능하다. --%>

<a href="./" style="text-decoration:none">로그아웃</a>
<% } %>
</center>
</body>
</html>