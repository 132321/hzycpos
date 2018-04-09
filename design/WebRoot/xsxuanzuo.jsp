<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.po.AdminSY_Po"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xsxuanzuo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function valid(x){
    			var a =  document.getElementsByName("test");
    			var date = "";
    			for(var i = 0  ;i< a.length; i++){
    				if(a[i].checked){
    					date = (a[i].value);
    				}
    			}
    			
    			window.open("right.jsp?rtime="+x+"&date="+date+"&fyt="+document.getElementById("select").value+"&fid="+document.getElementById("did").value,"right");
    	
    	}
	
	</script>
  </head>
  
  <body>
  
  <div>
  	<a href="">返回首页</a>
  </div>
  
  <div style="width:600px;height:1000px;float:left;">
  	
  	<div style="width:300px;height:1000px;float:left;">
  			
  		
  		<img src="${AdminAdd_YP_Po.photo}" style="margin-top:200px;width:300px;height:500px;float:left;">
  		
  	</div>
  	<div style="width:200px;height:800px;float:left;margin-left:50px;">
  		<input type="hidden" id="did" value="${AdminAdd_YP_Po.id}" />
  		<table  align="center" style="margin-top:200px;width:200px;height:500px;float:left;">
    		<tr>
    			<td>影片名称：</td>
    			<td>${AdminAdd_YP_Po.name}</td>
    		</tr>
    		<tr>
    			<td>导演：</td>
    			<td>${AdminAdd_YP_Po.director}</td>
    		</tr>
    		<tr>
    			<td>演员：</td>
    			<td>${AdminAdd_YP_Po.actor}</td>
    		</tr>
    		<tr>
    			<td>国家：</td>
    			<td>${AdminAdd_YP_Po.country}</td>
    		</tr>
    		<tr>
    			<td>语言：</td>
    			<td>${AdminAdd_YP_Po.language}</td>
    		</tr>
    		<tr>
    			<td>影片时长：</td>
    			<td>${AdminAdd_YP_Po.duration}</td>
    		</tr>
    		<tr>
    			<td>主要内容：</td>
    			<td>${AdminAdd_YP_Po.content}</td>
    		</tr>
    </table>
  		
  	</div >
  	
  	
  </div>
    
    <div style="width:400px;height:400px;float:left;margin-left:10px;margin-top:220px;float:left;">
    	<select id="select">
    		
    		<% 
    		List<AdminSY_Po> b = (List<AdminSY_Po>)request.getAttribute("b");
    		for(int i =0; i < b.size(); i++){
    		%>
    			<option value="<%=b.get(i).getFytname()%>"><%=b.get(i).getFytname()%></option>
    		<%} %>
    		
    	</select>
    	<br /><br />
    	<script>
    			var date = new Date();
    			var y = date.getYear()-100+2000;
    			var m = date.getMonth()+1>9?date.getMonth()+1:"0"+(date.getMonth()+1);
    			var d = date.getDate();
    			var today = (y+"-"+m+"-"+d);
    			var mingtian = (y+"-"+m+"-"+(d+1));
    			var houtian = (y+"-"+m+"-"+(d+2));
    			document.writeln("<input type='radio' name='test' value='"+today+"'>"+today+"</button>");
    			document.writeln("<input type='radio' name='test' value='"+mingtian+"'>"+mingtian+"</button>");
    			document.writeln("<input type='radio' name='test' value='"+houtian+"'>"+houtian+"</button>");
    		
    			
    	</script>
    	<br /><br />
    	<a href="javascript:valid('8.00')" target="right">8.00</a><br /><br />
    	
    	<a href="javascript:valid('11.00')">11.00</a><br /><br />
    	
    	<a href="javascript:valid('14.00')">14.00</a><br /><br />
    	
    	<a href="javascript:valid('17.00')">17.00</a><br /><br />
    	
    	<a href="javascript:valid('20.00')">20.00</a><br /><br />
    	
    	<a href="javascript:valid('23.00')">23.00</a><br /><br />
  	</div>
  	<div  style="width:400px;height:500px;float:left;margin-left:10px;margin-top:220px;float:left;">
  		<iframe src="" name="right" width="500px" height="500px"></iframe>
  	</div>
  </body>
</html>
