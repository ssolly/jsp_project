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
	table tr th{font-size:14px; color:#702727; background-color:#E4D1D1; padding:2px 25px;}
	table tr td {font-size:13px; color : #682323; padding:2px 25px; }
	table tr td a{color:#702727;}
	.longBox {width:200px;}
	button {background-color:#D2B3B3; margin-top:10px;}
	.alink{color:#702727; font-size:12px;}
</style>
</head>
<body>
	<c:import url="../default/header.jsp" />
	<div class="wrap">
	
	<jsp:useBean id="dao" class="com.care.root.board.dao.BoardDAO"/>	
	<c:set var="pc" value="${dao.pagingNum(param.start) }"/>
		<table >
			<tr>
				<th>번호</th><th>날짜</th><th class="longBox">제목</th><th>작성자</th><th>조회수</th>
				<th>groupid</th><th>step</th><th>indent</th>
			</tr>
			<c:forEach var="dto" items="${dao.list(pc.startPage,pc.endPage) }">
				<tr>
					<td>${dto.id }</td>
					<td>${dto.savedate }</td>
					<td class="longBox">
					<c:forEach begin="1" end="${dto.indent }">└</c:forEach>
					<a href="content_view.jsp?id=${dto.id }">${dto.title  }</a>
					</td>
					<td>${dto.name }</td>
					<td>${dto.hit }</td>
					<td>${dto.idgroup }</td>
					<td>${dto.step }</td>
					<td>${dto.indent }</td>
				</tr>
			</c:forEach>	
		</table>
		<!-- 이전이나 다음 버튼을 위해서 처리 -->
		<c:choose>
			<c:when test="${param.start == null }">
				<c:set var="start" value="1"/>
			</c:when>
			<c:otherwise>
				<c:set var="start" value="${param.start }"/>
			</c:otherwise>
		</c:choose>
		
		<c:choose>
			<c:when test="${start>1 }" >
				<button type="button" onclick="location.href='list.jsp?start=${start-1}'"> 이전</button>
			</c:when>
			<c:otherwise>
				<button type="button" disabled> 이전</button>
			</c:otherwise>
		</c:choose>
		
		<c:forEach var="cnt" begin="1" end="${pc.totEndPage }" step="1">
			<a href="list.jsp?start=${cnt }" class="alink">[${cnt }]</a>
		</c:forEach>
		
		<c:choose>
		<c:when test="${start>pc.totEndPage }" >
			<button type="button" onclick="location.href='list.jsp?start=${start+1}'"> 다음</button>
		</c:when>
		<c:otherwise>
			<button type="button" disabled> 다음</button>
		</c:otherwise>
		</c:choose>
		<hr color="#F6E8E8" style="margin:auto;width:500px; margin-top:10px;">
		<button type="button" onclick="location.href='${contextPath }/board/write_view.jsp'"> 작성</button>
	
	</div>
	<c:import url="../default/footer.jsp" />
</body>
</html>