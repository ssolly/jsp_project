<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/write_view.jsp</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; }
	.box {width:300px;}
	table tr td {padding:4px 5px;}
	table tr td b{color:#702727;}
	form textarea{border-radius:5px; width:98%; height:170px; margin-top:8px;}
</style>
</head>
<body>
<c:import url="../default/header.jsp"/>
	<div class="wrap">
		<form action="${contextPath }/board/write_save.jsp" method="post">
			<table>
				<tr>
					<td><b>NAME</b></td>
					<td><input class="box" type="text" name="name"></td>
				</tr>
				<tr>
					<td><b>TITLE</b></td>
					<td ><input class="box" type="text" name="title"></td>
				</tr>
				<tr>
					<td><b>CONTENT</b></td>
					<td><textarea name="content"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="등록" style="background-color:#D2B3B3; margin-left:100px;">
					&ensp;&ensp;&ensp;
					<input type="button" value="취소" 
					 	   onclick="location.href='list.jsp'" style="background-color:#D2B3B3;"></td>
				</tr>
			</table>
		</form>
	</div>
	<c:import url="../default/footer.jsp"/>
</body>
</html>