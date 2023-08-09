package com.example.demo.controller;
import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.Study_inDAO;
import com.example.demo.vo.AccountVO;
import jakarta.servlet.http.HttpSession;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@Setter
public class MyPageController {
    @Autowired
    private AccountDAO ad;
    @Autowired
    private Study_inDAO sid;
    private Integer a_no;

    @Value("${file.upload-dir}")
    private String uploadDir;


    @GetMapping("/myPage")
    public void myPage(Model model, HttpSession session) {
        try {
            a_no = Integer.parseInt((String)session.getAttribute("a_no"));
        } catch (NumberFormatException e) {
            System.out.println("세션에서 a_no 값을 정수로 변환하는데 실패했습니다.");
            // 변환 실패 시 처리 방법을 작성하세요.
        }

        AccountVO account = ad.findMyPage(a_no);
        if (account == null) {
            // 필요한 처리 (예: 기본 값을 설정하여 빈 객체를 생성)
            account = new AccountVO();
            account.setA_img("default.png"); // 예시로 기본 이미지를 설정
        }

        model.addAttribute("a", account);
        model.addAttribute("n", sid.nickName(a_no));
        System.out.println("myPage에 가지고 있는 a_no는"+ a_no);
    }

    @PostMapping("/uploadFile")
    @ResponseBody
    public ModelAndView submit(
            @RequestParam(value = "a_no", required = false) Integer aNo,
            @RequestPart("uploadFile") MultipartFile uploadFile) {

        if(aNo == null){
            System.out.print("aNO가 없어서 에러 뜹니다");
            return new ModelAndView("redirect:/errorPage");  // 적절한 에러 페이지로 리다이렉트
        }
        AccountVO a = ad.findMyPage(aNo);

        ModelAndView mav = new ModelAndView("redirect:/myPage");
        String path = uploadDir;

        File dir = new File(path);
        if(!dir.exists()){  // 디렉토리가 존재하지 않으면
            dir.mkdirs();  // 디렉토리 생성
        }

        String originalFileName = uploadFile.getOriginalFilename();
        String saveFileName = System.currentTimeMillis() + originalFileName;

        String filePath = path + "/" + saveFileName;  // 저장할 파일명을 합친다

        try {
            uploadFile.transferTo(new File(filePath));  // 파일 저장
            a.setA_img(saveFileName);
            ad.updateProfileImg(a);
        } catch (IOException  e) {
            e.printStackTrace();
        }

        mav.addObject("image", a.getA_img());
        return mav;
    }

    @GetMapping("/myPageStudy")
    public void myPage_Study(Model model){

        int leader = sid.FindTeamLeader(a_no);

        AccountVO account = ad.findMyPage(a_no);
        model.addAttribute("a", account);

        model.addAttribute("n", sid.nickName(a_no));
        System.out.println("leader값 :" +leader);
        model.addAttribute("lf",sid.TeamLeaderInfo(2));

        if(a_no == leader) {
            model.addAttribute("pl", sid.PermissionList(a_no));
            model.addAttribute("sml_l", sid.StudyMemberList(a_no));
            System.out.println("if동작함!!!!!!!!!!!!!!");
        } else{
            model.addAttribute("lu", sid.StudyMemberList(a_no));
        }
        System.out.println("매핑동작함");
    }

    @PostMapping("/updateNickname")
    @ResponseBody
    public String updateNickname(@RequestParam("a_no") Integer aNo, @RequestParam("nickname") String newNickname) {
        AccountVO a = ad.findMyPage(aNo);
        if (a == null) {
            return "error"; // 해당 a_no의 계정이 없으면 에러 메시지 반환
        }

        a.setA_nick(newNickname);
        ad.updateNickName(a); // DAO에서 닉네임 업데이트 메서드를 적절히 구현하여 DB에 업데이트

        System.out.println("업데이트 되는지 확인하기");
        return "success"; // 업데이트 성공 시 성공 메시지 반환
    }


    @PostMapping("/deleteProfileImg")
    @ResponseBody
    public String deleteProfileImg(@RequestParam("a_no") Integer aNo) {
        AccountVO a = ad.findMyPage(aNo);
        if (a == null) {
            return "error"; // 계정이 없으면 에러 메시지 반환
        }
        // 프로필 이미지를 'default.png'로 변경
        a.setA_img("default.png");
        ad.updateProfileImg(a); // 데이터베이스에서 프로필 이미지 업데이트

        return "success"; // 이미지가 삭제되면 성공 메시지 반환
    }

}