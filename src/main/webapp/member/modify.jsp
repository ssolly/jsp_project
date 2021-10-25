<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/modify.jsp</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; margin-left:8px;}
	table tr td b{color:#702727;}
	.btn_color {background-color:#D2B3B3;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
	<jsp:useBean id="dao" class="com.care.root.member.dao.MemberDAO"/>	<!-- 객체 생성 -->
	<c:set var="mem" value="${dao.getMember(param.id) }"/>
	<!-- <b>아이디</b> : ${mem.id }<br>  -->
	
	<form action="modify_save.jsp">
	<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" value="${mem.id }" readonly></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td> <input type="text" name="pwd" value="${mem.pwd }"></td>
				</tr>
				<tr>
					<td><b>NAME</b></td>
					<td><input type="text" name="name" value="${mem.name }"></td>
				</tr>
				<tr>
					<td><b>ADDRESS</b></td>
					<td><input type="text" name="addr" value="${mem.addr }"></td>
				</tr>
				<tr>
					<td colspan="2" ><input type="submit" value="수정" class="btn_color">
								   <input type="button" value="이전" onclick="history.back()" class="btn_color"></td>
			</table>
	</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>