<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t1_CookiesDelete.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null) {
		for(int i=0; i<cookies.length; i++) {
			/*여기사이에 id pwd job 선택 삭제할 명령어*/
			cookies[i].setMaxAge(0);		//쿠키의 만료시간을 0으로 성정하여 쿠키를 제거한다.
			response.addCookie(cookies[i]);
		}
	}
%>
<script>
	alert("쿠키에 삭제 완료!!");
	location.href = "t1_CookiesMain.jsp";
</script>