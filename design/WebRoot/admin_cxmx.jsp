<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.po.AdminC_Po"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'admin_cxmx.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
	<script type="text/javascript">
		function pageUp(){
			//alert("上一页");
			var nowPage = document.getElementById("nowPage").innerText;
			//alert(spanObj.innerText);
			window.location.href="pageUp.do?nowPage="+nowPage;
		}
		
		function pageDown(){
			//alert("下一页");
			var nowPage = document.getElementById("nowPage").innerText;
			//alert(spanObj.innerText);
			window.location.href="pageDown.do?nowPage="+nowPage;
		}
	
	</script>

  </head>
  
  <body>
    <table align="center" border="1">
    	
    	<tr>
    		<td>用户名</td>
    		<td>影片名</td>
    		<td>购买场次</td>
    		<td>放映地点</td>
    		<td>放映日期</td>
    		<td>购买位置</td>
    	</tr>
    	<%
    	List<AdminC_Po> a = (List<AdminC_Po>)request.getAttribute("pList");
    	List<String> b = (List<String>)request.getAttribute("b");
    	List<String> d = (List<String>)request.getAttribute("d");
    	for(int i=0;i<a.size();i++){
    	%>
    	<tr>
    		<td><%=d.get(i)%></td>
    		<td><%=b.get(i)%></td>
    		<td><%=a.get(i).getDate()%></td>
    		<td><%=a.get(i).getFyt()%></td>
    		<td><%=a.get(i).getRtime()%></td>
    		<td><%=a.get(i).getSeat()%></td>
    	</tr>
    	<%
    	} 
    	%>
    	<tr>
    		<td>
    			<input type="button" value="上一页" onclick="pageUp()"/>
    		</td>
    		<td>
    			<span id="nowPage">${Page.currentPage }</span>
    			<%-- <input type="hidden" value="${page.currentPage }" /> --%>
    		</td>
    		<td>
    			<input type="button" value="下一页" onclick="pageDown()"/>
    		</td>
    	
    	</tr>
    	
    </table>
  </body>
</html>
