package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import com.example.demo.vo.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import org.springframework.util.ClassUtils;


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
	//스터디 멤버 찾기
	public static List<AccountVO> findMember(String a_no){
		List<AccountVO> list=null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("studyin.findMember", a_no);
		session.close();
		return list;
	}
	//같은 스터디 멤버 찾기
	public static List<AccountVO> findMate(String a_no){
		List<AccountVO> list=null;
		SqlSession session=sqlSessionFactory.openSession();
		list=session.selectList("studyin.findMate", a_no);
		session.close();
		return list;
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
		//	System.out.println(list);
		session.close();
		return list;
	}
	//YY/MM 활동기간
	public static List<String> findMonth(String a_no){
		SqlSession session=sqlSessionFactory.openSession();
		List<String>list=null;
		list=session.selectList("study.findMonth",a_no);
		System.out.println(list);
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

	//----------------------------myPage Mapper--------------------------------

	//MYPAGE 이미지 수정하기

	public static AccountVO getProfile(int a_no){

		SqlSession session = sqlSessionFactory.openSession();
		AccountVO a = session.selectOne("mypage.findMyPage", a_no);

		session.close();
		return a;
	}
	public static int updateProfile(AccountVO a){
		System.out.println("updateProfile 실행");
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re =session.update("mypage.updateProfile");
		session.commit();
		session.close();

		return re;
	}

	//스터디 멤버 불러오기
	public static List<AdminVO> StudyMemberList(int a_no) {
		System.out.println("---------DBMANAGER 동작함!!------------");
		List<AdminVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("mypage.StudyMemberList", a_no);
		System.out.println("담아오는 자료는 " + list);
		session.close();
		return list;
	}

	//스터디 방장 불러오기
	public static String LeaderName(int r_no){
		SqlSession session=sqlSessionFactory.openSession();
		String Leader =session.selectOne("mypage.LeaderNickName", r_no);
		session.close();
		return Leader;
	}

	//스터디 가입희망자 불러오기
	public static List<AdminVO> PermissionMemberList(int a_no){
		List<AdminVO> list = null;
		SqlSession session = sqlSessionFactory.openSession();
		list = session.selectList("mypage.PermissionMemberList", a_no);
		System.out.println("담아오는 자료는 " + list);
		session.close();
		return list;
	}

	public static int getTeamLeader(int a_no){
		int name = -1;
		SqlSession session=sqlSessionFactory.openSession();
		Integer result = session.selectOne("mypage.FindTeamLeader", a_no);
		if (result != null){
			name = result;
		}
		System.out.println("name----------------"+name);
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
	public static int deleteAccount(int a_no) {
		int re = -1;
		SqlSession session =
				sqlSessionFactory.openSession();
		re = session.delete("mypage.deleteAccount", a_no);
		session.commit();
		session.close();
		return re;
	}


}
