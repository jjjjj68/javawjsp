<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	pageContext.setAttribute("title", title);
	pageContext.setAttribute("content", content);
	
%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>test1Res2.jsp</title>
		<jsp:include page="../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class = "container">
	<h2>JSP/servlet Life Cycle 연습(test2Res.jsp)</h2>
	<form name="myform" method="post" action="${pageContext.request.contextPath}/j1119/LifeCycle"> 
		<table class="table">
			<tr>
				 <th>제목</th>
				 <td>${title}</td>
				 <td><input type="text" name="title" size="60" value="Servlet 메소드의 생명주기" autofocus /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${content}</td>
				<td><textarea rows="5" cols="60" name="content">서블릿 메소드 생명주기 연습입니다.</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/study/1119_LifeCycle/test1.jsp';" class="btn btn-success form-control"/></td>
			</tr>
		</table>
	</form>
	
</div>
<p><br/></p>
</body>
</html>