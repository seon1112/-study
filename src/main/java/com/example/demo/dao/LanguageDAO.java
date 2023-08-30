package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.LanguageVO;

@Repository
public class LanguageDAO {
	
	public int insert(LanguageVO l) {
		return DBManager.insertLanguage(l);
	}
	
	public int getNextNo() {
		return DBManager.getNextNoLanguage();
	}
	
	public List<LanguageVO> findByNo(int no) {
		return DBManager.findByNoLanguage(no);
	}
}
