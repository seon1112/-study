package com.example.demo.dao;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.RankVO;

@Repository
public class StudyDAO_2 {
	//팀원 별 문제푼 날짜와 푼 문제 개수 구하기
	public List<RankVO> findGraph(HashMap<String, String> map){
		return DBManager.findGraph(map);
	}
	
	//멤버의 스터디 이름
	public String findStudyName(String a_no) {
		return DBManager.findStudyName(a_no);
	}
	
	//스터디 전체 랭킹
	public List<RankVO> findTotalRank(String a_no){
		return DBManager.findTotalRank(a_no);
	}
	
	//이달의 랭킹
	public List<RankVO> findMonthRank(HashMap<String, String> map){
		return DBManager.findMonthRank(map);
	}
	
	//활동 연월
	public List<String[]> findMonth(String a_no){
		List<String>list=DBManager.findMonth(a_no);
		ArrayList<String[]>list2=new ArrayList<>();
		for(String s:list) {
			String []str=new String[3];
			str[0]=s.substring(0, s.indexOf("/"));
			str[1]=s.substring(s.indexOf("/")+1, s.length());
			// str[0] 년도 str[1]월
			Calendar calendar = Calendar.getInstance();
			int year = Integer.parseInt(str[0]);
			int month = Integer.parseInt(str[1]);

			// 해당 월의 마지막 날짜를 설정
			calendar.set(Calendar.YEAR, year);
			calendar.set(Calendar.MONTH, month - 1); // Calendar의 월은 0부터 시작
			int lastDay = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
			str[2] = String.valueOf(lastDay); // 마지막 날짜를 문자열로 변환하여 str[2]에 설정
			list2.add(str);
		}
		
		
		return list2;
	}
}
