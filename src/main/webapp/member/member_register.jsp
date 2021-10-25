<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/member/member_register.jsp</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; margin-left:8px;}
	table tr td b{color:#702727;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">	<!-- class="wrap" : header를 import로 가져왔기 때문에 특별한 세팅 없이 사용 가능 -->
		<form action="${contextPath }/member/register.jsp" method="post">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td> <input type="password" name="pwd" placeholder="input password"></td>
				</tr>
				<tr>
					<td><b>NAME</b></td>
					<td><input type="text" name="name" placeholder="input name"></td>
				</tr>
				<tr>
					<td><b>ADDRESS</b></td>
					<td><input type="text" name="addr" placeholder="input address"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입" style="background-color:#D2B3B3;"></td>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>