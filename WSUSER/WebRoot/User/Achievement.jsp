<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>Achievement</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="./Css/Achievement.css" rel="stylesheet" type="text/css">
	<link href="./Css/config.css" rel="stylesheet" type="text/css">
<style> 
#achievement
{
	margin-top: -230px;
	animation:myfirst 2;
	-moz-animation:myfirst 2s; /* Firefox */
	-webkit-animation:myfirst 2s; /* Safari and Chrome */
	-o-animation:myfirst 2s; /* Opera */
	animation-fill-mode : forwards; /*结束动画时保持在最终状态*/
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
<div id="achievement">
	<h1 id="title">我的业绩</h1>
    <div id="achbody">
	    <!-- <p><b>您的微信号：</b><span>rjy941121</span></p>
	    <p><b>您本月的团队业绩：</b><span>31036</span></p>
	    <p><b>您本月的团队奖金：</b><span>15518</span></p>
	    <p><b>您本月的个人业绩：</b><span>29024</span></p>
	    <p><b>您本月的个人奖金：</b><span>15115.6</span></p> -->
    </div>
    
    <div id="achTeambody">
	    <!-- <p><b>您的下属总代业绩：</b></p>
	    <p><b>坤哥</b><b>团队业绩：</b>
	    <span>2012</span></p> -->
    </div>
    
</div>
<script src="js/jquery-1.9.1.js" type="text/javascript"></script>
<script>

  	//var agname = "${agent.agname}";
  	var agid = ${agent.agid}
  	//alert("代理名:"+agname+"代理id:"+agid);
  	
getAchievement();

function getAchievement(){
  	  $.ajax({
			   url: "AchievementAction_getPerformanceByAgid",
			   type: "POST",
			   data: { "agent.agid": agid},
			   dataType: "json",
			   success: function (result) {
				   var achievement = result.lp;
				   //alert(achievement.agwxnum);
				   var achievementTeam = result.lp2;
				   
				   if(result.code==1){
					 var html="";
					 html+="<p><b>您的微信号：</b><span>"+achievement.agwxnum+"</span></p>";
					 html+="<p><b>您本月的团队业绩：</b><span>"+achievement.money+"</span></p>";
					 html+="<p><b>您本月的团队奖金：</b><span>"+achievement.teambonus+"</span></p>";
					 html+="<p><b>您本月的个人业绩：</b><span>"+achievement.personmoney+"</span></p>";
					 html+="<p><b>您本月的个人奖金：</b><span>"+achievement.personbonus+"</span></p>";
					 $("#achbody").html(html);
					 
					 var html2="<p><b>您的下属总代业绩：</b></p>";
					 if(achievementTeam.length>0){
						 for(var i=0;i<achievementTeam.length;i++){
							 html2+="<p><b>"+achievementTeam[i].agname+"</b><b>团队业绩：</b><span>"+achievementTeam[i].money+"</span></p>";
						 }
					 }else{
						 html2="<p>您还没有下属总代业绩</p>";
					 }
					$("#achTeambody").html(html2);
					 
				   }else{
					 /*   alert("账号密码错啦"); */
					   $("#achbody").html("您暂无业绩");
					  $("#achTeambody").html("您暂无下属");
				   }
			      },
			   error:function(XMLHttpRequest, textStatus, errorThrown) {
				  alert(XMLHttpRequest.status);
				   alert(XMLHttpRequest.readyState);
				   alert(textStatus);
			   }
			 }); 
}
</script>


</body>
</html>
