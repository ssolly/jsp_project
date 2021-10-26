<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/board_main.jsp</title>
<style type="text/css">
	table {margin:auto; margin-top: 30px; text-align:center;} 
	table tr:nth-child(odd){background-color:#F6E8E8;}
	table tr th{font-size:18px; color:#702727; background-color:#E4D1D1; padding:2px 25px;}
	table tr td {color : #682323; padding:2px 25px; }
	.longBox {width:400px;}
	button {background-color:#D2B3B3; margin-top:10px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>	
	<c:set var="list" value="${dao.getBoardList() }" />
		<table >
			<tr>
				<th>등록일</th><th class="longBox">제목</th><th>아이디</th>
			</tr>
			<c:forEach var="board" items="${list }">
				<tr>
					<td>${board.date }</td>
					<td class="longBox"><a href="${contextPath }/board/#.jsp?title=${board.title}">${board.title  }</a></td>
					<td>${board.id }</td>
				</tr>
				
			</c:forEach>	
		</table> 
		<button type="button" onclick="location.href='${contextPath }/board/board_register.jsp'"> 작성</button>
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>