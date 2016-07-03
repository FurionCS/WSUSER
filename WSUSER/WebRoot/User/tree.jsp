<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
      <title>组织树型图</title>
       <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="Css/Tree.css" rel="stylesheet" type="text/css">
	<link href="Css/zTreeStyle.css" rel="stylesheet" type="text/css">
	<link href="Css/config.css" rel="stylesheet" type="text/css">
	<link href="Css/catalogSytle.css" rel="stylesheet" type="text/css">

  </head>
  
  <body>
  	<h2>我的组织树型图</h2>
  	<ul id="treeDemo" class="ztree mytree"></ul>
  	<script src="js/jquery-1.9.1.js"type="text/javascript"></script>
  	<script src="js/jquery.ztree.core.js"></script>
  	<script>
  	
  	var agname = "${agent.agname}";
  	var agid = ${agent.agid}
  	var agpid = ${agent.agpid}
  	
  	var setting = {
  			data: {
  				simpleData: {
  					enable: true
  				}
  			}
  			,async: {
  				enable: true,
  				url:"AgentAction_getAgentTreeData",
  				autoParam:["id"],
  				dataFilter: filter
  			}
  		};
  		function filter(treeId, parentNode, childNodes) {
  			if (!childNodes) return null;
  			for (var i=0, l=childNodes.length; i<l; i++) {
  				childNodes[i].name = childNodes[i].name.replace('','');
  			}
  			return childNodes;
  		}
  		var zNodes =[
  			{ id:agid, pId:agpid, name:agname,isParent:true,iconOpen:"Css/img/diy/10.png", iconClose:"Css/img/diy/10.png"}	
  		];
  		$(document).ready(function(){
  			$.fn.zTree.init($("#treeDemo"), setting,zNodes);
  		});
  	</script>
  </body>

</html>
