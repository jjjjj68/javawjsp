show tables;

create table board (
	idx int not null auto_increment,		/* 게시글의 고유번호 */
	nickName varchar(20) not null,			/* 게시글 올린 사람의 닉네임 */
	title		 varchar(100) not null,     /* 게시글의 글 제목 */
	email		 varchar(50),								/* 글쓴이의 메일주소(회원가입시에 필수 입력처리되어있다) */
	homePage varchar(50),								/* 글쓴이의 홈페이지(블로그)주소 */
	content	 text not null,							/* 글 내용 */
	wDate		 datetime default now(),		/* 글 올린 날짜 */
	hostIp	 varchar(50) not null,			/* 글 올린이의 접속 IP */
	readNum	 int default 0,							/* 글 조회수 */
	good		 int default 0,							/* 좋아요 클릭 횟수 */
	mid		   varchar(20) not null,			/* 회원 아이디(내가 올린 게시글 전체 조회시체 사용) */
	primary key(idx)
);
drop table board;
desc board;

insert into board values (default,'관장님','게시판 서비스를 시작합니다','lee123@naver.com','naver.com','이곳은 게시판입니다',default,'192.168.50.71',default,default,'admin');
select * from board;

/* 게시판에 댓글 달기 */
create table boardReply (
	idx		int not null auto_increment, /* 댓글의 고유번호 */
	boardIdx int not null,						 /* 원본글의 고유번호(외래키로 지정) */
	mid			 varchar(20) not null,		 /* 댓글 올린이의 아이디 */
	nickName varchar(20) not null, 		 /* 댓글 올린이의 닉네임 */
	wDate    datetime default now(),   /* 댓글 올린 날짜 */
	hostIp	 varchar(50) not null,   	 /* 댓글 올린 PC IP */
	content	 text not null,						 /* 댓글 내용 */
	primary key(idx),
	foreign key(boardIdx) references board(idx)
);
desc boardReply;
	/*
	on update cascade	/* 부모키에 따라서 같이 업데이트 */
	on delete restrict /* 부모기에 따라서 삭제 같이함? */
	*/


/* 날짜 처리 연습 */
select now();		-- now() : 오늘 날짜와 시간을 보여준다.

select year(now()); --year() : '년도' 출력
select month(now()); --month() : '월' 출력
select day(now()); --day() : '일' 출력
select date(now()); --date() : '년-월-일' 출력
select weekday(now()); --weekday() : '요일' 출력  0(월), 1(화), 2(수), 3(목), 4(금), 5(토), 6(일)
select dayofweek(now()); --dayofweek() : '요일' 출력  1(일),2(월),3(화),4(수),5(목),6(금),7(토)
select hour(now());		--hour() : 시간
select minute(now());		--minute() : 분
select second(now());		--second() : 초

select year('2022-12-1');
select idx,year(wDate) from board;
select idx,day(wDate) as 날짜 from board;
select idx, wDate,weekday(wDate) from board;

/* 날짜연산 */
-- date_add(date, interval 값 type)
select date_add(now(), interval 1 day);		/* 오늘날짜보다 +1일 출력 */
select date_add(now(), interval -1 day);		/* 오늘날짜보다 -1일 출력 */
select date_add(now(), interval 10 day_hour);		/* 오늘날짜보다 +10시간 출력 */
select date_add(now(), interval -10 day_hour);		/* 오늘날짜보다 -10시간 출력 */

-- date_sub(date, interval 값 type) (add랑 반대 개념)
select date_sub(now(), interval 1 day); /* 오늘날짜보다 -1일 출력 */
select date_sub(now(), interval -1 day); /* 오늘날짜보다 +1일 출력 */

-- date_format(날짜, '양식기호')
-- 년도(2자리):%y 년도(2자리):%Y 월(영문):%M, 월(숫자):%m, 일:%d,
-- 시(12시간제):%h, 시(24시간제):%H , 분:%i, 초:%s
select idx, wDate from board;
select idx, date_format(wDate, '%y-%M-%d')wDate from board; --%M 월을 영문출력
select idx, date_format(wDate, '%y-%m-%d')wDate from board; --%m 월을 숫자출력
select idx, date_format(wDate, '%Y-%m-%d')wDate from board; --%m 월을 숫자출력
select idx, date_format(wDate, '%h-%i-%s')wDate from board; 
select idx, date_format(wDate, '%H-%i-%s')wDate from board; 

