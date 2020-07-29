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
<title>추가하기</title>
</head>
<body>
<center>

<form name="phonewrite" action="/phone/phonewrite.pb" method="post">
<input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">

<div id=top>
<h1>추 가 하 기</h1>
</div>
	

<div id=phone_name>
<h5>이름</h5>
<input type="text" name="name" style="width: 390px; margin-bottom: 20px;">
</div>
<div id=phone_phonenum>
<h5>전화번호</h5>
<input type="text" name="phonenum" style="width: 390px; margin-bottom: 20px;">
</div>
<div id=phone_email>
<h5>이메일</h5>
<input type="text" name="email" style="width: 390px; margin-bottom: 20px;">
</div>
<div id=phone_memo>
<h5>메 모</h5>
<!-- <input type="text" name="content" style="width: 390px; height: 300px;"> -->
<textarea rows="20" cols="52" name="memo"></textarea>
</div>






<div id=phone_button>
  <input type="submit" name="submit" value="추가" id="button"></input>
  <input type="reset" name="reset" value="다시 입력"id="button"></input>
</div>

</form>

</center>
</body>
</html>