package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Coding_testDAO;
import com.example.demo.dao.QuizDAO;
import com.example.demo.vo.Coding_testVO;
import com.example.demo.vo.QuizVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class QuizController {
	@Autowired
	private Coding_testDAO cd;
	@Autowired
	private QuizDAO qd;
	
	private int ano;
	
	//코드 수정, 삭제
	@GetMapping("/updateCode")
	public void updateCode(int ct_no, Model model) {
		String c_no = String.valueOf(ct_no);
		model.addAttribute("c", cd.findByCtNo(c_no));
		model.addAttribute("ct_no", c_no);
		model.addAttribute("list", qd.findTitle());
	}

	@PostMapping("/updateCode")
	public ModelAndView updateCodeForm(int ct_no, HttpSession session, Coding_testVO c) {
		String c_no = String.valueOf(ct_no);

		ano = Integer.parseInt((String)session.getAttribute("a_no"));
		cd.update(c);
		String q_level = qd.findByTitle(c.getQ_title()).getQ_level();
		int q_no = qd.findByTitle(c.getQ_title()).getQ_no();

		c.setCt_no(ct_no);
		c.setQ_level(q_level);
		c.setQ_no(q_no);
		c.setA_no(ano);

		int re = cd.update(c);
		ModelAndView mav = new ModelAndView("redirect:/codePage?ct_no="+c_no);
		if(re != 1) {
			mav.addObject("msg", "insert 실패");
		}

		return mav;
	}
		
		@GetMapping("/deleteCode")
		public ModelAndView delete(int ct_no) {
			ModelAndView mav = new ModelAndView("redirect:/myProPage");
			int re = cd.delete(ct_no);
			return mav;
		}
	
	//코드문제 제목출력
	@GetMapping("/insertCoding")
	public void codingTest(Model model){
		model.addAttribute("list", qd.findTitle());
	}
	
	
	@PostMapping("/insertCoding")
	public ModelAndView insertCoding(Coding_testVO c, String q_title, HttpSession session) {

		int ct_no = cd.getNextNo();
		QuizVO q = qd.findByTitle(q_title);
		ano= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		c.setCt_no(ct_no);
		c.setA_no(ano);
		c.setQ_no(q.getQ_no());
		c.setQ_level(q.getQ_level());
		
		int re = cd.insert(c);
		
		ModelAndView mav = new ModelAndView("redirect:/myProPage");
		if(re != 1) {
			mav.addObject("msg", "문제 등록에 실패하였습니다.");
		}
		return mav;
	}
	
	

}




