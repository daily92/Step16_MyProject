<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>views/home.jsp</title>
</head>
<body>
<%
	String id=(String)session.getAttribute("id");
%>
	<c:choose>
		<c:when test="${not empty id }">
			<p><a href="users/private/info.do"><strong>${id }</strong></a>님 로그인 중입니다</p>
			<a href="users/logout.do">로그아웃</a>
		</c:when>
		<c:otherwise>
			<ul>
				<li><a href="users/signup_form.do">회원가입</a></li>
				<li><a href="users/login_form.do?url=${pageContext.request.contextPath }/">로그인</a></li>
			</ul>
		</c:otherwise>
	</c:choose>
	
<%
	List<String> news=(List<String>)request.getAttribute("news");
%>
	<h3>오늘의 정보1</h3>
	<ul>
		<c:forEach var="tmp" items="${news }">
			<li>${tmp }</li>
		</c:forEach>
	</ul>
	
	<h3>오늘의 정보2</h3>	
	<c:set var="date" value="2017년 12월 29일"></c:set>
	<c:set var="time" value="6시 30분 00초 오후"></c:set>
		<ul>
			<li>날짜 : <strong>${pageScope.date }</strong></li>
			<li>시간 : <strong>${time }</strong></li>
		</ul>	
	
	<h3>오늘의 정보3</h3>
<%!
Date dt= new Date(); 
SimpleDateFormat sdf= new SimpleDateFormat("yyyy년 MM 월 dd 일"); 
String date= sdf.format(dt).toString();

SimpleDateFormat sdf2= new SimpleDateFormat("hh시 mm 분 ss 초 a");
String time= sdf2.format(dt).toString();
%>
	<ul>
		<li><c:if test="${param.name=='date' }"><p>날짜 : ${date }</p></c:if></li>
		<li><c:if test="${param.name=='time' }"><p>시간 : ${time }</p></c:if></li>
	</ul>
<%
	String cPath= request.getContextPath();
%>
	<ul>
		<li><a href="${pageContext.request.contextPath}/board/list.jsp">방명록 목록 보기</a></li>
	</ul>
</body>
</html>