<%@ page import="entities.*"%>
<%@ page import="main.*"%>

<jsp:useBean id="user" class="entities.User"></jsp:useBean>
<jsp:setProperty property="*" name="user" />

<%
	session.setAttribute("role", null);
	session.setAttribute("id", null);

	response.sendRedirect(request.getContextPath() + "/index.jsp");
%>