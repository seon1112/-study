package com.example.demo.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.StudyDAO;
import com.example.demo.dao.Study_InDAO;
import com.example.demo.vo.AccountVO;
import com.example.demo.vo.RankVO;

@Controller
public class StudyController {
	@Autowired
	private StudyDAO sd;
	@Autowired
	private Study_InDAO sid;
	
	private String a_no="4";
	private String year;
	private String month;
	
	//스터디 멤버 찾기
	@GetMapping("mate")
	@ResponseBody
	public List<AccountVO> mate(){
		return sid.findMate(a_no);
	}
	
	//스터디 멤버 찾기
	@GetMapping("member")
	@ResponseBody
	public List<AccountVO> member(){
		return sid.findMember(a_no);
	}
	
	//멤버별 문제 푼 그래프
	@GetMapping("/graph")
	@ResponseBody
	public List<RankVO> graph(String month,String year) {
		if(year==null||year.equals("")) {  //month,year을 매개변수로 받지 않으면 오늘 년,월 지정
			Calendar calendar=Calendar.getInstance();
			year=calendar.get(Calendar.YEAR)+"";
		    month=(calendar.get(Calendar.MONTH)+1)+"";
		}
		HashMap<String, String>map=new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		map.put("a_no", a_no);
		List<RankVO> list=sd.findGraph(map);
		
		return list;
	}
	
	
	//월 선택시 이달의 랭킹 월 변동
	@GetMapping("/month")
	@ResponseBody
	public String month(String month) {
		return month;
	}
	
	//월 선택시 랭킹 변동
	@GetMapping("/selectMY")
	@ResponseBody
	public List<RankVO> selectMY(Model model,String month,String year) {
		List<RankVO>list=null;
		year=year;
		month=month;
		HashMap<String, String>map=new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		map.put("a_no", a_no);
		list=sd.findMonthRank(map);
		model.addAttribute("a", "a");
		return list;
	}
	
	@GetMapping("/myStudyPage")
	public void myStudy(Model model) {
		//멤버의 스터디 이름
		model.addAttribute("studyName", sd.findStudyName(a_no));
		
		//스터디 전체 랭킹
		model.addAttribute("totalRank", sd.findTotalRank(a_no));
		
		//이달의 랭킹
		if(year==null||year.equals("")) { //month,year을 매개변수로 받지 않으면 오늘 년,월 지정
			Calendar calendar=Calendar.getInstance();
			year=calendar.get(Calendar.YEAR)+"";
		    month=(calendar.get(Calendar.MONTH)+1)+"";
		}
		HashMap<String, String>map=new HashMap<>();
		map.put("year", year);
		map.put("month", month);
		map.put("a_no", a_no);
		model.addAttribute("monthRank", sd.findMonthRank(map));
		model.addAttribute("m", month);
		
		//스터디 활동 연월
		model.addAttribute("month", sd.findMonth(a_no));
		
		
	}
}
