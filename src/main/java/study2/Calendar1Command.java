package study2;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Calendar1Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오늘 날짜처리(저장)
		// 메모리에 로딩되있는걸 가지고 사용함.
		Calendar calToday = Calendar.getInstance(); 
		int toYear = calToday.get(Calendar.YEAR);
		int toMonth = calToday.get(Calendar.MONTH);
		int toDay = calToday.get(Calendar.DATE);
		
		// 화면에 보여줄 해당 년/월 세팅    mm을 11로 생각하기
		Calendar calView = Calendar.getInstance();
		int yy = request.getParameter("yy")==null ? calView.get(Calendar.YEAR) : Integer.parseInt(request.getParameter("yy")); // 년도
		int mm = request.getParameter("mm")==null ? calView.get(Calendar.MONTH) : Integer.parseInt(request.getParameter("mm")); // 년도
		
		// 앞에서 넘어온 변수(yy,mm) 값이 '1월' 이거나, '12월' 이라면 아래와 같이 편집한다
		// (1월은 '0', 12월은 '11'로 넘어온다.. ex:mm을 11로 생각하기)
		if(mm < 0) {
			yy--;
			mm = 11;
		}
		if(mm > 11) {
			yy++;
			mm = 0;
		}
		
		// 해당 '년/월'의 1일을 기준으로 셋팅시켜준다.
		calView.set(yy, mm, 1);
		
		// 앞에서 셋팅한 해당 '년/월'의 1일에 해당하는 요일값을 숫자로 가져온다.(일:1 월:2 ~ 토:7)
		int startWeek = calView.get(Calendar.DAY_OF_WEEK);
//		System.out.println("해당월의 첫번째 1의 요일을 숫자로 반환 : "+startWeek);
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);
//		System.out.println("해당월의 첫번째 1의 요일을 숫자로 반환 : "+lastDay);
				
	
		
		// 화면에 보여줄 달력의 해당 내역을 저장소에 저장한다.
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 오늘 날짜를 저장소에 담아서 넘겨준다.
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
		
	}

}
