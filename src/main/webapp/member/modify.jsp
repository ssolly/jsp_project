<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/modify.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>	<!-- 객체 생성 -->
	<c:set var="mem" value="${dao.getMember(param.id) }"/>
	<b>아이디</b> : ${mem.id }<br>
	
	<form action="modify_save.jsp">
	<b>비밀번호</b> : <input type="text" name="pwd" value="${mem.pwd }"><br>
	<b>이름</b> : <input type="text" name="name" value="${mem.name }"><br>
	<b>주소</b> : <input type="text" name="addr" value="${mem.addr }"><br>
	<input type="submit" value="수정">
	<input type="button" value="이전" onclick="history.back()">
	</form>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>