-- 현재부터 한달전의 날짜
select date_sub(now(), interval 1 month);

-- 하루전 체크
select date_sub(now(), interval 1 day);
select date_sub(now(), interval 1 day), wDate from board;

-- 날짜차이 계산 : DATEDIFF(시작날짜,마지막날짜)
select datediff(now(),'2022-12-01');
select datediff(now(),'2022-11-30');
select idx, wDate, datediff(now(),wDAte) from board;
select idx, wDate, datediff(now(),wDAte) as day_diff from board; --프로그래밍하기 위해서 변수에 담아줌
select *, datediff(now(),wDAte)  from board; --프로그래밍하기 위해서 변수에 담아줌, 필드 추가

select timestampdiff(hour, wDate, '2022-11-30') from board;
select timestampdiff(hour, '2022-11-30', now()) from board;
select *, timestampdiff(hour, wDate, now()) as hour_diff from board; --시간으로 표현하기
select *, datediff(now(), wDate) as day_diff, timestampdiff(hour, wDate, now()) as hour_diff from board;

/* 이전글 다음글 체크 */
select * from board where idx < 6 order by idx desc limit 1;   /* 이전글 */
select * from board where idx > 6 limit 1;   /* 다음글 */


/* 댓글의 수를 전체 List에 출력하기 연습 */
select * from boardReply order by idx desc;
-- 댓글테이블(boardReply)에서 board 테이블의 고유번호 24번글에 딸려있는 댓글의 갯수는?
select count(*) from boardReply where boardIdx = 24;

-- 댓글테이블(boardReply)에서 board 테이블의 고유번호 24번글에 딸려있는 댓글의 갯수는?
-- 원본글의 고유번호와 함께 출력
select boardIdx,count(*) from boardReply where boardIdx = 24;

-- 원본글의 고유번호와 함께 출력, 갯수의 별명은 replyCnt
select boardIdx,count(*) as replyCnt from boardReply where boardIdx = 24;

-- 댓글테이블(boardReply)에서 board 테이블의 고유번호 24번글에 딸려있는 댓글의 갯수는?
-- 원본글의 고유번호와 함께 출력, 갯수의 별명은 replyCnt
-- 이때 원본글을 쓴 닉네임을 함께 출력하시오. 단, 닉네임은 board(원본글)테이블에서 가져와서 출력하시오.
select boardIdx,nickName,count(*) as replyCnt from boardReply where boardIdx = 24;
SELECT boardIdx,
	(SELECT nickName FROM board where idx = 24) AS nickNmae,
	count(*) AS replyCnt 
	FROM boardReply WHERE boardIdx = 24;

-- 앞의 문장을 부모테이블(board)의 관점에서 보자...
SELECT mid, nickname FROM board WHERE idx = 24;

-- 앞의 닉네임을 자식(댓글)테이블(boardReply)에서 가져와서 보여준다면???
SELECT mid, 
	(SELECT nickName FROM boardReply WHERE boardIdx=24) as nickName 
	FROM board WHERE idx = 24;
-- 에러남 : 부모는 한개인데 자식은 여러개임.

-- 부모관점(board)에서 고유번호 24번의 아이디와 현재글에 달려있는 댓글의 개수??
SELECT mid,
	(SELECT count(*) FROM boardReply WHERE boardIdx=24)
	FROM board WHERE idx =24;

-- 부모관점(board)에서 board테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력!
SELECT *,
	(SELECT count(*) FROM boardReply WHERE boardIdx=board.idx) as replyCount
	FROM board 
	order by idx desc
	limit 5;


-- 부모관점(board)에서 board테이블의 모든 내용과, 현재글에 달려있는 댓글의 개수를 가져오되, 최근글 5개만 출력!
-- 각각의 테이블에 별명을 부텨서 앞의 내용을 변경시켜보자!
SELECT *,
	(SELECT count(*) FROM boardReply WHERE boardIdx=b.idx) as replyCount
	FROM board b
	order by idx desc
	limit 5;
















