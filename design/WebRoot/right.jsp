<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.hzyc.design.controller.DbUtils"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'right.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
		String date = request.getParameter("date");
    	String fyt = request.getParameter("fyt");
    	String fid = request.getParameter("fid");
    	String rtime = request.getParameter("rtime");
	
	 %>
	<script>
		function changeImg(x){
			document.getElementById(x).src="images/sit_img3.jpg";
			
		}
		function resetImg(x){
			document.getElementById(x).src="images/sit_img.jpg";
		}
		function goumai(){
			var img = document.getElementsByTagName("img");
			var data = "";
			for(var i = 0 ;i < img.length ;i++){
				if(img[i].src=="http://localhost:8080/design/images/sit_img3.jpg"){
					data +=(img[i].id+"/");
				}
			}
			window.location.href="right.jsp?fid1=<%=fid%>&fyt1=<%=fyt%>&date1=<%=date%>&rtime1=<%=rtime%>&yuju="+data.substring(0,data.length-1);
		}
	</script>
	<%
		String yuju =request.getParameter("yuju");
		String date1 = request.getParameter("date1");
    	String fyt1 = request.getParameter("fyt1");
    	String fid1 = request.getParameter("fid1");
    	String rtime1 = request.getParameter("rtime1");
		if(yuju != null){
			DbUtils d = new DbUtils();
			String id = d.query("select id from registered where username='"+request.getSession().getAttribute("username").toString()+"'").get(0).get("id");
			String[] array = yuju.split("/");
			for(int i = 0 ;i<array.length ;i++){
				d.update("insert into buy(uid,fid,rtime,fyt,date,seat) values('"+id+"','"+fid1+"','"+rtime1+"','"+fyt1+"','"+date1+"','"+array[i]+"')");
			}
		%>
			<script>
				alert("购票成功");
			</script>
		<%
		}
	 %>
  </head>
  
  <body>
    <%
    	
    	DbUtils db = new DbUtils();
    	ArrayList<Map<String,String>> alhs =  db.query("SELECT seat FROM buy WHERE fid="+fid+" AND fyt='"+fyt+"' AND rtime='"+rtime+"' and date='"+date+"'");
    	int count = 0;
    	for(int i = 1 ; i <= 6 ;i++){
    		for(int j = 1 ; j <= 10; j++){
     %>
     	<img src="images/sit_img.jpg" id="<%=i%>-<%=j%>" onclick="changeImg('<%=i%>-<%=j%>')" ondblclick="resetImg('<%=i%>-<%=j%>')"/>
     <%
     }
     out.print("<br />");
    }
      %>
      
      <%
      	for(int i = 0 ;i<alhs.size();i++){
      			Map<String,String> map = alhs.get(i);
      			String seat = map.get("seat");
      			out.print("<input type='hidden' value='"+seat+"' id='id"+i+"' />");
       %>
       	<script>
       		var a  =document.getElementById("id<%=i%>").value;
       		document.getElementById(a).src="images/sit_img2.jpg";
       		document.getElementById(a).ondbclick=etst();
       		document.getElementById(a).onclick=function(){
       		};
       		function etst(){}
       	</script>
       <%
       	}
       
        %>
        
        <input type="button" value="购买" onclick="goumai()"/>
  </body>
</html>
