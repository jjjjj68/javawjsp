<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t2_LoginDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	String mid = "";
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cMid")) {
					mid =cookies[i].getValue(); /* 배열에 들어잇는 값을 받아온다. */
					cookies[i].setMaxAge(0);
					/* response.addCookie("mid", mid); */		//pageContext :현재 페이지에서만 살아있는 저장소
					response.addCookie(cookies[i]);
					break;
				}
			}
		}
%>

<script>
	alert("'${mid}'쿠키의 아이디 삭제 완료!!");
	location.href = "t2_LoginMember.jsp?mid=${mid}";
</script>