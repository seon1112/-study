package com.example.demo.controller;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Coding_testDAO;
import com.example.demo.dao.StudyDAO_2;
import com.example.demo.dao.Study_InDAO_2;
import com.example.demo.vo.AccountVO;
import com.example.demo.vo.RankVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class StudyController2 {
	@Autowired
	private Coding_testDAO cd;
	@Autowired
	private StudyDAO_2 sd;
	@Autowired
	private Study_InDAO_2 sid;
	
	private String a_no;
	private String year;
	private String month;
	
	//스터디 멤버 찾기
	@GetMapping("mate")
	@ResponseBody
	public List<AccountVO> mate(HttpSession session){
	    a_no = (String) session.getAttribute("a_no");
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
	
	@GetMapping("/delete")
	@ResponseBody
	public int delete() {
		//방장여부 확인하기
		int re=0;
		String leader=sid.findLeader(a_no);
		System.out.println("leader"+leader);
		if(leader.equals("0")) {
			re=sid.deleteStudy(a_no);
		}
		return re;
	}
	
	@GetMapping("/myStudyPage")
	public ModelAndView myStudy(HttpSession session) {
		ModelAndView mav=new ModelAndView();
		a_no = (String) session.getAttribute("a_no");
		System.out.println("a_no값이 뭔데??? myStudyPage에서" + a_no);
		//스터디가 없을때
		String s_no=cd.selectStudy(a_no);
		if(s_no!=null) {
			//멤버의 스터디 이름
			
			mav.addObject("studyName", sd.findStudyName(a_no));
			
			//스터디 전체 랭킹
			mav.addObject("totalRank", sd.findTotalRank(a_no));
			
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
			mav.addObject("monthRank", sd.findMonthRank(map));
			mav.addObject("m", month);
			
			//스터디 활동 연월
			mav.addObject("month", sd.findMonth(a_no));
			return mav;
		}else {
			 mav.setViewName("redirect:/myProPage");
			return mav;
		}
		
		
		
	}
}
