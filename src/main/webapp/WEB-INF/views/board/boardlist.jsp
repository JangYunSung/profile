<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리스트</title>
</head>

<body>
<center>
<%if(session.getAttribute("userid").equals("admin") || session.getAttribute("userid").equals("ADMIN")) { %>
<h2>게시글 관리</h2>
<table border="1">
	<tr>
		<th width="80px">글 번호</th>
		<th width="90px">작성자</th>
		<th width="100px">제 목</th>
		<th width="200px">작성 일자</th>
		<th width="80px">글 삭제</th>
	</tr>
<c:forEach var="row" items="${boardlist}" varStatus="status">
<!-- ${status.index} : 0부터  / ${status.count} : 1부터 -->
	<tr>
		<td align="center">${row.idx}</td>
		<td align="center">${row.userid}</td>
		<td align="center"><a href="/board/boarddetail.bo/${row.idx}" style="text-decoration:none">${row.title}</a></td>
		<td align="center"><fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		<td align="center"><a href="/board/boarddelete.bo?idx=${row.idx}" style="text-decoration:none">삭 제</a></td>
	</tr>
</c:forEach>
</table>
<% } else { %>
<h2>게시글 목록</h2>
<table border="1">
	<tr>
		<th width="80px">글 번호</th>
		<th width="90px">작성자</th>
		<th width="100px">제 목</th>
		<th width="200px">작성일자</th>
	</tr>
<c:forEach var="row" items="${boardlist}" varStatus="status">
<!-- ${status.index} : 0부터  / ${status.count} : 1부터 -->
	<tr>
		<td align="center">${row.idx}</td>
		<td align="center">${row.userid}</td>
		<td align="center"><a href="/board/boarddetail.bo/${row.idx}" style="text-decoration:none">${row.title}</a></td>
		<td align="center"><fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
	</tr>
</c:forEach>
</table>
<% } %>


<br><br>
<a href="/board/boardwriteForm.bo" style="text-decoration:none">글 작성</a>&nbsp; | &nbsp;
<a href="/main.do" style="text-decoration:none">뒤로가기</a>&nbsp; | &nbsp;
<a href="/" style="text-decoration:none">로그아웃</a>
</center>
</body>
</html>