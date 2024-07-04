package com.example.demo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.LanguageDAO;
import com.example.demo.dao.StudyDAO;
import com.example.demo.dao.Study_inDAO;
import com.example.demo.vo.LanguageVO;
import com.example.demo.vo.StudyListVO;
import com.example.demo.vo.StudyVO;
import com.example.demo.vo.Study_InVO;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.ui.Model;
import lombok.Setter;

@Controller
@Setter
public class StudyController {
	
	@Autowired
	private StudyDAO dao;
	
	@Autowired
	private LanguageDAO languageDAO;
	
	@Autowired
	private Study_inDAO study_inDAO;
	
	@Autowired
	private AccountDAO accountDAO;
	
	//int studyNo = 0;
	//int study_inNo = 0;
	int languageNo=0;
	
	//회원번호 임의로 넣어두기
	 int a_no;
	
	@GetMapping("/insertStudy")
	public void insert() {
		
	}
	//스터디 생성
	@PostMapping("/insertStudy")
	public ModelAndView insertSubmit(HttpSession session, StudyVO s,Study_InVO si, LanguageVO l, @RequestParam("language") String language) {
		a_no= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		//다음 no 확인해서 vo에 담기
		int studyNo = dao.getNextNo();
		int study_inNo = dao.getNextNo();
		languageNo=0;		
		
		s.setS_no(studyNo);
		l.setS_no(studyNo);
		si.setS_no(studyNo);
		si.setR_no(study_inNo);
		
		si.setA_no(a_no);
		
		
		int studyRe = dao.insert(s);
		int study_inRe = study_inDAO.insertLeader(si);
		int languageRe = -1;
		
		//언어 insert
		String arr[] = language.trim().split(",");
		for(String lang:arr) {
			languageNo = languageDAO.getNextNo();
			l.setL_no(languageNo);
			l.setL_lang(lang.trim());
			l.setL_img(lang+".png");
			languageRe = languageDAO.insert(l);
		}
		
		
		ModelAndView mav = new ModelAndView("redirect:/studySearching");
		if(studyRe != 1) {
			mav.addObject("msg","스터디 등록에 실패하였습니다.");
		}else if(study_inRe != 1) {
			mav.addObject("msg","스터디원 등록에 실패하였습니다.");
		}else if(languageRe != 1) {
			mav.addObject("msg","언어 등록에 실패하였습니다.");
		}
		return mav;
	}
	
	//스터디 상세보기
	@GetMapping("/studyDetail")
	public void detail(HttpSession session,Model model, Integer s_no) {
		a_no= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		//
		model.addAttribute("r_ok",study_inDAO.isMember(a_no));
		model.addAttribute("ano", a_no);
		model.addAttribute("s",dao.findByNo(s_no));
		model.addAttribute("l",languageDAO.findByNo(s_no));
		model.addAttribute("a",accountDAO.findLeaderByNo(s_no));
	}
	
	//스터디 리스트
	@RequestMapping("/studySearching")
	public void listStudy(HttpSession session,Model model,@RequestParam(value = "selectedBtns", required = false) String[] selectedBtns, String keyword,String btn_lang) {
		a_no= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("keyword", keyword);
		map.put("selectedBtns",selectedBtns);
		map.put("btn_lang",btn_lang);
		model.addAttribute("list",dao.findAll(map));
		
		model.addAttribute("r_ok",study_inDAO.isMember(a_no));
		
	}
	
	

	//신청하기 클릭시 동작(신청하기 창 띄루기)
	@PostMapping("/applyStudy")
	public void applyStudy(Model model, int a_no, int s_no, String s_name) {
		model.addAttribute("a_no",a_no);
		model.addAttribute("s_no",s_no);
		model.addAttribute("s_name",s_name);
		
	}
	
	//신청하기 누르면 신청되는!
	@GetMapping("/applyStudy")
	@ResponseBody
	public String applyStudy(Study_InVO si){
	    int study_inNo = study_inDAO.getNextNo();
	    si.setR_no(study_inNo);
	    int study_inRe = study_inDAO.insertMember(si);
	    String msg="";
	    if(study_inRe ==1) {
	    	msg="신청되었습니다.";
	    }else{
	    	msg="신청에 실패하였습니다.";
	    } 
	   return msg;
	}

	@GetMapping("/studyMaking")
	public void studyMaking() {
		
	}
}
