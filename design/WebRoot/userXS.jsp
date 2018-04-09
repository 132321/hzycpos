<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.po.AdminAdd_YP_Po"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userXS.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<style type="text/css">
		img{
			width:150px;height:150px;margin-left:40px;margin-top:45px;
		}
		
	</style>
	<script type="text/javascript">
		function img(x){
			window.location.href="userSelect.do?photo="+x+"";
		}
	</script>

  </head>
  
  <body>
    <a href="">返回首页</a>
	<%
	
		List<String> a = (List<String>)request.getAttribute("b"); 
		for(int i=0 ;i<a.size();i++){
		 %>
		 <img src="<%=a.get(i) %>" onclick="img('<%=a.get(i)%>')">
		 <%
		 }
	%>    
    
  </body>
</html>
