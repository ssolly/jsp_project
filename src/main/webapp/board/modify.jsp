<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/modify.jsp</title>
</head>
<body>
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO" />
	${dao.modify(param.id, param.name, param.title, param.content) }
	<c:redirect url="content_view.jsp?id=${param.id}"/>
</body>
</html>