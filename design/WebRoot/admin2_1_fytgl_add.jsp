<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin2_1_fytgl_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		.style{width:350px;height:20px;margin-left:600px;margin-top:40px;}
	</style>
	
  </head>
  
  <body>
    <form action="addFYT.do" method="post">
    	<div class="style">
    		放映厅名称：<input type="text" name="name" >
    	</div>	
    	
    	<div class="style">
    	影厅类型：
    	<select name="type">
    		<option>普通	</option>
    		<option>3D</option>
    		<option>IMAX</option>
    	</select>
    	</div>
    	
    	<div class="style">
    		负责人：<input type="text" name="admin">
    	</div>
    	
    	<div class="style">
    		<input type="submit" value="提交" style="width:100px;height:25px;">
    	</div>
    	
    	
    
    </form>
  </body>
</html>
