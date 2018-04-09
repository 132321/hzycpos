<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.po.AdminAdd_FYT_Po"%>
<%@page import="com.hzyc.design.po.AdminAdd_YP_Po"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'adminSY.jsp' starting page</title>
    
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
			var fyt = document.getElementById("select"+x).value;
			window.location.href="dianjiSY.do?id="+id+"&fyt="+fyt;
		}
	
	
	
	</script>
  </head>
  
  <body>
    <table border="1" align="center" >
    	<tr>
    		<td>影片名称</td>
    		<td>上映时间</td>
    		<td>上映的放映厅</td>
    	</tr>
    	<%
    		List<AdminAdd_YP_Po> ayp = (List<AdminAdd_YP_Po>)request.getAttribute("a");
    	 %>
    	<%
    		for(int k = 0 ;k < ayp.size() ;k++){
    			AdminAdd_YP_Po a = ayp.get(k);
    	 %>
    		<tr>
    			<td><%=a.getName() %>
    				<input value="<%=a.getId() %>" id="id<%=k%>" type="hidden" />
    			</td>
    			<td><%=a.getRtime()%></td>
    			<td>
    				<select id="select<%=k%>">
    				<%
    				  List<AdminAdd_FYT_Po> afp = (List<AdminAdd_FYT_Po>)request.getAttribute("zhi");
    					
    					for(int i = 0 ;i< afp.size(); i++){
    				 %>
    				 	<option value="<%=afp.get(i).getName() %>"><%=afp.get(i).getName() %></option>
    				 <%	
    					
    					}
    			
    				 %>
    				 </select>
    			 </td>
    			<td><a href="javascript:chuangzhi(<%=k%>)">上映</a></td>
    		</tr>
    	<%
    		}
    	 %>
    </table>
  </body>
</html>
