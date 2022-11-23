package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuInputOKCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String hostIp = request.getParameter("hostIp")==null ? "" : request.getParameter("hostIp");
		
		//성명에는 태그사용금지 html 언어 x
		name = name.replace("<", "&lt");
		name = name.replace(">", "&gt");

		content = content.replace("<", "&lt");
		content = content.replace(">", "&gt");
		
		email = email.replace("<", "&lt");
		email = email.replace(">", "&gt");
		
		homePage = homePage.replace("<", "&lt");
		homePage = homePage.replace(">", "&gt");
		
		GuestDAO dao = new GuestDAO();
		GuestVO vo = new GuestVO();
		
		vo.setName(name);
		vo.setEmail(email);
		vo.setHostIp(hostIp);
		vo.setContent(content);
		vo.setHomePage(homePage);
		
		int res = dao.setGuInput(vo);
		
		if(res ==1) {
			request.setAttribute("msg", "guInputOK");
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		else {
			request.setAttribute("msg", "guInputNO");
			request.setAttribute("url", request.getContextPath()+"/guInput.gu");
		}
	}

}
