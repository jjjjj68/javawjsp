package study2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.st")
public class StudyController extends HttpServlet{
 @Override
protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	StudyInterface command = null;
	String viewPage = "/WEB-INF/study2";
	
	String uri = request.getRequestURI();
	String com = uri.substring(uri.lastIndexOf("/"),uri.lastIndexOf("."));
	
	if(com.equals("/pass")) {
		viewPage += "/password/pass.jsp";
	}
	else if(com.equals("/passOK1")) {
		command = new PassOKCommand();
		command.execute(request, response);
		viewPage += "/password/pass.jsp";
	}
	else if(com.equals("/passOK2")) {
		command = new PassOK2Command();
		command.execute(request, response);
		viewPage += "/password/passOK2.jsp";
	}
	
	RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
	dispatcher.forward(request, response);
 }
}
