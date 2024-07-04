package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.example.demo.dao.LanguageDAO;

import lombok.Setter;

@Controller
@Setter
public class LanguageController {
	
	@Autowired
	private LanguageDAO dao;
	
	
}
