<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<!-- 앞에서 전송된 값을 변수에 담아보자... -->
<c:set var="name" value="${param.name}"/>
<c:set var="gender" value="${param.gender}"/>
<c:set var="age" value="${param.age}"/>
<c:set var="job" value="${param.job}"/>
<c:set var="address" value="${param.address}"/>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>testF1Ok.jsp</title>
		<jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class = "container">
	<h2>전송된 자료 결과 보기2</h2>
  <p>
  	<table class="table table-bordered">
  		<tr>
  			<th>성명</th>
  			<th>${name}</th>	<%-- <%=vo.getName() %> --%>
  		</tr>
  		<tr>
  			<th>성별</th>
  			<th>${gender}</th>	
  		</tr>
  		<tr>
  			<th>나이</th>
  			<th>${age + 1}</th>	
  		</tr>
  		<tr>
  			<th>직업</th>
  			<th>${job}</th>	
  		</tr>
  		<tr>
  			<th>주소</th>
  			<th>${address}</th>
  		</tr>
  	</table>
  </p>
</div>
<p><br/></p>
</body>
</html>