<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>test1Ok.jsp</title>
		<jsp:include page="../../../include/bs4.jsp"></jsp:include>
</head>
<body>
<p><br/></p>
<div class = "container">
	<h2>전송된 자료 결과 보기</h2>
  <p>
  	<table class="table table-bordered">
  		<tr>
  			<th>성명</th>
  			<th>${vo.name}</th>	<%-- <%=vo.getName() %> --%>
  		</tr>
  		<tr>
  			<th>성별</th>
  			<th>${vo.gender}</th>	
  		</tr>
  		<tr>
  			<th>나이</th>
  			<th>${vo.age}</th>	
  		</tr>
  		<tr>
  			<th>직업</th>
  			<th>${vo.job}</th>	
  		</tr>
  		<tr>
  			<th>주소</th>
  			<th>${vo.address}</th>
  		</tr>
  	</table>
  </p>
</div>
<hr/>
<p><a href="${pageContext.request.contextPath}/study/1117/jspaction/test1.jsp" class="btn btn-danger form-control">돌아가기</a></p>
<p><br/></p>
</body>
</html>