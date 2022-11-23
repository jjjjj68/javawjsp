<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<%
	String msg = (String)request.getAttribute("msg");
	String url = (String)request.getAttribute("url");
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>message.jsp</title>
		<jsp:include page="/include/bs4.jsp"></jsp:include>
		<script>
			'use strict'
			let msg = "<%=msg%>";
			let url = "<%=url%>";
			
			if(msg == "guInputOK") msg = "방명록에 글이 등록되었습니다"
			else if(msg == "guInputNO") msg = "방명록 등록 실패!"
			else if(msg == "adminLoginOK") msg = "관리자 인증 성공!"
			else if(msg == "adminLoginON") msg = "관리자 인증 실패!"
			else if(msg == "adminLogoutOK") msg = "관리자 로그아웃 되었습니다!"
			else if(msg == "guDeleteOK") msg = "삭제!"
			else if(msg == "guDeleteNO") msg = "앙대!"
			
		/*
		서버에서 클라이언트에 줄수는 있지만, 클라이언트에서 서버로 주는건 안됨
		이유는 서버부터 실행되기 때문이다
		*/
		
		/* 		alert("방명록에 글이 등록되었습니다."); */
			alert(msg);
			if(url != "") location.href = url;
		</script>
</head>
<body>
	
</body>
</html>