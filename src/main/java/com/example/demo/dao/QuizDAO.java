package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.QuizVO;

@Repository
public class QuizDAO {
	//문제 제목 출력
	public List<String> findTitle(){
		return DBManager.findTitle();
	}
	
	//문제 정보 출력
	public QuizVO findByTitle(String q_title) {
		return DBManager.findByTitle(q_title);
	}
}
