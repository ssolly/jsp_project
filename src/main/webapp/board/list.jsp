<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp_project/board/list.jsp</title>
<style type="text/css">
	table {margin:auto; margin-top: 30px; text-align:center;} 
	table tr:nth-child(odd){background-color:#F6E8E8;}
	table tr th{font-size:15px; color:#702727; background-color:#E4D1D1; padding:2px 25px;}
	table tr td {color : #682323; padding:2px 25px; }
	.longBox {width:200px;}
	button {background-color:#D2B3B3; margin-top:10px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>	

		<table >
			<tr>
				<th>번호</th><th>날짜</th><th class="longBox">제목</th><th>작성자</th><th>조회수</th>
				<th>groupid</th><th>step</th><th>indent</th>
			</tr>
			<c:forEach var="dto" items="${dao.list() }">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.savedate }</td>
					<td class="longBox">${dto.title  }</td>
					<td>${dto.name }</td>
					<td>${dto.hit }</td>
					<td>${dto.groupid }</td>
					<td>${dto.step }</td>
					<td>${dto.indent }</td>
				</tr>
			</c:forEach>	
		</table> 
		<button type="button" onclick="location.href='${contextPath }/board/write_view.jsp'"> 작성</button>
	
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>