<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/member_info.jsp</title>
<style type="text/css">
	h2{font-size : 40px; font-family:Gabriola; color:#702727; text-align:center; margin-top:20px;}
	table{margin:auto; text-align:center;}
	table tr td b{font-size:15px; color:#702727; padding:2px 20px;}
	table tr td{color : #682323; padding:2px 20px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	<h2>Member Information</h2>
	<!-- id : ${param.id }<hr> -->
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>	<!-- 객체 생성 -->
	<c:set var="mem" value="${dao.getMember(param.id) }"/>
	
	<table>
		<tr>
			<td> <b>ID</b> </td> <td> ${mem.id } </td>
		</tr>
		<tr>
			<td> <b>PASSWORD</b> </td> <td> ${mem.pwd } </td>
		</tr>
		<tr>
			<td> <b>NAME</b> </td> <td> ${mem.name } </td>
		</tr>
		<tr>
			<td> <b>ADDRESS</b> </td> <td> ${mem.addr } </td>
		</tr>
	</table>
	<!-- 
	<b>id</b> : ${mem.id }<br>
	<b>pwd</b> : ${mem.pwd }<br>
	<b>name</b> : ${mem.name }<br>
	<b>addr</b> : ${mem.addr }<hr>
	 -->
	<br><hr><br>
	<button type="button" onclick="location.href='modify.jsp?id=${mem.id}'"
			style="background-color:#D2B3B3;">수정</button>
			
	<c:set var="userId" value="${mem.id }" scope="session" />
	<button  type="button" onclick="location.href='delete.jsp'"
			 style="background-color:#D2B3B3;">삭제</button>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>