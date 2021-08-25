<%@ page import="entities.*" %>
<%@ page import="main.*" %>

<jsp:useBean id="user" class="entities.User"></jsp:useBean>
<jsp:setProperty property="*" name="user" />

<%
	boolean result = DatabaseAccess.register(user);
	if(result)
		response.sendRedirect(request.getContextPath() + "/pages/login.jsp");
	else 
		response.sendError(500);
	
%>