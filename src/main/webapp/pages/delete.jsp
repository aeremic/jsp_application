<%@ page import="main.*" %>

<%
	int id = Integer.valueOf(request.getParameter("id"));
	if(DatabaseAccess.deletePhone(id))
		response.sendRedirect(request.getContextPath() + "/pages/all.jsp");
	else response.sendError(500, "Greska pri brisanju");
	
%>