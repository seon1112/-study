package com.example.demo.db;

import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.example.demo.vo.Coding_testVO;


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
}
