package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sound.midi.Soundbank;

import com.example.demo.dao.Study_inDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Coding_testDAO;
import com.example.demo.vo.Coding_testVO;

import jakarta.servlet.http.HttpSession;
import jakarta.websocket.Session;

@Controller
public class Coding_testController {
	@Autowired
	private Coding_testDAO cd;
	private String a_no;
	private String year2;
	private String mate_no2;
	@Autowired
	private Study_inDAO sid;
	

	
	@GetMapping("/template")
	public void index() {
		
	}
	
	//사이드바 레벨 정도 표기
	@GetMapping("/level")
	@ResponseBody
	public ArrayList<String> findByLevel() {
		ArrayList<String> arr = new ArrayList<>();
		HashMap<String, String> map = new HashMap<>();
		map.put("a_no", a_no);
		for(int i=0;i<=5;i++) {
			map.put("q_level", i+"");
			String level=cd.findByLevel(map);
			level=level!=null?level:"0";
			arr.add(level);
			map.remove("q_level", i+"");
		}
		return arr;
	}
	
	//문제 정보 
	@GetMapping("/codePage")
	public void codePage(String ct_no,Model model, HttpSession session) {
		int a = Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		model.addAttribute("test", cd.findByCtNo(ct_no));
		model.addAttribute("ct_no", ct_no);
		model.addAttribute("a", a);
	}
	
	//푼 문제 리스트 연도 별로 바꾸기
	@GetMapping("/solved")
	@ResponseBody
	public List<Coding_testVO> solved(Model model, String year){
		year2=year;
		List<Coding_testVO> list=null;
		//문제 리스트-----------------------
		HashMap<String, String>map=new HashMap();
		if(mate_no2!=null) {
			map.put("year", year2); 
			map.put("a_no", mate_no2);
		}else {
			map.put("year", year2); 
			map.put("a_no", a_no);
		}
		
		list=cd.findByAno(map);
				
		return list;
		
	}	
	
