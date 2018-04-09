<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addYP.jsp' starting page</title>
    
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
  	<form action="insertYP.do" method="post" align="center" enctype="multipart/form-data">
   		影片照片：<input type="file" name="userFile" /><br /><br />
   		影片名称：<input type="text" name="name" /><br /><br />
   		导演：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="director" /><br /><br />
   		演员：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="actor" /><br /><br />
   		国家：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="country" /><br /><br />
   		语言：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="language" /><br /><br />
   		影片时长：<input type="text" name="duration" /><br /><br />
   		主要内容：<input type="text" name="content" /><br /><br />
   		上映时间：<input type="text" name="rtime" /><br /><br />
   		下架时间：<input type="text" name="otime" /><br /><br />
   		<input type="submit" value="提交">
    </form>
  </body>
</html>
