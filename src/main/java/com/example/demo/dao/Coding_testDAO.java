package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.Coding_testVO;

@Repository
public class Coding_testDAO {
	
	public int update(Coding_testVO c) {
		return DBManager.updateCodingTest(c);
	}
	
	public int delete(int ct_no) {
		return DBManager.deleteCodingTest(ct_no);
	}
	//다음 코드 번호 출력
	public int getNextNo() {
		return DBManager.getNextNoCT();
	}
	
	public int insert(Coding_testVO c) {
		return DBManager.insertCodingTest(c);
	}
	
	//레벨 별 문제 푼 개수
	public String findByLevel(HashMap<String, String> map){
		return DBManager.findByLevel(map);
	}
	//문제 번호에 따른 문제 찾기
	public Coding_testVO findByCtNo(String ct_no) {
		return DBManager.findByCtNo(ct_no);
	}
	//회원번호, 년도에 따른 문제 리스트
	 public List<Coding_testVO> findByAno(HashMap<String,String> map) {
	        return DBManager.findByAno(map);
	    }
	 //스터디찾기
	 public String selectStudy(String a_no) {
		 return DBManager.selectStudy(a_no);
	 }
	 //해결한 문제 수
	 public String getTotalCount(String a_no) {
		 return DBManager.getTotalCount(a_no);
	 }
	 //랭킹
	 public String getRank(HashMap<String,String> map){
		 return DBManager.getRank(map);
	 }
	 //스터디 멤서 수
	 public String getTotalIn(String s_no) {
		 return DBManager.getTotalIn(s_no);
	 }
	 //이번달 문제 푼날
	 public String getSolved(String a_no) {
		 return DBManager.getSolved(a_no);
	 }
	 //스터디 활동일 수
	 public String getStart(HashMap<String,String> map) {
		 return DBManager.getStart(map);
	 }
	 //멤버이름
	 public String getName(String a_no) {
		 return DBManager.getName(a_no);
	 }
	 //스터디 가입 년도
	 public String getRedate(String a_no) {
		 return DBManager.getRegdate(a_no);
	 }
	 //문제푼 날짜별 푼 문제 개수
	 public List<Coding_testVO> getProGrape(HashMap<String,String> map){
		 return DBManager.getProGrape(map);
	 }

}
