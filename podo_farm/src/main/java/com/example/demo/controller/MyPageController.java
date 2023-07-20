package com.example.demo.controller;

import com.example.demo.dao.AccountDAO;
import com.example.demo.dao.Study_InDAO;
import com.example.demo.vo.AccountVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.SmartView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

@Controller
@Setter
public class MyPageController {

    @Autowired
    private AccountDAO ad;

    @Autowired
    private Study_InDAO sid;

    private int a_no = 200;

    @GetMapping("/myPage")
    public void myPage(Model model){
        model.addAttribute("a", ad.findMyPage(a_no));
    }

    @PostMapping("uploadImage")
    @ResponseBody
    public ModelAndView submit(AccountVO a, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("redirect:/myPage");
        String path = request.getServletContext().getRealPath("images");

        // 원래 등록된 사진 이름
        String oldFname = a.getA_img();
        System.out.println("예전 이미지: " + oldFname);

        // 업로드한 파일 객체 담아오기
        MultipartFile uploadFile = a.getUploadFile();

        // 업로드한 파일 이름 저장
        String fname = null;

        if(fname != null && !fname.equals("")){
            //중복된 파일명을 피하기 위하여
            //임의의 난수를 발행하여
            //파일명 뒤에 붙여줍니다.
            long n = System.currentTimeMillis();
            fname = fname.replace(".", ",");
            String []str= fname.split(",");
            fname = str[0] + n + "." + str[1];
            System.out.println(fname);
        }


        if (uploadFile != null) {
            // 업로드한 파일명
            fname = uploadFile.getOriginalFilename();

            try {
                int re = ad.updateProfileImg(a);
                if (re == 1 && fname != null && !fname.equals("")) {
                    long n = System.currentTimeMillis();
                    fname = fname.replace(".", ",");
                    String[] str = fname.split(",");
                    fname = str[0] + n + "." + str[1];

                    try {
                        byte[] data = uploadFile.getBytes();

                        // 파일을 저장하기 위한 스트림 생성
                        FileOutputStream fos = new FileOutputStream(path + "/" + fname);

                        // 파일 내용을 출력
                        fos.write(data);
                        fos.close();

                        // 업로드한 파일 VO에 저장
                        a.setA_img(fname);
                    } catch (Exception e) {
                        System.out.println("예외 발생: " + e.getMessage());
                    }

                    File file = new File(path + "/" + oldFname);
                    file.delete();
                }
            } catch (Exception e) {
                System.out.println("예외 발생: " + e.getMessage());
            }
        }
        return mav;
    }



    @GetMapping("/myPage_study")
    public void myPage_Study(Model model){
        int leader = sid.FindTeamLeader(a_no);
        // model.addAttribute("ad", sid.StudyMemberList(a_no));
        //if(a_no == leader) {
        model.addAttribute("pl", sid.PermissionList(a_no));
        //}
        System.out.println("매핑동작함");
    }


    @PostMapping("acceptRequest")
    @ResponseBody
    public ModelAndView acceptRequest(Model model, @RequestParam("a_no") int a_no){
        sid.allowed(a_no);
        ModelAndView mav = new ModelAndView("redirect:myPage_study");

        // 업데이트된 데이터를 JSON 형식으로 반환
        Map<String, String> response = new HashMap<>();
        response.put("message", "승인되었습니다!");

        return mav;
    }

    @PostMapping("/rejectRequest")
    public ModelAndView rejectRequest(Model model){
        sid.reject(a_no);
        ModelAndView mav = new ModelAndView("redirect:myPage_study");
        // 업데이트된 데이터를 JSON 형식으로 반환
        Map<String, String> response = new HashMap<>();
        response.put("message", "승인되었습니다!");

        return mav;
    }

    @GetMapping("/deletePage")
    public ModelAndView deletePage(Model model){
        ad.deleteAccount(3);
        ModelAndView mav = new ModelAndView("redirect:/mainPage");
        System.out.println("mav : " + mav);
        return mav;
    }




}