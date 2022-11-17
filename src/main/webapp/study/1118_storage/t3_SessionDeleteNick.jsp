<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteNick.jsp -->
<%

/*부분세션을 지우기 */
	session.removeAttribute("sNickName");
	
%>
<script>
  alert("${sName}님의 닉네임세센 삭제 완료!!");
  location.href = "t3_SessionMain.jsp";
</script>