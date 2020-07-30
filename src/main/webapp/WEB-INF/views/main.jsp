<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>메인화면</title>

</head>
<body>
<center>
<% if(session.getAttribute("userid").equals("admin") || session.getAttribute("userid").equals("ADMIN")) { %>
<!-- 로그인한 사람이 관리자일 때 -->
<h2>관리자 모드 입니다.</h2>
<a href="memberlist.do" style="text-decoration:none">회원  리스트</a>&nbsp; | &nbsp;
<a href="board/blist.bo" style="text-decoration:none">게시판</a>&nbsp; | &nbsp;
<a href="phone/phonelist.pb" style="text-decoration:none">주소록</a>&nbsp; | &nbsp;
<a href="./" style="text-decoration:none">로그 아웃</a>
<% } else { %>
<a href="myinfo.do?userid=<%=session.getAttribute("userid")%>" style="text-decoration:none">내 정보 보기</a>&nbsp; | &nbsp;
<a href="board/blist.bo" style="text-decoration:none">게시판</a>&nbsp; | &nbsp;
<a href="phone/phonelist.pb" style="text-decoration:none">주소록</a>&nbsp; | &nbsp;
<a href="/" style="text-decoration:none">로그 아웃</a>
<% } %>
</center>
</body>
</html>