	//myProgrammars 페이지 로드시
	@GetMapping("/myProPage")
	public void code(String year,Model model,String mate_no,HttpSession session) {
		a_no= session.getAttribute("a_no")+"";
		int b_no = Integer.parseInt(a_no);
		System.out.println("a_no: " + a_no + ", Type: " + a_no.getClass().getSimpleName());
		session.setAttribute("n", sid.nickName(b_no));
		session.setAttribute("a_no",a_no);
		
		if(year==null|| year.equals("")) {
			year2="2023";
		}else{
			year2=year;
		}
		//스터디 메이트 myProgrammar로 갈때
		if(mate_no!=null) {
			mate_no2=mate_no;
			//year="2023";
			//스터디 번호
			String s_no=cd.selectStudy(mate_no);
			if(s_no!=null) {
				//문제 리스트-----------------------
				HashMap<String, String>map=new HashMap();
				map.put("year", year2); 
				map.put("a_no", mate_no);
				model.addAttribute("list", cd.findByAno(map));
				
				
				//해결한 문제수
				model.addAttribute("total", cd.getTotalCount(mate_no));
				
				//랭킹
				HashMap<String , String>map2=new HashMap();
				map2.put("a_no", mate_no);
				map2.put("s_no", s_no);
				model.addAttribute("rank", cd.getRank(map2));
				
				//스터디 멤버 수
				model.addAttribute("totalIn", cd.getTotalIn(s_no));
				
				//문제 푼날
				int sol=Integer.parseInt(cd.getSolved(mate_no));
				
				//이번달 일 수
				Calendar calendar = Calendar.getInstance();
		        int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
		        int day=dayOfMonth-sol;
		        model.addAttribute("day", day);
		        
		        //스터디활동 일수
		        model.addAttribute("start", cd.getStart(map2));
		        
				//멤버 이름
		        model.addAttribute("name", cd.getName(mate_no));
		        
		        //포도팜가입연도~현재 연도까지의 리스트
		        int regdate=Integer.parseInt(cd.getRedate(mate_no));
		        int present =calendar.get(calendar.YEAR);
				ArrayList<Integer>yearList=new ArrayList<>();
				yearList.add(present);
				while(present!=regdate) {
					yearList.add(regdate);
					regdate=regdate+1;
				}
				yearList.sort(Comparator.reverseOrder());
		        model.addAttribute("regdate", yearList);
			}else {
				//문제 리스트-----------------------
				HashMap<String, String>map=new HashMap();
				map.put("year", year2); 
				map.put("a_no", mate_no);
				model.addAttribute("list", cd.findByAno(map));
				//멤버 이름
		        model.addAttribute("name", cd.getName(mate_no));
				
				//해결한 문제수
				model.addAttribute("total", cd.getTotalCount(mate_no));
				
				//문제 푼날
				int sol=Integer.parseInt(cd.getSolved(mate_no));
				
				//이번달 일 수
				Calendar calendar = Calendar.getInstance();
		        int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
		        int day=dayOfMonth-sol;
		        model.addAttribute("day", day);
		        
		      //포도팜가입연도~현재 연도까지의 리스트
		        int regdate=Integer.parseInt(cd.getRedate(mate_no));
		        int present =calendar.get(calendar.YEAR);
				ArrayList<Integer>yearList=new ArrayList<>();
				yearList.add(present);
				while(present!=regdate) {
					yearList.add(regdate);
					regdate=regdate+1;
				}
				yearList.sort(Comparator.reverseOrder());
		        model.addAttribute("regdate", yearList);
			}
			
		}else if(mate_no==null||mate_no.equals("")){  //친구가 아닌 나의 프로그래머스
			mate_no2=null;
			//스터디 번호
			String s_no=cd.selectStudy(a_no);
			if(s_no!=null) {
				//문제 리스트-----------------------
				HashMap<String, String>map=new HashMap();
				map.put("year", year2); 
				map.put("a_no", a_no);
				model.addAttribute("list", cd.findByAno(map));
				
				
				//해결한 문제수
				model.addAttribute("total", cd.getTotalCount(a_no));
				
				//랭킹
				HashMap<String , String>map2=new HashMap();
				map2.put("a_no", a_no);
				map2.put("s_no", s_no);
				model.addAttribute("rank", cd.getRank(map2));
				
				//스터디 멤버 수
				model.addAttribute("totalIn", cd.getTotalIn(s_no));
				
				//문제 푼날
				int sol=Integer.parseInt(cd.getSolved(a_no));
				
				//이번달 일 수
				Calendar calendar = Calendar.getInstance();
		        int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
		        int day=dayOfMonth-sol;
		        model.addAttribute("day", day);
		        
		        //스터디활동 일수
		        model.addAttribute("start", cd.getStart(map2));
		        
				//멤버 이름
		        model.addAttribute("name", cd.getName(a_no));
		        
		        //스터디가입연도~현재 연도까지의 리스트
		        int regdate=Integer.parseInt(cd.getRedate(a_no));
		        int present =calendar.get(calendar.YEAR);
				ArrayList<Integer>yearList=new ArrayList<>();
				yearList.add(present);
				while(present!=regdate) {
					yearList.add(regdate);
					regdate=regdate+1;
				}
				yearList.sort(Comparator.reverseOrder());
		        model.addAttribute("regdate", yearList);
			}else {
				//스터디가 없는 멤버
				//문제 리스트-----------------------
				HashMap<String, String>map=new HashMap();
				map.put("year", year2); 
				map.put("a_no", a_no);
				model.addAttribute("list", cd.findByAno(map));
			
				//랭킹
				model.addAttribute("rank", 0);
				//스터디 멤버 수
				model.addAttribute("totalIn", 0);
				//해결한 문제수
				model.addAttribute("total", cd.getTotalCount(a_no));
				//스터디활동 일수
		        model.addAttribute("start", 0);
				
				//문제 푼날
				int sol=Integer.parseInt(cd.getSolved(a_no));
				//멤버 이름
		        model.addAttribute("name", cd.getName(a_no));
				//이번달 일 수
				Calendar calendar = Calendar.getInstance();
		        int dayOfMonth = calendar.get(Calendar.DAY_OF_MONTH);
		        int day=dayOfMonth-sol;
		        model.addAttribute("day", day);
		        
		        //스터디가입연도~현재 연도까지의 리스트
		        int regdate=Integer.parseInt(cd.getRedate(a_no));
		        int present =calendar.get(calendar.YEAR);
				ArrayList<Integer>yearList=new ArrayList<>();
				yearList.add(present);
				while(present!=regdate) {
					yearList.add(regdate);
					regdate=regdate+1;
				}
				yearList.sort(Comparator.reverseOrder());
		        model.addAttribute("regdate", yearList);
			}
			
			
		}
		
        
	}
	
	//포도농사 그래프 
	@GetMapping("/grape")
	@ResponseBody
	public List<Coding_testVO> grape(Model model,String year) {
		if(year==null|| year.equals("")) {
			year2="2023";
		}else{
			year2=year;
		}
		
		HashMap<String, String>map=new HashMap();
		List<Coding_testVO>list=null;
		
		//mate 포도농사 그래프 찾을 때
		if(mate_no2!=null) {
			map.put("year", year2); 
			map.put("a_no", mate_no2);
			
		}else { //내 포도농사 그래프 찾을 때
			map.put("year", year2); 
			map.put("a_no", a_no);
			
		}
		list=cd.getProGrape(map);
		for(Coding_testVO c:list) {
			Date d=c.getP_date();
			String data=d.toString().replace("-", ",");
			c.setDate(data);	
		}
		model.addAttribute("data", list);
		return list;
	}
	
}
