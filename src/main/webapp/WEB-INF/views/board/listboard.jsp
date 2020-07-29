mvn archetype:generate -DgroupId=com.mvn.java -DartifactId=JavaPrj -DarchetypeArtifactId=maven-archetype-quickstart


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
<%if(session.getAttribute("userid").equals("admin") || session.getAttribute("userid").equals("ADMIN")) { %>
<div class="ui container">

        <table class="ui unstackable  table">
            <thead>
                <tr class="text-center">
                    <th>Index</th>
                    <th>작성자</th>
                    <th>이름</th>
                    <th>전화번호</th>
                    <th class="right aligned">수정</th>
                    <th class="right aligned">삭제</th>
                </tr>
            </thead>
            <% } else { %>
            <tbody>
            <c:forEach var="row" items="${boardlist}" varStatus="status">
                <tr ng-repeat="user in users">
                    <td>${row.idx}</td>
                    <td>${row.userid}</td>
                    <td>${row.title}</td>
                    <td>${row.post_date}</td>
                    <td class="right aligned">
                        <a href="/board/boarddetail.bo/${row.idx}" style="text-decoration:none">Edit</a>
                    </td>
                    <td class="right aligned">
                        <a href="/board/boarddelete.bo?idx=${row.idx}" style="text-decoration:none">Delete</a>
                    </td>
                </tr>
                
                
						<a href="/board/boarddetail.bo/${row.idx}" style="text-decoration: none">
                </c:forEach>
            </tbody>
        </table>
        <% } %>
			<br> <br> <a href="/board/boardwriteForm.bo" style="text-decoration: none">글 작성</a>&nbsp; | &nbsp; 
			<a href="/main.do" style="text-decoration: none">뒤로가기</a>&nbsp; |
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