<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					mid =cookies[i].getValue(); /* 배열에 들어잇는 값을 받아온다. */
					pageContext.setAttribute("mid", mid);		//pageContext :현재 페이지에서만 살아있는 저장소
					break;
				}
			}
		}
	
	String imsiMid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
	if(mid.equals("")) pageContext.setAttribute("mid", imsiMid);
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>t2_LoginMember.jsp</title>
		<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class = "container">
	<h2>회원 전용방</h2>
	<p><font color="blue">${mid}</font>님 로그인 중이십니다.</p>
	<hr/>
	<!-- 절대경로로 지정하는방법 -->
	<p><img src="${pageContext.request.contextPath}/images/3.jpg" width="300px"></p>
	<hr/>
	<div class="">
		<div class="col"><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LoginDelete.jsp?a=logout" class="btn btn-success form-control">쿠키의 아이디 삭제</a></div>&nbsp;&nbsp;
		<div class="col"><a href="${pageContext.request.contextPath}/study/1118_storage/t2_LogOut.jsp?a=logout" class="btn btn-success  form-control">로그아웃</a></div>
	</div>
	
</div>
<p><br/></p>
</body>
</html>