package com.example.demo.vo;

import java.sql.Date;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;


@Data
public class AccountVO {
    private int a_no;
    private String a_nick;
    private String a_name;
    private String a_gender;
    private String a_email;
    private String a_img;
    private Date a_regdate;
    private MultipartFile uploadFile;
}

