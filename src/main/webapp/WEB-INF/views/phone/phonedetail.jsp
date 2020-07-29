<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주소록</title>
</head>
<body>
<center>
<h2>주소록 상세페이지</h2>	
<form name="phonedetail" action="/phone/phonemodifyForm.pb/${phonedto.idx}" method="post">
<table border="1" width="400px">
	<tr>
		<td align="center">이 름</td>
		<td align="center">${phonedto.name}</td>
	</tr>
	<tr>
		<td align="center">전화번호</td>
		<td align="center">${phonedto.phonenum}</td>
	</tr>
	<tr>
		<td align="center">이메일</td>
		<td align="center">${phonedto.email}</td>
	</tr>
	<tr>
		<td align="center">메 모</td>
		<td align="center">${phonedto.memo}</td>
	</tr>
</table>
</form>
<br><br>
<a href="/phone/phonedelete.pb?idx=${phonedto.idx}" style="text-decoration:none">글 삭제</a>&nbsp; | &nbsp;
<a href="#" onclick="javascript:document.phonedetail.submit();" style="text-decoration:none">글 수정</a>&nbsp; | &nbsp;

<a href="/phone/phonelist.pb" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;
<a href="/" style="text-decoration:none">로그아웃</a>
</center>
</body>
</html>