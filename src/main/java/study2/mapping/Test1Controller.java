package study2.mapping;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mapping/Test1")
public class Test1Controller extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("/mapping/Test1OK 서블릿입니다.");
		
		Test2OK ok = new Test2OK();
		Test2OKOK ok2 = new Test2OKOK();
		ok.message();
		ok2.message();
		System.out.println("/mapping/Test1OK 서블릿로 다시오셧습니다");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/study2/mapping/test1.jsp");	//이동하고자하는 주소
		dispatcher.forward(request, response);
	}
}
