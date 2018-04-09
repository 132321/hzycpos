<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin2_1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
	a{text-decoration:none;}
	.aStyle{width:150px;height:20px;margin-left:80px;margin-top:45px;}
</style>
  </head>
  
  <body>
  	
   <div class="aStyle">
		<a href="admin2_1_fytgl.jsp" target="rightFrame">放映厅管理</a>
	</div>
	<div class="aStyle">
		<a href="admin2_1_ypgl.jsp" target="rightFrame">影片管理</a>
	</div>
	<div class="aStyle">
		<a href="admin2_1_ypsy.jsp" target="rightFrame">影片上映</a>
	</div>
	<div class="aStyle">
		<a href="admin2_1_cxtj.jsp" target="rightFrame">查询统计</a>
	</div>
  </body>
</html>
