package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.CommentaryDAO;
import com.example.demo.vo.CommentaryVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentaryController {
	
	@Autowired
	private CommentaryDAO dao;
	
	int a_no;
	
	
	@PostMapping("/insertComment")
	public ModelAndView insertComment(HttpSession session,CommentaryVO c) {
		a_no=Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		System.out.println("댓글 인설트 컨트롤러임");
		int no = dao.getNextNo();
		c.setA_no(a_no);
		c.setC_no(no);
		
		int re = dao.insert(c);
		ModelAndView mav = new ModelAndView("redirect:/question?b_no="+c.getB_no());
		System.out.println("댓글 인설트 컨트롤러 끝났다~~~"+re);
		return mav;	
	}
	
	@GetMapping("/insertComment")
	public void insertComment() {
		
	}
	
	//댓글 삭제
	@GetMapping("/commentDelete")
	public ModelAndView delte(Integer c_no, Integer b_no) {
		int re = dao.delete(c_no);
		ModelAndView mav = new ModelAndView("redirect:/question?b_no="+b_no);
		return mav;
	}
	
	@RequestMapping("/commentUpdate")
	@ResponseBody
	public void update(CommentaryVO c) {
		System.out.println("업데이트 컨트롤러 왔다!");
		int re = dao.update(c);
		
	}
}
