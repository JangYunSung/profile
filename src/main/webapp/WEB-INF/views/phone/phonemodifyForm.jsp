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

<form action="/phone/phoneupdate.pb/${phonedto.idx}" method="post">
<input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">	
<div id=top>
<h1>수 정 하 기</h1>
</div>

<div id=phone_name>
<h5>이 름</h5>
<input type="text" name="name" style="width: 390px; margin-bottom: 20px;" value="${phonedto.name}">
</div>
<div id=phone_phonenum>
<h5>전화번호</h5>
<input type="text" name="phonenum" style="width: 390px; margin-bottom: 20px;" value="${phonedto.phonenum}">
</div>
<div id=phone_email>
<h5>이 메 일</h5>
<input type="text" name="email" style="width: 390px; margin-bottom: 20px;" value="${phonedto.email}">
</div>
<div id=phone_memo>
<h5>메 모</h5>
<input type="text" name="memo" style="width: 390px; margin-bottom: 20px;" value="${phonedto.memo}">
</div>





<div id=phone_button>
  <input type="submit" value="수정"></input>
  <input type="reset" value="다시 입력"></input>
</div>

</form>


</center>
</body>
</html>