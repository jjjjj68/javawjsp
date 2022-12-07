package study2;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class JavaDownCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 멀티파일업로드 3 자바 다운로드
		String realPath = request.getServletContext().getRealPath("/data/pdstest/");
		
		String fName = request.getParameter("file");
		
		File file = new File(realPath + fName);
		
		// 프로토콜 형식에 맞도록 헤더의 정보를 제공해 준다.
		// mimeType : 파일형식(예: 텍스트파일? 바이너리?....등등..) --> 2진 바이너리형식으로 전송해야 한다.
		String mimType = request.getServletContext().getMimeType(file.toString());
		if(mimType == null) {
			response.setContentType("application/octet-stream"); // 2진 바이너리형식
		}
		
		//사용하는 브라우저의 대한 정보 : 만약에 인터넷익스플로서(IE)인 경우 'euc-kr', 나머지는 'utf-8'로 전송한다.
		String downLoadName = "";
		if(request.getHeader("user-agent").indexOf("MSIE") == -1) {
			downLoadName = new String(fName.getBytes("UTF-8"), "8859_1");
		}
		else {
			downLoadName = new String(fName.getBytes("EUC-KR "), "8859_1");
		}
		
		// 헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다. (예약어)
		response.setHeader("Content-Disposition", "attachment;filename=0_"+downLoadName);
		
		// Java에 의해서 실제로 파일으 다운(업)로 처리시켜준다.()
		
		FileInputStream fis = new FileInputStream(file);
//		FileOutputStream fos = new FileOutputStream(nFile);
		ServletOutputStream sos = response.getOutputStream();
		
		// 전송할 객체를 생성후 실제로 파일을 객체에 담아서 처리시켜준다.
		byte[] b = new byte[2048];
		int data = 0;
		
		while((data = fis.read(b, 0 ,b.length)) != -1) {
			sos.write(b, 0, data);
		}
		sos.flush();
		// 여기까지수행하면 파일 다운로드 처리가 완료된다
		
		sos.close();
		fis.close();
		
	}

}
