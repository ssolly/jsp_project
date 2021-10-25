<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/member_info.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	
	<h2>개인 정보</h2>
	id : ${param.id }<br>
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>	<!-- 객체 생성 -->
	<c:set var="mem" value="${dao.getMember(param.id) }"/>
	<b>id</b> : ${mem.id }<br>
	<b>pwd</b> : ${mem.pwd }<br>
	<b>name</b> : ${mem.name }<br>
	<b>addr</b> : ${mem.addr }<hr>
	<button type="button" onclick="location.href='modify.jsp?id=${mem.id}'">수정</button>
	<button type="button" onclick="">삭제</button>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>