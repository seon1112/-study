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
import com.example.demo.vo.BoardDetailVO;
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
	public ModelAndView insertBoard(HttpSession session,BoardVO b) {
		int boardNo = dao.getNextNo();
		ano= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
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
	public ModelAndView questionBoard(HttpSession session, String keyword, @RequestParam(value = "pageNUM", 
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
			map.put("a_no", null);
			map.put("s_no", s_no);
			map.put("keyword", keyword);
			map.put("start", start);
			map.put("end", end);
			
			mav.addObject("list",dao.findByAno(map));
			mav.addObject("totalPage", dao.totalPage);
			
			mav.addObject("a_no",ano);
		}
	
		return mav;
	}
	
	//질문 상세+댓글
	@GetMapping("/question")
	public void question(HttpSession session, Model model, @RequestParam("b_no") Integer b_no) {
		
		BoardDetailVO b=null;
		b=dao.findByBno(b_no);
		b.setB_code("import java.util.HashMap;\r\n"
				+ "\r\n"
				+ "class Solution {\r\n"
				+ "    public long solution(int[] weights) {\r\n"
				+ "        int answer = 0;\r\n"
				+ "         double[] arr = { 2.0 / 4, 3.0 / 4, 2.0 / 3, 4.0 / 3, 3.0 / 2, 1.0, 2.0};\r\n"
				+ "         HashMap<Double, Integer> map = new HashMap<>();\r\n"
				+ "\r\n"
				+ "         for (double i : weights) {\r\n"
				+ "             map.put(i, map.getOrDefault( i, 0) + 1);\r\n"
				+ "         }\r\n"
				+ "\r\n"
				+ "         for (double i : weights) {\r\n"
				+ "             map.put(i, map.get(i) - 1);\r\n"
				+ "             for (double d : arr) {\r\n"
				+ "                 double n = i * d;\r\n"
				+ "                 if (n >= 100.0 && n <= 100000.0) {\r\n"
				+ "                     int cnt = map.getOrDefault(n, 0);\r\n"
				+ "                     answer += cnt;\r\n"
				+ "                 }\r\n"
				+ "             }\r\n"
				+ "             map.put(i, map.get(i) + 1);\r\n"
				+ "         }\r\n"
				+ "        return answer/2;\r\n"
				+ "    }\r\n"
				+ "}\r\n"
				+ "");
		
		model.addAttribute("b",b);
		
		model.addAttribute("list",commentaryDAO.findByNo(b_no));
	
		//a_no에 따라서 질문 수정 삭제 보이게 하려구
		ano= Integer.parseInt(String.valueOf(session.getAttribute("a_no")));
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
