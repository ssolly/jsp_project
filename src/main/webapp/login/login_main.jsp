<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/login/login_main.jsp</title>
<style type="text/css">
	table {margin:auto; margin-top:20px;}
	table tr td {padding:2px 8px;}
	table tr td b{color:#702727; padding:2px 8px;} 
	table label{font-size:13px; color:#702727;}
	.mem_reg{margin-left:70px;}
	.btn_login{padding:14px 9px; background-color:#D2B3B3;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<form action="login.jsp" method="post">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input type="text" name="id" placeholder="input id"></td>
					<td rowspan="2"> <input type="submit" value="로그인" class="btn_login"></td>
				</tr>
				<tr>
					<td><b>PASSWORD</b></td>
					<td> <input type="password" name="pwd" placeholder="input password"></td>
				</tr>
				<tr>
					<td colspan="3">
						<label class="mem_reg" onclick="location.href='${contextPath}/member/member_register.jsp'">회원가입</label> &ensp; <label>아이디/비밀번호 찾기</label>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>