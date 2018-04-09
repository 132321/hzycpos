<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'kongbu.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <div>
  	<a href="">返回首页</a>
  </div>
    <% 
    String photo = request.getParameter("photo");
    %>
    <div style="width:600px;height:1000px;float:left;">
    	<div style="width:300px;height:1000px;float:left;">
    		<img src="<%=photo %>" style="margin-top:200px;width:300px;height:500px;float:left;">
    	</div>
    	<div style="width:200px;height:800px;float:left;margin-left:50px;">
    		<table  align="center" style="margin-top:200px;width:200px;height:500px;float:left;">
    		<tr>
    			<td>影片名称：</td>
    			<td>借眼</td>
    		</tr>
    		<tr>
    			<td>导演：</td>
    			<td>求得麻袋</td>
    		</tr>
    		<tr>
    			<td>演员：</td>
    			<td>曹云金等</td>
    		</tr>
    		<tr>
    			<td>国家：</td>
    			<td>美国</td>
    		</tr>
    		<tr>
    			<td>语言：</td>
    			<td>英语</td>
    		</tr>
    		<tr>
    			<td>影片时长：</td>
    			<td>200min</td>
    		</tr>
    		<tr>
    			<td>主要内容：</td>
    			<td>特别恐怖</td>
    		</tr>
    	</div>
    </div>
   		
  </body>
</html>
