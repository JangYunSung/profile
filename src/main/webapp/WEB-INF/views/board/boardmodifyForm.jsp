<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
#top{

}
#bord_title{
color: yellow;
background-color: red;
width: 400px;
}
#bord_contents{
color: yellow;
background-color: black;
width: 400px;
height: 380px;
}
#bord_button{
margin-top: 15px;

}
#button{
color: yellow;
background-color: red;
border-bottom-color: yellow;
}
</style>

<title>수정페이지</title>
</head>
<body>
<center>

<form action="/board/boardupdate.bo/${boarddto.idx}" method="post">
<input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">

<div id=top>
<h1>글    수 정</h1>
</div>

<div id=board_title>
<h5>글   제 목</h5>
<input type="text" name="title" style="width: 390px; margin-bottom: 20px;" value="${boarddto.title}">
</div>

<div id=board_contents style=" "  >
<h5>글   내 용</h5>
<!-- <input type="text" name="content" style="width: 390px; height: 300px;"> -->
<textarea rows="20" cols="52" name="content">${boarddto.content}</textarea>
</div>



<div id=board_button>
  <input type="submit" value="글 수정"></input>
  <input type="reset" value="다시 입력"></input>
</div>

</form>

</center>
</body>
</html>