<%@page import="com.care.root.member.dao.MemberDAO"%>
<%@page import="com.care.root.member.dto.MemberDTO"%>
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
<title>jsp_project/login/login.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<c:set var="userId" value="${param.id }"/>
	<c:set var="userPwd" value="${param.pwd }"/>
	<jsp:useBean id="dao" class="com.care.root.login.dao.LoginDAO"/>
	<c:set var="result" value="${dao.checkLogin(userId,userPwd)}" />
	<c:choose>
		<c:when test="${result == 1 }">
			<c:set var="login_ing" value="${userId }" scope="session"/> <!-- 로그인 유지하기 위한 세션 생성 -->
			<script type="text/javascript">
				alert("${userId}님 환영합니다");
				location.href="${contextPath}/default/main.jsp"
			</script>
		</c:when>
		<c:when test="${result == 2 }">
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다");
				location.href="${contextPath}/login/login_main.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert("존재하지 않는 아이디입니다");
				location.href="${contextPath}/login/login_main.jsp"
			</script>
		</c:otherwise>
	</c:choose>
	
	<c:import url="../default/footer.jsp" />
</body>
</html>