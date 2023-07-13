package com.example.demo.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.sound.midi.Soundbank;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dao.Coding_testDAO;
import com.example.demo.vo.Coding_testVO;

@Controller
public class Coding_testController {
	@Autowired
	private Coding_testDAO cd;
	
	private String a_no="4";
	private String year2;
	
	@GetMapping("/solved")
	@ResponseBody
	public List<Coding_testVO> solved(Model model, String year){
		year2=year;
		List<Coding_testVO> list=null;
		//문제 리스트-----------------------
		HashMap<String, String>map=new HashMap();
		map.put("year", year2); 
		map.put("a_no", a_no);
		list=cd.findByAno(map);
				
		return list;
		
	}
	
	@GetMapping("/myProPage")
	public void code(String year,Model model) {
		if(year==null|| year.equals("")) {
			year2="2023";
		}else{
			year2=year;
		}
		System.out.println("전제 로드할때 year:"+year2);
		//스터디 번호
		String s_no=cd.selectStudy(a_no);
		year="2023";
		
		//문제 리스트-----------------------
		HashMap<String, String>map=new HashMap();
		map.put("year", year2); 
		map.put("a_no", a_no);
		model.addAttribute("list", cd.findByAno(map));
		
		
		//해결한 문제수
		model.addAttribute("total", a_no);
		
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
        
	}
	
	@GetMapping("/grape")
	@ResponseBody
	public List<Coding_testVO> grape(Model model,String year) {
		System.out.println("그래프에서 온 year:"+year);
		if(year==null|| year.equals("")) {
			year2="2023";
		}else{
			year2=year;
		}
		System.out.println("그래프에서 바뀐 year:"+year2);
		HashMap<String, String>map=new HashMap();
		map.put("year", year2); 
		map.put("a_no", a_no);
		List<Coding_testVO>list=null;
		list=cd.getProGrape(map);
		for(Coding_testVO c:list) {
			Date d=c.getP_date();
			String data=d.toString().replace("-", ",");
			System.out.println(data);
			c.setDate(data);	
		}
		model.addAttribute("data", list);
		return list;
	}
	
}
