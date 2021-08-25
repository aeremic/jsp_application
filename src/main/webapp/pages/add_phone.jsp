<%@ page import="entities.*" %>
<%@ page import="main.*" %>

<jsp:useBean id="phone" class="entities.Phone"></jsp:useBean>
<jsp:setProperty property="*" name="phone"/>

<%
	boolean result = DatabaseAccess.addPhone(phone);
	if(result)
		response.sendRedirect(request.getContextPath() + "/pages/admin_page.jsp");
	else 
		response.sendError(500, "Neuspesno dodavanje telefona.");

%>