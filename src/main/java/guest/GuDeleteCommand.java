package guest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class GuDeleteCommand implements GuestInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")=="" ? 0 : Integer.parseInt(request.getParameter("idx"));
		//데이터베이스 연결
		GuestDAO dao = new GuestDAO();
		
		if(idx != 0) {
			int res = dao.setGuDelete(idx);
			if(res == 1) {
				request.setAttribute("msg", "guDeleteOK");
			}
			else {
				request.setAttribute("msg", "guDeleteNO");
			}
			
			request.setAttribute("url", request.getContextPath()+"/guList.gu");
		}
		
		
	}

}
