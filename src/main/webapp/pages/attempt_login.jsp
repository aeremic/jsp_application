<%@ page import="entities.*" %>
<%@ page import="main.*" %>

<jsp:useBean id="user" class="entities.User"></jsp:useBean>
<jsp:setProperty property="*" name="user"/>

<%
	boolean success = DatabaseAccess.login(user);
	if(success){
		if(DatabaseAccess.isAdmin(user))
			session.setAttribute("role", "admin");
		else 
			session.setAttribute("role", "user");
		
		int id = DatabaseAccess.getId(user);
		session.setAttribute("id", String.valueOf(id));
		
		response.sendRedirect(request.getContextPath() + "/index.jsp");
	} else 
		response.sendError(500, "Neuspesan login.");
%>