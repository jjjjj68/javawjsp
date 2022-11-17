<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- t3_SessionDeleteAll.jsp -->
<%

	String imsiName = (String) session.getAttribute("sName");
	pageContext.setAttribute("imsiName", imsiName);

/*모든세션을 지우기 */
	session.invalidate();
	
	
%>
<script>
  alert("${imsiName}님의 모든 세션 삭제 완료!!");
  location.href = "t3_SessionMain.jsp";
</script>