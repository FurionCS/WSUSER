<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>UserLogin</title>    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link href="../Css/login.css" rel="stylesheet" type="text/css">
	<link href="../Css/config.css" rel="stylesheet" type="text/css">

<style> 
#LoginBody
{
	margin-top: -230px;
	animation:myfirst 2;
	-moz-animation:myfirst 2s; /* Firefox */
	-webkit-animation:myfirst 2s; /* Safari and Chrome */
	-o-animation:myfirst 2s; /* Opera */
	animation-fill-mode : forwards; /*结束动画时保持在最终状态*/
	-webkit-animation-fill-mode : forwards;
	-moz-animation-fill-mode : forwards;
	-o-animation-fill-mode : forwards;
}

@keyframes myfirst
{
from {margin-top: -230px;}
to {margin-top: 100px;}
}

@-moz-keyframes myfirst /* Firefox */
{
from {margin-top: -230px;}
to {margin-top: 100px;}
}

@-webkit-keyframes myfirst /* Safari and Chrome */
{
from {margin-top: -230px;}
to {margin-top: 100px;}
}

@-o-keyframes myfirst /* Opera */
{
from {margin-top: -230px;}
to {margin-top: 100px;}
}
</style>
  </head>
  
 <body>
  <div id="LoginBody">
<h2 id="title" style="border-radius:6px 6px 0px 0px;">总代登录</h2>
<form>
<div id="formbody">
	<div class="inputdiv">
      <label for="wxnum">微信号:</label>
  	  <input name="wxnum" type="text" id="wxnum" class="input" placeholder="请填写您的微信号"><br>   </div>
     <div class="inputdiv">
      <label for="password">密码:</label>
   	   <input name="password" type="password" id="password" class="input" placeholder="请填写您的密码"> 	  
 </div>
  <p id="tip"></p>
<a href="javascript:void(0)" id="submit" onclick="login()">登录</a>
</div>
</form>
<p id="changepassword"><a href="changePassword.jsp">修改密码</a></p>
</div>
</body>
<script src="../js/jquery-1.9.1.js" type="text/javascript"></script>
<script>

function login(){
	var wxnum=$("#wxnum").val().trim();
	if(wxnum==""){ $("#tip").html("请填写账号");return;}
	else{$("#tip").html("");}
	var password=$("#password").val().trim();
	if(password==""){ $("#tip").html("请填写密码");return;}
	else{$("#tip").html("");}
  	  $.ajax({
			   url: "AgentAction_login",
			   type: "POST",
			   data:{"agent.agwxnum":wxnum,"agent.agpassword":password},
			   dataType: "json",
			   success: function (result) {
				   if(result.code==1){
					   location.href="catalog.jsp";
				   }else{
					   $("#tip").html("账号或密码不正确");
				   }
			      },
			   error:function(XMLHttpRequest, textStatus, errorThrown) {
				   //alert(XMLHttpRequest.status);
				  // alert(XMLHttpRequest.readyState);
				   //alert(textStatus);
			   }
			 }); 
}
</script>


</html>
