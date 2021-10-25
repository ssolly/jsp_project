<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/modify_save.jsp</title>
</head>
<body>

	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>	<!-- 객체 생성 -->
	<jsp:useBean id="dto" class="com.care.root.member.dto.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	
	<c:set var="result" value="${dao.modifySave(dto) }"/>
</body>
</html>