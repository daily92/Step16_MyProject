<%@page import="test.board.dao.BoardDao"%>
<%@page import="test.board.dto.BoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board/list.jsp</title>
</head>
<body>
<%
	//글 목록 얻어오기 
	List<BoardDto> list=BoardDao.getInstance().getList();
%>
	<a href="insertform.jsp">새 글 작성</a>
	<h3>글 목록입니다.</h3>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
				<th>등록일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="tmp" items="${list }">
				<tr>
					<td>${tmp.getNum() }</td>
					<td>${tmp.getWriter() }</td>
					<td>${tmp.getAddr() }</td>
				</tr>
			</c:forEach>
		
			<%for(BoardDto tmp:list){%>
			<tr>
				<td><%=tmp.getNum() %></td>
				<td><%=tmp.getWriter() %></td>
				<td><a href="detail.jsp?num=<%=tmp.getNum()%>"><%=tmp.getTitle() %></a></td>
				<td><%=tmp.getRegdate() %></td>
			</tr>
			<%} %>
		</tbody>
	</table>
</body>
</html>