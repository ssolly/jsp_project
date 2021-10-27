<%@page import="com.care.root.board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/delete.jsp</title>
</head>
<body>
	<%
		BoardDAO dao = new BoardDAO();
		//dao.delete(request.getParameter("id"));
		//response.sendRedirect("list.jsp");	//alert창을 띄우고 싶으면 sendRedirect값을 받아오면 안된다
		
		//int result = dao.delete(request.getParameter("id"));
		//if (result==1) {
		//		out.print("<scipt>alert('삭제 성공');") + "location.href='list.jsp'</script>");
		//} else {
		//		out.print("<script>alert('삭제 실패 되었습니다');"+
		//                                 " location.href='list.jsp'</script>");
        //        }
		
		int result = dao.delete(request.getParameter("id"));
		if(result==1) { %>
			<script type="text/javascript">alert('삭제 성공')
										   location.href="list.jsp"</script>
		<% } else { %>
		<% } %>	

	
	<%--
		<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>
		${dao.delete(param.id)}
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<c:redirect url="list.jsp"/>
	 --%>
</body>
</html>