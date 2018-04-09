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
    
    <title>My JSP 'selectFYT.jsp' starting page</title>
    
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
    <table border="1" align="center">
    	<tr>
    		<td>放映厅名称</td>
    		<td>放映厅类型</td>
    		<td>负责人</td>
    	</tr>
    	
    	
    	<c:forEach items="${a}" var="AdminAdd_FYT_Po">
    		<tr>
    			<td>${AdminAdd_FYT_Po.name}</td>
    			<td>${AdminAdd_FYT_Po.type}</td>
    			<td>${AdminAdd_FYT_Po.admin}</td>
    		<%
    		if(request.getAttribute("b")!=null){
    		String b = request.getAttribute("b").toString(); 
    		if(b.equals("1")){
    		%>
    			<td><a href="selectUpdate.do?id=${AdminAdd_FYT_Po.id}">修改</a></td>
    			<td><a href="delete.do?id=${AdminAdd_FYT_Po.id }">删除</a></td>
    		<%	}
    		
    		}
    		%>
    		</tr>
    	
    	</c:forEach>
    	
    	
    	
    </table>
  </body>
</html>
