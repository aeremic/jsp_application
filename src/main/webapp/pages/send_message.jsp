<%@page import="main.DatabaseAccess"%>
<%@ page import="entities.*" %>

<%
	int senderId = Integer.valueOf((String) session.getAttribute("id"));
	int receiverId = DatabaseAccess.getAdminId();
	String content = request.getParameter("content");
	System.out.println(content);
	
	DatabaseAccess.sendMessage(senderId, receiverId, content);
%>