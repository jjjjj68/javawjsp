<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LogOut.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					mid =cookies[i].getValue(); /* 배열에 들어잇는 값을 받아온다. */
					request.setAttribute("mid", mid);		//pageContext :현재 페이지에서만 살아있는 저장소
					break;
				}
			}
		}
%>
<%
	
%>



<script>
	alert("'${mid}님 로그아웃 되셨습니다!!!");
	location.href = "t2_Login.jsp";
</script>