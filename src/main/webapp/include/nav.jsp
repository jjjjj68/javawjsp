<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int level = session.getAttribute("sLevel")==null? 99 : (int)session.getAttribute("sLevel");
	pageContext.setAttribute("level", level);
%>

<!--이걸 쓰겟다 변수         이걸 담겟다  -->
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
  <a class="navbar-brand" href="http://192.168.50.71:9090/javawjsp">Home</a>
  <!-- 햄버거 버튼 -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="${ctp}/guest/guList.gu">GUEST</a>
      </li>
      <c:if test="${level <= 4}">
	      <li class="nav-item">
	        <a class="nav-link" href="#">BOARD</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">PDS</a>
	      </li>   
	      <li class="nav-item dropdown" >
	        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#">STUDY</a>
	      	<div class="dropdown-menu">
			      <a class="dropdown-item" href="${ctp}/pass.st">비밀번호암호화</a>
			      <a class="dropdown-item" href="#">Link 2</a>
			      <a class="dropdown-item-text" href="#">Text Link</a>
	    		</div>
	      </li>
      </c:if>
      <li class="nav-item">
      	<c:if test="${level > 4}"><a class="nav-link" href="${ctp}/memLogin.mem">Login</a></c:if>
      	<c:if test="${level <= 4}"><a class="nav-link" href="${ctp}/memLogOut.mem">LogOut</a></c:if>
      </li>   
      <li class="nav-item">
        <c:if test="${level > 4}"><a class="nav-link" href="${ctp}/memJoin.mem">Join</a></c:if>
      </li>   
    </ul>
  </div>  
</nav>