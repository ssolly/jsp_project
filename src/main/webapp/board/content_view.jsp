<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/content_view.jsp</title>
<style type="text/css">
	form {margin-top:20px;}
	table{margin:auto;}
	form input{margin-top:10px; }
	.box {width:200px;}
	.titleBox{width:395px;}
	table tr td {padding:4px 5px;}
	table tr th{color:#702727;}
	form textarea{border-radius:5px; width:98%; height:170px; margin-top:8px;}
	.btn {background-color:#D2B3B3;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO" />
	<c:set var="dto" value="${dao.contentView(param.id) }" />
	
	<form action="modify.jsp" method="post">
	<input type="hidden" name="id" value="${dto.id }">
		<table>
			<tr>
				<th>번호</th><td>${dto.id }</td>
				<th>날짜</th><td>${dto.savedate }</td>
			</tr>
			<tr>
				<th>작성자</th><td><input type="text" readonly name="name" value="${dto.name }"></td>
				<th>조회수</th><td>${dto.hit }</td>
			</tr>
			<tr>
				<th>제목</th><td colspan="3"><input type="text" name="title" value="${dto.title }" class="titleBox"></td>
			</tr>
			<tr>
				<th>내용</th><td colspan="3"><textarea rows="10" cols="30" name="content">${dto.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="4"> <input type="submit" value="수정" class="btn">
				<input type="button" value="삭제" onclick="location.href='delete.jsp?id=${dto.id}'" class="btn">
				<input type="button" value="목록" onclick="location.href='list.jsp'" class="btn">
				<input type="button" value="답변" onclick="location.href='reply.jsp'" class="btn"> </td>
			</tr>
		</table>
	</form>
	
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>