<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 목록</title>
</head>
<style>
h2 {
	text-align: center;
}

table {
	width: 100%;
}

#outter {
	display: block;
	width: 60%;
	margin: auto;
}

a {
	text-decoration: none;
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "/board/blist.bo?nowPage=${paging.nowPage}&cntPerPage=" + sel;
	}
</script>
<body>
	<h2>게시판</h2>

	<div id="outter">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
					보기</option>
			</select>
		</div>
		<!-- 옵션선택 끝 -->
		<center>
			<%
				if (session.getAttribute("userid").equals("admin") || session.getAttribute("userid").equals("ADMIN")) {
			%>
			<h2>게시글 관리</h2>
			<table border="1">
				<tr>
					<th width="80px">글 번호</th>
					<th width="90px">작성자</th>
					<th width="100px">제 목</th>
					<th width="200px">작성 일자</th>
					<th width="40px">삭 제</th>
					<th width="40px">수 정</th>
				</tr>
				<c:forEach items="${viewAll}" var="row" varStatus="status">
					<tr>
						<td align="center">${row.idx}</td>
						<td align="center">${row.userid}</td>
						<td align="center">${row.title}</td>
						<td align="center"><fmt:formatDate value="${row.post_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td align="center"> <a href="/board/boarddetail.bo/${row.idx}" style="text-decoration:none">수 정</a></td>
						<td align="center"><a href="/board/boarddelete.bo?idx=${row.idx}"style="text-decoration: none">삭 제</a></td>
					</tr>
				</c:forEach>
			</table>
			<%
				} else {
			%>
			<h2>게시글 목록</h2>
			<table border="1">
				<tr>
					<th width="80px">글 번호</th>
					<th width="90px">작성자</th>
					<th width="100px">제 목</th>
					<th width="200px">작성 일자</th>
					<th width="80px">상세 페이지</th>
				
				</tr>
				<c:forEach var="row" items="${viewAll}" varStatus="status">
					<!-- ${status.index} : 0부터  / ${status.count} : 1부터 -->
					<tr>
						<td align="center">${row.idx}</td>
						<td align="center">${row.userid}</td>
						<td align="center">${row.title}</td>
						<td align="center"><fmt:formatDate value="${row.post_date}"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td align="center"><a href="/board/boarddetail.bo/${row.idx}"
							style="text-decoration: none">더 보기</a></td>
					</tr>
				</c:forEach>
			</table>
			<%
				}
			%>
			<br> <br> <a href="/board/boardwriteForm.bo"
				style="text-decoration: none">글 작성</a>&nbsp; | &nbsp; <a
				href="/main.do" style="text-decoration: none">뒤로가기</a>&nbsp; |
			&nbsp; <a href="/" style="text-decoration: none">로그아웃</a>
		</center>
		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a
					href="/board/blist.bo?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
				var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>${p }</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
						<a href="/board/blist.bo?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage}">
				<a
					href="/board/blist.bo?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
			</c:if>
		</div>
	</div>
</body>
</html>