package schedule;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ScheduleCommand implements ScheduleInterface {

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
		//System.out.println("해당월의 첫번째 1의 요일을 숫자로 반환 : "+startWeek);
		int lastDay = calView.getActualMaximum(Calendar.DAY_OF_MONTH);
		//System.out.println("해당월의 첫번째 1의 요일을 숫자로 반환 : "+lastDay);
		
		// 출력된 달력의 '앞쪽/뒷쪽'의 빈공간에 해당월 '이전/다음'의 날짜를 채워보자...(준비)
		int prevYear = yy;
		int prevMonth = (mm) - 1;
		int nextYear = yy;
		int nextMonth = (mm) + 1;
		
		if(prevMonth == -1) {
			prevYear--;
			prevMonth = 11;
		}
		if(nextMonth == 12) {
			prevYear++;
			prevMonth = 0;
		}
		
		
		// 현재월(11)의 이전월(10)의 마지막 날짜를 구한다.
		Calendar calPre = Calendar.getInstance();
		calPre.set(prevYear, prevMonth, 1);
		int preLastDay = calPre.getActualMaximum(Calendar.DAY_OF_MONTH);
		
		// 다음월의 1일에 해당하는 요일의 숫자값을 가져온다.
		Calendar calNext = Calendar.getInstance();
		calNext.set(nextYear, nextMonth, 1);
		int nextStartWeek = calNext.get(Calendar.DAY_OF_WEEK);
		
		
		// 화면에 보여줄 달력의 해당 내역을 저장소에 저장한다.
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
		// 오늘 날짜를 저장소에 담아서 넘겨준다.
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
		// 현재달의 '전월/다음월'의 날짜 표시를 위한 변수를 저장소에 저장한다.
		request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		request.setAttribute("preLastDay", preLastDay);
		request.setAttribute("nextStartWeek", nextStartWeek);
		
		/* 스케줄에 등록되어 있는 해당 월의 일정들을 가져온다. */
		// 자신의 스케줄만 가져와야 하기에, 로그인된 회원의 아이디와 일치한 자료만 가져온다.
		HttpSession session = request.getSession();
		String mid = (String) session.getAttribute("sMid");
		
		// 해당월을 가져오기 위한 편집처리(2022-12)
		
		
		// 2023-1 -> 2023 -01
		String ym = "";
		if((mm+1) < 10 ) {
			ym = yy + "-0" + (mm + 1);
		}
		else {
			ym = yy + "-" + (mm + 1);
		}
		
		ScheduleDAO dao = new ScheduleDAO();
		ArrayList<ScheduleVO> vos = dao.getScMenu(mid, ym, 0);
		
		request.setAttribute("vos", vos);
		System.out.println("vos:"+vos);
		
	}

}
