<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/board_register.jsp</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; }
	.box {width:80%;}
	.titleBox{width:93%;}
	table tr td {padding:4px 2px;}
	table tr td b{color:#702727;}
	form textarea{border-radius:5px; width:93%; height:170px; margin-top:8px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<form action="${contextPath }/board/register.jsp" method="post">
			<table>
				<tr>
					<td><b>ID</b></td>
					<td><input class="box" type="text" name="id"></td>
					<td><b>BOARD PASSWORD</b></td>
					<td> <input class="box" type="password" name="board_pwd"></td>
				</tr>
				<tr>
					<td><b>TITLE</b></td>
					<td colspan="3"><input class="titleBox" type="text" name="title"></td>
				</tr>
				<tr>
					<td><b>CONTENT</b></td>
					<td colspan="3"><textarea name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><input type="submit" value="등록" style="background-color:#D2B3B3;"></td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>