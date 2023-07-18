package com.example.demo.controller;

import com.example.demo.dao.AccountDAO;
import com.example.demo.vo.AccountVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;

@Controller
@RequestMapping("/myPage/{a_no}")
@Setter
public class MyPageController {

    @Autowired
    private AccountDAO ad;

    @GetMapping
    public void form(@PathVariable("a_no") int a_no, Model model){
        model.addAttribute("a", ad.findMyPage(a_no));
    }

    @PostMapping
    public ModelAndView submit(AccountVO a, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("redirect:/myPage");

        String path = request.getServletContext().getRealPath("images");

        // 원래 등록된 사진 이름
        String olda_img = a.getA_img();
        System.out.println("예전 이미지: " + olda_img);

        // 업로드한 파일 객체 담아오기
        MultipartFile uploadFile = a.getUploadFile();

        // 업로드한 파일 이름 저장
        String fname = null;

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

                    File file = new File(path + "/" + olda_img);
                    file.delete();
                }
            } catch (Exception e) {
                System.out.println("예외 발생: " + e.getMessage());
            }
        }

        return mav;
    }
}