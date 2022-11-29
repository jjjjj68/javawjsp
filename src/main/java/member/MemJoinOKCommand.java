package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import conn.SecurityUtil;

public class MemJoinOKCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "" : request.getParameter("pwd");
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String name = request.getParameter("name")==null ? "" : request.getParameter("name");
		String gender = request.getParameter("gender")==null ? "" : request.getParameter("gender");
		String birthday = request.getParameter("birthday")==null ? "" : request.getParameter("birthday");
		String tel = request.getParameter("tel")==null ? "" : request.getParameter("tel");
		String address = request.getParameter("address")==null ? "" : request.getParameter("address");
		String email = request.getParameter("email")==null ? "" : request.getParameter("email");
		String homePage = request.getParameter("homePage")==null ? "" : request.getParameter("homePage");
		String job = request.getParameter("job")==null ? "" : request.getParameter("job");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		String userInfor = request.getParameter("userInfor")==null ? "" : request.getParameter("userInfor");
		
		//취미 전송에 대한 처리
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		if(hobbys.length != 0) {
			for(String strHobby : hobbys) {
				hobby += strHobby + "/";
			}
		}
		hobby = hobby.substring(0, hobby.lastIndexOf("/"));
		
		//회원 사진이 업로드 되었는지의 여부 처리?
		String fileSystemName = "";
		String photo = request.getParameter("photo");
		if(photo.equals("noimage")) {
			fileSystemName = "noimage.jpg";
		}
		else {
			fileSystemName = photo;
		}
		
		// DB에 저장시, 테이블설계에서 지정한 각 필드의 길이체크....
		
		// 아이디와 닉데임을 다시 한번 중복체크 해준다...
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo= dao.getLoginCheck(mid);
		if(vo != null) {
			request.setAttribute("msg", "idCheckNO");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		String tempNickName = dao.memNickCheck(nickName);
		if(!tempNickName.equals("")) {
			request.setAttribute("msg", "nickCheckNO");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		// 비밀번호 암호화처리(SHA256)
		SecurityUtil secuity = new SecurityUtil();
		pwd = secuity.encryptSHA256(pwd);
		
		
		// 모든 체크가 완료되었다면 회원정보를 vo에 담아서 DB(DAO)로 넘겨준다.
		vo = new MemberVO();
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(fileSystemName);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res = dao.setMemberJoinOK(vo);
		
		if(res ==1 ) { 
			request.setAttribute("msg", "memJoinOK");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		else {
			request.setAttribute("msg", "memJoinNO");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			
		}
	}
}
