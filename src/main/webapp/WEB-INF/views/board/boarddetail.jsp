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
<h2>게시글 상세보기</h2>
<form name="boarddetail" action="/board/boardmodifyForm.bo/${boarddto.idx}" method="post">
<table border="1" width="400px">
	<%-- <tr>
		<td align="center">글 번호</td>
		<td align="center">${boarddto.rownum}</td>
	</tr> --%>
	<tr>
		<td align="center">작성자</td>
		<td align="center">${boarddto.userid}</td>
	</tr>
	<tr>
		<td align="center">제 목</td>
		<td align="center">${boarddto.title}</td>
	</tr>
	<tr>
		<td align="center">글 내용</td>
		<td align="center">${boarddto.content}</td>
	</tr>
	<tr>
		<td align="center">작성 일자</td>
		<td align="center"><fmt:formatDate value="${boarddto.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
</table>
</form>
<br><br>
<c:if test="${boarddto.userid eq sessionScope.userid}">
<a href="/board/boarddelete.bo?idx=${boarddto.idx}" style="text-decoration:none">글 삭제</a>&nbsp; | &nbsp;
<a href="#" onclick="javascript:document.boarddetail.submit();" style="text-decoration:none">글 수정</a>&nbsp; | &nbsp;
</c:if>
<a href="/board/blist.bo" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;
<a href="/" style="text-decoration:none">로그아웃</a>
</center>
</body>
</html>