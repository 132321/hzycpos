<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.po.AdminSY_Po"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminXJ.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script>
		function chuangzhi(x){
			var id = document.getElementById("id"+x).value;
			window.location.href="dianjiXJ.do?id="+id;
		}
	
	
	
	</script>

  </head>
  
  <body>
    <table border="1" align="center">
    	
    	<tr>
    		<td>影片名称</td>
    		<td>上映时间</td>
    		<td>上映的放映厅</td>
    	</tr>
    	
    	<%
    		List<AdminSY_Po> asy = (List<AdminSY_Po>)request.getAttribute("a");
    	 %>
    	<%
    		for(int k = 0 ;k < asy.size() ;k++){
    			AdminSY_Po a = asy.get(k);
    	 %>
    		<tr>
    			<td><%=a.getYpname() %>
    				<input value="<%=a.getId() %>" id="id<%=k%>" type="hidden" />
    			</td>
    			<td><%=a.getRtime()%></td>
    			<td><%=a.getFytname()%></td>
    			
    			<td><a href="javascript:chuangzhi(<%=k%>)">下架</a></td>
    		</tr>
    		<%
    		}
    	 %>
    	
    </table>
  </body>
</html>
