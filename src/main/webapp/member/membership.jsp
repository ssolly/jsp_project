<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/membership.jsp</title>
<style type="text/css">
	table {margin:auto; margin-top: 50px; text-align:center;} 
	table tr:nth-child(odd){background-color:#F6E8E8;}
	table tr th{font-size:18px; color:#702727; background-color:#E4D1D1; padding:2px 25px;}
	table tr td {color : #682323; padding:2px 25px; }
	button {background-color:#D2B3B3; margin-top:10px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap"> 
		<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO" />
		
		<!--  ArrayList<MemberDTO> list = dao.getMemberList() -->
		<c:set var="list" value="${dao.getMemberList() }" />
		<!-- 리턴 값 : ${list}  -->
		<table >
			<tr>
				<th>아이디</th><th>비밀번호</th><th>이름</th><th>주소</th>
			</tr>
			<c:forEach var="member" items="${list }">
				<tr>
					<td>${member.id }</td>
					<td>${member.pwd }</td>
					<td><a href="${contextPath }/member/member_info.jsp?id=${member.id}">${member.name }</a></td>
					<td>${member.addr }</td>
				</tr>
				
			</c:forEach>	
		</table> 
		<button type="button" onclick="location.href='${contextPath }/member/member_register.jsp'"> 등록</button>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>