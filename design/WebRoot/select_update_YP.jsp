<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'select_update_YP.jsp' starting page</title>
    
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
    <form action="updateYP.do" method="post" align="center" enctype="multipart/form-data" >
   		<input type="hidden" name="id" value="${AdminAdd_YP_Po.id}" />
   		<input type="hidden" name="photo" value="${AdminAdd_YP_Po.photo}" />
   		影片名称：<input type="text" name="name" value="${AdminAdd_YP_Po.name}" /><br /><br />
   		导演：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="director" value="${AdminAdd_YP_Po.director}" /><br /><br />
   		演员：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="actor" value="${AdminAdd_YP_Po.actor}" /><br /><br />
   		国家：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="country" value="${AdminAdd_YP_Po.country}" /><br /><br />
   		语言：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="language" value="${AdminAdd_YP_Po.language}" /><br /><br />
   		影片时长：<input type="text" name="duration" value="${AdminAdd_YP_Po.duration}" /><br /><br />
   		主要内容：<input type="text" name="content" value="${AdminAdd_YP_Po.content}" /><br /><br />
   		上映时间：<input type="text" name="rtime" value="${AdminAdd_YP_Po.rtime}" /><br /><br />
   		下架时间：<input type="text" name="otime" value="${AdminAdd_YP_Po.otime}" /><br /><br />
   		<input type="submit" value="修改">&nbsp;&nbsp;<a href="deleteYP.do?id=${AdminAdd_YP_Po.id }">删除</a>
    </form>
  </body>
</html>
