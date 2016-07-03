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
	<title>查询页面</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link href="Css/Serach.css" rel="stylesheet" type="text/css" />
	<link href="Css/config.css" rel="stylesheet" type="text/css" />	
	<link rel="stylesheet" type="text/css" href="Css/SerachResult.css">
  </head>
 <body>
 	<div id="serach">
		<form>
	    	<div class="inputdiv">
	            <label for="wxnum">微信号:</label>
	            <input value="" name="wxnum" id="wxnum"/><br />
	        </div>
	        <p id="tip" style="color:red"></p>
	        <a  id="submit" onclick="searchAgent()">查询</a>
	    </form>
	</div>
	<div id="powerdiv" style="display:none">
   		<img id="power" alt="代理授权书图片" src="Css/img/power.png">
   		<b id="powernum"></b>
   		<b id="name"></b>
   		<b id="wx"></b>
   		<b id="type"></b>
   		<b id="level"></b>
   		<b id="agstartyear" class="fontstyle"></b>
   		<b id="agstartmonth" class="fontstyle"></b>
   		<b id="agstartday" class="fontstyle"></b>
   		<b id="agendyear" class="fontstyle"></b>
   		<b id="agendmonth" class="fontstyle"></b>
   		<b id="agendday" class="fontstyle"></b>
    </div>
</body> 
<script src="js/jquery-1.9.1.js"type="text/javascript"></script>
<script>
function getYear(Time){
	return new Date(parseInt(Time.time,10)).getFullYear();
}
function getMonth(Time){
	return new Date(parseInt(Time.time,10)).getMonth()+1;
}
function getDay(Time){
	return new Date(parseInt(Time.time,10)).getDate();
}

function searchAgent(){
	var wxnum=$("#wxnum").val().trim();
	if(wxnum==""){ $("#tip").html("请填写账号");return;}
	else{$("#tip").html("");}
  	  $.ajax({
			   url: "AgentAction_getAgentByAgwxnum",
			   type: "POST",
			   data:{"agent.agwxnum":wxnum},
			   dataType: "json",
			   success: function (result) {
				   if(result.code==1){
					   $("#serach").hide();
					   $("#powerdiv").show();
					   var agent=result.agent;
					   $("#name").html(agent.agname);
					   $("#wx").html(agent.agwxnum);
					   if(agent.agtype==0){$("#type").html("公司");}
					   else if(agent.agtype==1){$("#type").html("个体户");}
					   else{$("#type").html("个人");}
					   if(agent.aglevel==0){$("#level").html("总代");}
					   else{$("#level").html(agent.aglevel+"级代理")}
					   $("#agstartyear").html(getYear(agent.agcreateday));
					   $("#agstartmonth").html(getMonth(agent.agcreateday));
					   $("#agstartday").html(getDay(agent.agcreateday));
					   $("#agendyear").html(getYear(agent.agdeadline));
					   $("#agendmonth").html(getMonth(agent.agdeadline));
					   $("#agendday").html(getDay(agent.agdeadline));
					   $("#powernum").html(agent.agauthorization);
				   }else{
					   $("#tip").html("该微信号没有授权");
				   }
			      }
			 }); 
}
</script>
</html>
