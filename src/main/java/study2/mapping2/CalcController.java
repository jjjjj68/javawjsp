package study2.mapping2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet("*.calc")
public class CalcController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인터페이스 만들기		변수명
		MappingInterface command = null;
		
		String viewPage = "WEB-INF/study2/mapping2";
		
		String uri = request.getRequestURI();	//uri 받기
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));		// /   . 요기 사이 착지
		
		if(com.equals("/Calc")) {
			viewPage += "/calc.jsp";
		}
		else if(com.equals("/CalcOK")) {
			command = new CalcOKConmmand();
			command.excute(request, response);
			viewPage += "/calcOK.jsp";
		}
		else if(com.equals("/JuList")) {
			command = new JuListConmmand();
			command.excute(request, response);
			viewPage += "/juList.jsp";
		}
		
		//값을 보내기
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
