<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/users/login_result</title>
</head>
<body>
<%
	boolean isValid=(boolean)request.getAttribute("isValid");
	String url=(String)request.getAttribute("url");
%>
	<c:choose>
		<c:when test="${isValid }">
			<%String id=(String)session.getAttribute("id"); %>
			<p><strong>${id }</strong> 회원님 로그인 되었습니다.</p>
			<a href='${url }'>확인</a>
			<%--
			<p><strong><c:out value="${id }"></c:out> </strong> 회원님 로그인 되었습니다.</p>
			<a href="<c:out value='${url }'></c:out>">확인</a>
			--%>	
		</c:when>
		<c:otherwise>
			<p>아이디 혹은 비밀 번호가 틀려요</p>
			<a href="login_form.do?url=${url }">로그인 폼으로 돌아가기</a>
		</c:otherwise>
	</c:choose>
</body>
</html>