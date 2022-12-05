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
			let msg = "${msg}";
			let url = "${url}";
			let val = "${val}";
			
			if(msg == "guInputOK") msg = "방명록에 글이 등록되었습니다";
			else if(msg == "guInputNO") msg = "방명록 등록 실패!";
			else if(msg == "adminLoginOK") msg = "관리자 인증 성공!";
			else if(msg == "adminLoginON") msg = "관리자 인증 실패!";
			else if(msg == "adminLogoutOK") msg = "관리자 로그아웃 되었습니다!";
			else if(msg == "guDeleteOK") msg = "삭제!";
			else if(msg == "guDeleteNO") msg = "앙대!";
			else if(msg == "loginOK") msg = val+" 로그인성공!";
			else if(msg == "loginNO") msg =  " 로그인앙대!";
			else if(msg == "memLogoutOK") msg = val+ " 로그아웃!!";
			else if(msg == "idCheckNO") msg = " 중복된 아이디!!!";
			else if(msg == "nickCheckNO") msg = " 중복된 닉네임!!!";
			else if(msg == "memJoinOK") msg = " 회원에 가입 됬다!!!!";
			else if(msg == "memJoinON") msg = " 회원에 가입 앙대!!!!";
			else if(msg == "passwordNO") msg = " 비밀번호 확인해따!!!!!";
			else if(msg == "passwordOK") msg = " 비밀번호 변경했어!!!!!";
			else if(msg == "passwordOKNO") msg = " 비밀번호 변경 실패 했어!!!!!";
			else if(msg == "passwordYes") msg = " 회원정보 변경페이지로 이동!!!!!!";
			else if(msg == "memUpdateOK") msg = " 회원정보 변경되었습니다";
			else if(msg == "memUpdateNO") msg = " 회원정보 변경 실패!!!";
			else if(msg == "boInputOk") msg = " 게시글이 입력되었습니다.";
			else if(msg == "boInputNo") msg = " 게시글이 입력 취소~~";
			else if(msg == "boDeleteOk") msg = " 게시글이 삭제 되었습니다~~";
			else if(msg == "boDeleteNo") msg = " 게시글 삭제 실패~~";
			else if(msg == "userCheckNO") msg = "정상적인 사용자가 아니시군요....혹시 해커?ㅋ";
			else if(msg == "boUpdateOk") msg = "게시글이 수정되었습니다";
			else if(msg == "boUpdateNo") msg = "게시글 수정 실패!!";
			else if(msg == "upLoad1Ok") msg = "파일 업로드 성공!!";
			else if(msg == "upLoad1No") msg = "파일 업로드 실패!!";
			
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