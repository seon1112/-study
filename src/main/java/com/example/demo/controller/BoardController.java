package com.example.demo.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.BoardDAO;
import com.example.demo.dao.Coding_testDAO;
import com.example.demo.dao.CommentaryDAO;
import com.example.demo.vo.BoardVO;

import jakarta.servlet.http.HttpSession;

@Controller
public class BoardController {
	@Autowired
	private Coding_testDAO cd;
	
	@Autowired
	private BoardDAO dao;
	
	@Autowired
	private CommentaryDAO commentaryDAO;
	
	int ano;
	int sno;
	
	//질문 등록
	@PostMapping("/insertBoard")
	public ModelAndView insertBoard(BoardVO b) {
		int boardNo = dao.getNextNo();
		b.setB_no(boardNo);
		b.setA_no(ano);
		b.setS_no(sno);
		
		int re = dao.insert(b);
		ModelAndView mav = new ModelAndView("redirect:/questionBoard");
		if(re != 1) {
			mav.addObject("msg","질문 등록에 실패하였습니다.");
		}
		return mav;
	}
	
	@GetMapping("/questionMaking")
	public void list3() {
		
	}
	
	/*
	//질문 리스트
	@GetMapping("/questionBoard")
	public void questionBoard(Model model, Integer no) {
		System.out.println("board컨트롤러에 리스트 조회하는거 왔다~");
		no=s_no;
		model.addAttribute("list",dao.findAll(no));
	}
	*/
	
	//전체 리스트
	@RequestMapping("/questionBoard")
	public ModelAndView questionBoard(HttpSession session, Integer a_no, String keyword, @RequestParam(value = "pageNUM", 
			defaultValue = "1")  int pageNUM) {
		ModelAndView mav=new ModelAndView();

		ano= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
		String s_no=cd.selectStudy(ano+"");
		if(s_no==null) {
			mav.setViewName("redirect:/myProPage");
		}else {
			sno=Integer.parseInt(s_no);
			int start = (pageNUM-1)* BoardDAO.pageSIZE +1;
			int end = start +  BoardDAO.pageSIZE -1;
			
		
			HashMap<String, Object> map = new HashMap<String,Object>();
			map.put("a_no", a_no);
			map.put("s_no", s_no);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			
			mav.addObject("list",dao.findByAno(map));
			mav.addObject("totalPage", dao.totalPage);
			//접속자 2번 고정
			mav.addObject("a_no",ano);
		}
		System.out.println("board컨트롤러에 내가 작성한 리스트 조회하는거 왔다~");
		System.out.println("pageNUM:"+pageNUM);
		
		
		return mav;
	}
	
	//질문 상세+댓글
	@GetMapping("/question")
	public void question(Model model, @RequestParam("b_no") Integer b_no) {
		System.out.println("board컨트롤러에 디테일 조회하는거 왔다~");
		model.addAttribute("b",dao.findByBno(b_no));
		System.out.println(dao.findByBno(b_no));
		model.addAttribute("list",commentaryDAO.findByNo(b_no));
		System.out.println(commentaryDAO.findByNo(b_no));
		//a_no에 따라서 질문 수정 삭제 보이게 하려구
		model.addAttribute("a",ano);
	}
	
	@PostMapping("/updateQuestion")
	public ModelAndView updateQuestion(BoardVO b) {
		int re = dao.update(b);
		ModelAndView mav=new ModelAndView("redirect:/question?b_no="+b.getB_no());
		return mav;
	}
	
	//수정 화면 로드
	@GetMapping("/questionUpdate")
	public void updateForm(int b_no, Model model) {
		model.addAttribute("b",dao.findByBno(b_no));
	}
	
	@GetMapping("/questionDelete")
	public ModelAndView delte(int b_no) {
		ModelAndView mav = new ModelAndView("redirect:/questionBoard");
		int re = dao.delete(b_no);
		return mav;
	}
	
	
}
