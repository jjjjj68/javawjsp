package study2;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String realPath = request.getServletContext().getRealPath("/data/pdstest");
		int maxSize = 1024 * 1024 * 10;  //서버에 저장될 파일의 최대용량 10MByte로 한다. (1회 저장)
		String encoding = "UTF-8"; //코드변환방식
		
		// 파일 업로드...처리,,,끝
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		Enumeration e = multipartRequest.getParameterNames();
//		Enumeration e = multipartRequest.getFileNames();
//		while(e.hasMoreElements()) {
//			String name = (String)e.nextElement();
//			System.out.println("name :" + name);
//		}
		
		Enumeration fileNames = multipartRequest.getFileNames();
		String file = "";
		String originalFileName = "";
		String filesystemName = "";
		
		while(fileNames.hasMoreElements()) {
			file = (String)fileNames.nextElement();		//업로드시의 폼태그 안의 필드내임(name)
			originalFileName = multipartRequest.getOriginalFileName(file);
			filesystemName = multipartRequest.getFilesystemName(file);
			System.out.println("업로드시의 원본 파일명" + originalFileName);
			System.out.println("서버에 저장된 실제 파일명" + filesystemName);
		}
		
		if(filesystemName.equals("")) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		
		int upLoadFlag = multipartRequest.getParameter("upLoadFlag")== null ? 2 : Integer.parseInt(multipartRequest.getParameter("upLoadFlag"));
		if(upLoadFlag == 2 ) {
			request.setAttribute("url", request.getContextPath()+"/pdstest/upLoad2.st");
		}
		else if(upLoadFlag == 3) {
			request.setAttribute("url", request.getContextPath()+"/pdstest/upLoad3.st");
		}
		else if(upLoadFlag == 4) {
			request.setAttribute("url", request.getContextPath()+"/pdstest/upLoad4.st");
		}
	
	}

}
