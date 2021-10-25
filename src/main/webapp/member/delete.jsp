<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/delete.jsp</title>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	
	<b>id</b> : ${userId } <br>
	<b>id(s)</b> : ${sessionScope.userId }<br>
	
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>
	<c:set var="result" value="${dao.delete(userId) }"/>
	
	<c:choose>
		<c:when test="${result==1 }">
			<script type="text/javascript">
				alert('삭제 완료');
				location.href='membership.jsp'
			</script>
		</c:when>
		<c:otherwise>
			<script type="text/javascript">
				alert('삭제 실패');
				location.href='member_info.jsp?id=${dto.getId()}'
			</script>
		</c:otherwise>
	</c:choose>
	
	<c:import url="../default/footer.jsp"/>
</body>
</html>