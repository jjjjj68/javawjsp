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
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>t2_Login.jsp</title>
		<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<script></script>
<%
String a = request.getParameter("a")==null ? "" : request.getParameter("a");
if(a.equals("logout")) {
	out.println("<script>");
	out.println("alert('로그아웃 되셨습니다');");
	out.println("</script>");
}
%>
<body>
<p><br/></p>
<div class = "container">
	<form name="myform" method="post" action="t2_LoginOk.jsp">
		<table class="table table-bordered text-center">
			<tr>
				<td  colspan="2"><font size="5">로 &nbsp;그 &nbsp;인</font></td>
			</tr>
			<tr>
				<th class="bg-primary text-white">아이디</th>
				<td><input type="text" name="mid" value="${mid}"  autofocus required class="form-control"/></td>
			</tr>
			<tr>
				<th class="bg-primary text-white">비밀번호</th>
				<td><input type="password" name="pwd"  required class="form-control"/></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="로그인" class="btn btn-success"/>&nbsp;&nbsp;
					<input type="reset" value="다시입력" class="btn btn-warning"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<p><br/></p>
</body>
</html>