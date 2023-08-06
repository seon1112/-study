package com.example.demo.controller;

import com.example.demo.dao.Study_inDAO;
import com.example.demo.db.DBManager;
import com.example.demo.vo.AccountVO;
import com.fasterxml.jackson.annotation.JacksonInject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.security.oauth2.server.servlet.OAuth2AuthorizationServerAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.Coding_testDAO;

import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.Map;

@Controller
public class MainController {

	@Autowired
	AccountDAO ad;
	@Autowired
	private Coding_testDAO cd;

	@Autowired
	Study_inDAO sid;
	private String a_name;
	private String a_email;

	private String a_no;
	
	@PostMapping("/loginPODOFAM")
	public ModelAndView compareData(HttpSession session, @RequestBody Map<String, String> data) {
		a_email = data.get("email");
		a_name = data.get("name");

		System.out.println("email " + a_email);

		if(ad.checkID(a_email) != null){
			a_no = ad.checkID(a_email);
			System.out.println("Main Controller : ID가 있고 a_no 값은 " + a_no);

		} else{
			ad.loginPODOFAM(a_name,a_email);
			a_no = ad.checkID(a_email);
			System.out.println("여기로들어왔나?? else임" + a_no);
		}
		// a_no 값을 세션에 저장
		session.setAttribute("a_no", a_no);
		ModelAndView mav = new ModelAndView("redirect:/myProPage");
		return mav;
	}

	@GetMapping("/main")
	public void main(HttpSession session) {

	}

	@GetMapping("/header")
	public void header(Model model){
		System.out.println("여기와?");
		int b_no = Integer.parseInt(a_no);
		int leader = sid.FindTeamLeader(b_no);
		if(b_no == leader) {
			model.addAttribute("pl", sid.PermissionList(b_no));
		}
		//멤버 이름
        model.addAttribute("n", cd.getName(a_no));
		//model.addAttribute("n",sid.nickName(b_no));
		//System.out.println("가져온 닉네임 확인" + sid.nickName(b_no));
	}

}
