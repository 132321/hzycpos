<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'updateYP.jsp' starting page</title>
    
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
		input{
			width:150px;height:20px;position:relative;top:20;left:-158;text-align:center;
		}
	</style>
	
	<script type="text/javascript">
		function img(x){
			window.location.href="select_update_YP.do?ID="+x+"";
		}
	</script>
 </head>
  
  <body>
  	<c:forEach items="${p}" var="AdminAdd_YP_Po">
    	<img src="${AdminAdd_YP_Po.photo}" onclick="img(${AdminAdd_YP_Po.id})" />
    	<input type="text" value="${AdminAdd_YP_Po.name}" readonly="readonly" />
    </c:forEach>
  </body>
</html>
