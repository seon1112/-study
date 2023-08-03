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
		System.out.println("updateCode c_no: "+ct_no);
		String c_no = String.valueOf(ct_no);
		model.addAttribute("c", cd.findByCtNo(c_no));
		model.addAttribute("ct_no", c_no);
		model.addAttribute("list", qd.findTitle());
	}

	@PostMapping("/updateCode")
	public ModelAndView updateCodeForm(int ct_no, HttpSession session, Coding_testVO c) {
		System.out.println("ct_no: "+ct_no);
		String c_no = String.valueOf(ct_no);

		ano = (int)session.getAttribute("a_no");
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

		System.out.println("updateCode———————");
		System.out.println("ct_no: "+c.getCt_no());
		System.out.println("ano: "+c.getA_no());
		System.out.println("q_no: "+c.getQ_no());
		System.out.println("p_timer: "+c.getP_timer());
		System.out.println("p_level: "+c.getQ_level());
		System.out.println("p_code: "+c.getP_code());
		System.out.println("p_date: "+c.getP_date());
		System.out.println("p_link: "+c.getP_link());
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
		System.out.println(qd.findTitle());
	}
	
	
	@PostMapping("/insertCoding")
	public ModelAndView insertCoding(Coding_testVO c, String q_title, HttpSession session) {
		System.out.println(q_title);

		int ct_no = cd.getNextNo();
		QuizVO q = qd.findByTitle(q_title);
		ano= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		System.out.println("ano: "+ano);
		
		c.setCt_no(ct_no);
		c.setA_no(ano);
		c.setQ_no(q.getQ_no());
		c.setQ_level(q.getQ_level());
		
		int re = cd.insert(c);
		System.out.println("insertCoding 동작");
		System.out.println("ct_no: "+ct_no);
		System.out.println("ano: "+ano);
		System.out.println("q_no: "+c.getQ_no());
		System.out.println("p_timer: "+c.getP_timer());
		System.out.println("p_level: "+c.getQ_level());
		System.out.println("p_code: "+c.getP_code());
		System.out.println("p_date: "+c.getP_date());
		System.out.println("p_link: "+c.getP_link());
		System.out.println("ct_no: "+c.getCt_no());
		ModelAndView mav = new ModelAndView("redirect:/myProPage");
		if(re != 1) {
			mav.addObject("msg", "문제 등록에 실패하였습니다.");
		}
		return mav;
	}
	
	

}




