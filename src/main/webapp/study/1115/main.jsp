<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String sw = request.getParameter("sw")==null? "" :request.getParameter("sw");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>main.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
	body {
	width: 1000px;
	margin : 0px auto;
	padding: 0px;
	}
	#header {
		background-color: aqua;
		text-align: center;
		height : 90px;
	}
	#footer {
		background-color: #ccc;
		text-align: center;
		height : 75px;
	}
	#content {
		background-color: #fff;
		text-align: center;
	}
</style>
</head>
<body>
<div class = "container">
	<div id="header">
	<br/>
		<!-- 헤더영역(메뉴/로고 를 표시한다. -->
		<%@ include file="menu.jsp" %>		<!-- 불러온다 -->
	</div>
	<!--본문영역-->
	<div id="content">
	<br/>
<%if(sw.equals("guest")) { %>
	<%@ include file="guest.jsp" %>  <!--지시자 :%@  -->
<%}else if(sw.equals("board")) { %>
	<%@ include file="board.jsp" %>
<%}else if(sw.equals("pds")) { %>
	<%@ include file="pds.jsp" %>
<%}else if(sw.equals("photo")) { %>
<%-- 	<%@ include file="photo.jsp" %> --%>
	<jsp:include page="photo.jsp"></jsp:include>
<%} else { %>
		<h2>이곳은 메인화면 입니다</h2>
		<hr/>
		<p><img src="../../images/1.jpg" width="600px" /></p>
	<%} %>
	<br/>
	</div>
	<!--푸터영역(Copyright나 주소 소속 작성자 등을 기술한다.)-->
	<div id="footer">
		<%@ include file="footer.jsp" %>
	</div>
	
</div>
</body>
</html>