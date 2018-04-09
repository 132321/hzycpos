<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin2_1_cxtj.jsp' starting page</title>
    
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
  <a href="admin2_1.jsp" target="rightFrame">返回</a>
  <h2 class="aStyle">查询统计</h2>
   <div class="aStyle">
		<a href="cxmx.do" target="leftFrame">销售明细</a>
	</div>
	
  </body>
</html>
