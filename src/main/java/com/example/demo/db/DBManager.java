package com.example.demo.db;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.demo.vo.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DBManager {
	public static SqlSessionFactory sqlSessionFactory;
	//메소드를 호출해야하지만 static은 호출하지 않아도 자동으로 수행되게 하는 영역
	static {
		try {
			String resource = "com/example/demo/db/sqlMapConfig.xml";
			InputStream inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory =new SqlSessionFactoryBuilder().build(inputStream);
		} catch (Exception e) {
			System.out.println("예외발생:"+e.getMessage());
		}
	}
	
	
	
	
	//-------------------------유리 파트
	//coding_testMapper
	//quizMapper
	
	public static int updateCodingTest(Coding_testVO c) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.update("coding.updateCodingTest",c);
		session.close();
		return re;
	}
	
	public static int deleteCodingTest(int ct_no) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.delete("coding.delete", ct_no);
		session.close();
		return re;
	}
	
	public static int getNextNoCT() {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.selectOne("coding.getNextNo");
		return re;
	}
	
	//문제 제목 출력
	public static List<String> findTitle(){
		List<String> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("quiz.findTitle");
		session.close();
		return list;
	}
	
	//문제 정보 조회
	public static QuizVO findByTitle(String q_title) {
		QuizVO q = null;
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("q_title: "+q_title);
		q = session.selectOne("quiz.findByTitle", q_title);
		session.close();
		return q;
	}
	
	//푼 문제 입력
	public static int insertCodingTest(Coding_testVO c) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession(true);
		re = session.insert("coding.insertCodingTest", c);
		session.close();
		return re;
	}
	
	//********************************여기부터야 경선아**********************************
	//-------------------------현주파트

	
	//boardMapper
	
	//질문 등록
	public static int insertBoard(BoardVO b) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession();
		re = session.insert("board.insertBoard",b);
		System.out.println("질문 re:"+re);
		session.commit();
		session.close();
		return re;
	}
	
	//질문 생성-질문 no 찾기
		public static int getNextNoBoard() {
			int no = 0;
			SqlSession session = sqlSessionFactory.openSession();
			no = session.selectOne("board.getNextNo");
			session.close();
			return no;
		}
		/*
	//질문 게시판 조회
		public static List<BoardVO> findAllBoard(int no){
			List<BoardVO> list = null;
			SqlSession session = sqlSessionFactory.openSession();
			list = session.selectList("board.findAll",no);
			session.close();
			System.out.println("board list : "+list);
			return list;
			
		}
		*/
		//전체 번호 조회..?(페이징)
		public static int getTotalRecord(HashMap<String, Object> map) {
			int n = 0;
			SqlSession session = sqlSessionFactory.openSession();
			n = session.selectOne("board.getTotalRecord",map);
			session.close();
			return n;
		} 
		
		//질문 게시판 조회
		public static List<BoardVO> findByAnoBoard(HashMap<String, Object> map){
			List<BoardVO> list = null;
			SqlSession session = sqlSessionFactory.openSession();
			list = session.selectList("board.findByAno",map);
			session.close();
			System.out.println("board list : "+list);
			return list;
			
		}

		//질문 상세보기
		public static BoardDetailVO findByBnoBoard(int no) {
			BoardDetailVO bd = new BoardDetailVO();
			SqlSession session = sqlSessionFactory.openSession();
			bd = session.selectOne("board.findByBno",no);
			session.close();
			System.out.println("board bd : "+bd);
			return bd;
		}
		
		
		//질문 수정
		public static int updateBoard(BoardVO b) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.update("board.updateBoard", b);
			session.commit();
			session.close();
			return re;
		}
		
		//질문 삭제
		public static int deleteBoard(int no) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.delete("board.deleteBoard", no);
			session.commit();
			session.close();
			return re;
		} 
		
		//commentaryMapper
		
		//질문번호별 댓글 조회
		public static List<CommentaryVO> findByNoComment(int no){
			System.out.println("댓글 db매니저 와쑴");
			List<CommentaryVO> list = null;
			SqlSession session = sqlSessionFactory.openSession();
			list = session.selectList("commentary.findByNo",no);
			session.close();
			System.out.println("commentary list : "+list);
			return list;
		}
		
		//댓글 다음 번호 조회
		public static int getNextNoComment() {
			int no = 0;
			SqlSession session = sqlSessionFactory.openSession();
			no = session.selectOne("commentary.getNextNo");
			session.close();
			return no;
		}
		
		//댓글 insert
		public static int insertComment(CommentaryVO c) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.insert("commentary.insertComment",c);
			System.out.println("질문 re:"+re);
			session.commit();
			session.close();
			return re;
		}
		
		//댓글 수정
		public static int updateComment(CommentaryVO c) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.update("commentary.updateComment", c);
			session.commit();
			session.close();
			return re;
		}
		
		//댓글 삭제
		public static int deleteComment(int no) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.delete("commentary.deleteComment", no);
			session.commit();
			session.close();
			return re;
		}
	
	
		//studyMapper
		
		//스터디 생성-스터디 
		public static int insertStudy(StudyVO s) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.insert("study.insertStudy",s);
			session.commit();
			session.close();
			return re;
		}
		
		//스터디 생성-스터디 no 찾기
		public static int getNextNoStudy() {
			int no = 0;
			SqlSession session = sqlSessionFactory.openSession();
			no = session.selectOne("study.getNextNo");
			session.close();
			return no;
		}
		
		//스터디 상세 조회- 스터디 조회
		public static StudyVO findByNoStudy(int no) {
			StudyVO s = null;
			SqlSession session = sqlSessionFactory.openSession();
			s= session.selectOne("study.findByNo",no);
			session.close();
			return s;
		}
		
		//스터디 전체 조회
		public static List<StudyListVO> findAllStudy(HashMap<String, Object> map){
			System.out.println("dbmanager왔움!");
			List<StudyListVO> list = null;
			SqlSession session = sqlSessionFactory.openSession();
			list = session.selectList("study.findAll",map);
			session.close();
			System.out.println("list : "+list);
			return list;
		}
				

		
		//languageMapper
		
		//스터디 생성-언어 insert
		public static int insertLanguage(LanguageVO l) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.insert("language.insertLanguage",l);
			session.commit();
			session.close();
			return re;
		}

		//스터디 생성-언어 no 찾기
		public static int getNextNoLanguage() {
			int no = 0;
			SqlSession session = sqlSessionFactory.openSession();
			no = session.selectOne("language.getNextNo");
			session.close();
			return no;
		}
		//스터디 상세 조회-언어 조회
		public static List<LanguageVO> findByNoLanguage(int no) {
			List<LanguageVO> list = null;
			SqlSession session = sqlSessionFactory.openSession();
			list= session.selectList("language.findByNo",no);
			session.close();
			return list;
		}
				
		
		//study_inMapper
		
		//스터디 생성-방장 insert
		public static int insertStudy_inLeader(Study_InVO s) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.insert("study_in.insertStudy_inLeader",s);
			System.out.println("방장 re:"+re);
			session.commit();
			session.close();
			return re;
		}
		
		//스터디 생성-회원 no 찾기
		public static int getNextNoStudy_in() {
			int no = 0;
			SqlSession session = sqlSessionFactory.openSession();
			no = session.selectOne("study_in.getNextNo");
			session.close();
			return no;
		}
		
		//스터디 신청-멤버 등록
		public static int insertStudy_inMember(Study_InVO s) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.insert("study_in.insertStudy_inMember",s);
			System.out.println("멤버 re:"+re);
			session.commit();
			session.close();
			return re;
		}
		
		//스터디 멤버인지
		public static int isMember(int no) {
			int re = -1;
			SqlSession session = sqlSessionFactory.openSession();
			re = session.selectOne("study_in.isMember",no);
			System.out.println("멤버인지 re:"+re);
			System.out.println("멤버인지 no:"+no);
			session.commit();
			session.close();
			return re;
		}
		
		
		//accountMapper
		//스터디 조회-방장 조회
		public static AccountVO2 findLeaderByNo(int no){
			AccountVO2 a = null;
			SqlSession session = sqlSessionFactory.openSession();
			a = session.selectOne("account.findLeaderByNo",no);
			session.close();
			return a;
		}
		
		
		
		
		
	//경선
	
	//--------------------------study_InMapper
	
	//스터디 멤버 찾기
	public static List<AccountVO> findMember(String a_no){
		List<AccountVO> list=null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("study_in.findMember", a_no);
		session.close();
		return list;
	}	
	//같은 스터디 멤버 찾기
	public static List<AccountVO> findMate(String a_no){
		List<AccountVO> list=null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("study_in.findMate", a_no);
		session.close();
		return list;
	}
	
	//방장 여부확인하기
	public static String findLeader(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String leader=session.selectOne("study_in.findLeader", a_no);
		session.close();
		return leader;
	}
	//방장이 아닐때 스터디 탈퇴하기
	public static int deleteStudy(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		int re=session.delete("study_in.deleteStudy", a_no);
		session.commit();
		session.close();
		return re;
		
	}
	
	//----------------------------studyMapper-------------------------------
	//팀원 별 문제푼 날짜와 푼 문제 개수 구하기
	public static List<RankVO> findGraph(HashMap<String, String> map){
		SqlSession session=sqlSessionFactory.openSession();
		List<RankVO> list=null;
		list=session.selectList("study.findGraph", map);
		session.close();
		return list;
		
	}
	//멤버의 스터디 이름
	public static String findStudyName(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String s_name=session.selectOne("study.findStudyName", a_no);
		session.close();
		return s_name;
	}
	
	//스터디 종합 랭킹
	public static List<RankVO> findTotalRank(String a_no){
		SqlSession session=sqlSessionFactory.openSession();
		List<RankVO> list=null;
		list=session.selectList("study.findTotalRank", a_no);
		session.close();
		return list;
	}
	//이달의 랭킹
	public static List<RankVO> findMonthRank(HashMap<String, String> map){
		SqlSession session=sqlSessionFactory.openSession();
		List<RankVO> list=null;
		list=session.selectList("study.findMonthRank",map);
		session.close();
		return list;
	}
	//YY/MM 활동기간 
	public static List<String> findMonth(String a_no){
		SqlSession session=sqlSessionFactory.openSession();
		List<String>list=null;
		list=session.selectList("study.findMonth",a_no);
		session.close();
		return list;
	}
	
	//---------------------------coding_testMapper ------------------------------
	//레벨 별 문제 푼 개수
	public static String findByLevel(HashMap<String , String> map){
		String level=null;
		SqlSession session=sqlSessionFactory.openSession();
		level=session.selectOne("coding.findByLevel", map);
		session.close();
		return level;
	}
	//문제 번호에 따른 문제 찾기
	public static Coding_testVO findByCtNo(String ct_no) {
		Coding_testVO cv=null;
		SqlSession session = sqlSessionFactory.openSession();
		cv=session.selectOne("coding.findByCtNo", ct_no);
		session.close();
		return cv;
	}
	//문제 목록
	public static List<Coding_testVO> findByAno(HashMap<String,String> map) {
	    List<Coding_testVO> list = null;
	    SqlSession session = sqlSessionFactory.openSession();
	    list = session.selectList("coding.findByAno", map);
	    session.close();
	    return list;
	}
	
	//회원의 스터디 찾기
	public static String selectStudy(String a_no) {
		SqlSession session = sqlSessionFactory.openSession();
	    String s_no = session.selectOne("coding.selectStudy", a_no);
	    session.close();
	    return s_no;
	}
	
	//해결한 문제 수
	public static String getTotalCount(String a_no) {
	    SqlSession session = sqlSessionFactory.openSession();
	    String totalCount = session.selectOne("coding.total", a_no);
	    session.close();
	    return totalCount;
	}
	//랭킹
	public static String getRank(HashMap<String, String> map){
		SqlSession session=sqlSessionFactory.openSession();
		String rank=session.selectOne("coding.rank", map);
		session.close();
		return rank;
	}
	//스터디 멤버 수
	public static String getTotalIn(String s_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String totalIn=session.selectOne("coding.totalIn", s_no);
		session.close();
		return totalIn;
	}
	//이번달에 문제 푼 날
	public static String getSolved(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String sol=session.selectOne("coding.solved", a_no);
		session.close();
		return sol;
	}
	//스터디를 활동일 수 
	public static String getStart(HashMap<String, String> map) {
		SqlSession session=sqlSessionFactory.openSession();
		String start=session.selectOne("coding.start", map);
		session.close();
		return start;
	}
	//멤버이름
	public static String getName(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String name=session.selectOne("coding.name", a_no);
		session.close();
		return name;
	}
	//스터디 가입년도
	public static String getRegdate(String a_no) {
		SqlSession session=sqlSessionFactory.openSession();
		String regdate=session.selectOne("coding.regdate", a_no);
		session.close();
		return regdate;
	}
	//문제푼 날짜별 푼 문제 수
	public static List<Coding_testVO> getProGrape(HashMap<String, String> map){
		SqlSession session=sqlSessionFactory.openSession();
		List<Coding_testVO> list=null;
		list=session.selectList("coding.proGrape", map);
		session.close();
		return list;
	}


	public static AccountVO getProfile(int a_no) {
		SqlSession session = sqlSessionFactory.openSession();
		AccountVO a = session.selectOne("mypage.findMyPage", a_no);
		session.close();
		return a;
	}
	public static int updateProfile(AccountVO a) {
		System.out.println("updateProfile 실행");
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.update("mypage.updateProfile", a);
		session.commit();
		session.close();
		return re;
	}

	public static int deleteProfile(AccountVO a) {
		System.out.println("deleteProfile 실행");
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.update("mypage.deleteProfileImg", a);
		session.commit();
		session.close();
		return re;
	}
	public static int updateNickName(AccountVO a) {
		System.out.println("updateProfile 실행");
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.update("mypage.updateNickName", a);
		session.commit();
		session.close();
		return re;
	}
	//스터디 멤버 불러오기
	public static List<AdminVO> StudyMemberList(int a_no) {
		System.out.println("STUDYMEMBERLISTDAO---------DBMANAGER 동작함!!------------");
		List<AdminVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("mypage.StudyMemberList", a_no);
		System.out.println("담아오는 자료는 " + list);
		session.close();
		return list;
	}

	//스터디 방장 불러오기
	public static String LeaderName(int r_no) {
		SqlSession session = sqlSessionFactory.openSession();
		String Leader = session.selectOne("mypage.LeaderNickName", r_no);
		session.close();
		return Leader;
	}

	//스터디 가입희망자 불러오기
	public static List<AdminVO> PermissionMemberList(int a_no) {
		List<AdminVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("mypage.PermissionMemberList", a_no);
		System.out.println("담아오는 자료는 " + list);
		session.close();
		return list;
	}

	public static int getTeamLeader(int a_no) {
		int name = -1;
		SqlSession session = sqlSessionFactory.openSession();
		Integer result = session.selectOne("mypage.FindTeamLeader", a_no);
		if (result != null) {
			name = result;
		}
		System.out.println("name----------------" + name);
		session.close();
		return name;
	}

	//스터디 가입승인
	public static int allow(int a_no) {
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.update("mypage.allowed", a_no);
		session.commit();
		session.close();
		return re;
	}

	//스터디 가입거절
	public static int reject(int a_no) {
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.delete("mypage.reject", a_no);
		session.commit();
		session.close();
		return re;
	}

	//회원탈퇴
	public static int deleteAccount(int a_no) {
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.delete("mypage.deleteAccount", a_no);
		session.commit();
		session.close();
		return re;
	}

	// 방장 정보 가져오기
	public static AdminVO TeamLeaderInfo(int a_no) {
		AdminVO list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectOne("mypage.TeamLeaderInfo", a_no);
		System.out.println("담아오는 자료는 " + list);
		session.close();
		return list;
	}

	public static String nickName(int b_no) {
		SqlSession session = sqlSessionFactory.openSession();
		System.out.println("여기와?");
		String a=session.selectOne("mypage.nickName", b_no);
		System.out.println("a:"+a);
		session.close();
		return a;
	}

	//회원가입
	public static String checkID(String a_email) {
		SqlSession session = sqlSessionFactory.openSession();
		String checkID = session.selectOne("account.checkID", a_email);
		session.close();
		return checkID;
	}

	public static int loginPODOFAM(String a_name, String a_email) {
		int re = -1;
		SqlSession session = sqlSessionFactory.openSession();

		Map<String, Object> params = new HashMap<>();
		params.put("a_name", a_name);
		params.put("a_email", a_email);

		re = session.insert("account.loginPODOFAM", params); // params를 insert 함수에 전달
		session.commit();
		session.close();
		return re;
	}

}
