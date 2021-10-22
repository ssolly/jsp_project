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
<title>jsp_project/member/register.jsp</title>
</head>
<body>
	<!-- DB에 접근 후 저장하는 jsp파일 -->
	<c:import url="../default/header.jsp" />
	
	<%
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setName(request.getParameter("name"));
		dto.setAddr(request.getParameter("addr"));
		
		MemberDAO dao = new MemberDAO();
		int result = dao.register(dto);
		if (result==1) {
			out.print("<script>alert('회원가입을 축하합니다');location.href='membership.jsp';</script>");
		} else {
			out.print("<script>alert('회원가입에 실패하셨습니다');location.href='member_register.jsp';</script>");
		}
	%>
		
	<c:import url="../default/footer.jsp" />
</body>
</html>