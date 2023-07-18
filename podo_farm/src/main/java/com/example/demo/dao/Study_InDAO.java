package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AccountVO;

@Repository
public class Study_InDAO {
	//스터디 멤버 찾기
	public List<AccountVO> findMember(String a_no){
		return DBManager.findMember(a_no);
	}
	//같은 스터디 멤버 찾기
	public List<AccountVO> findMate(String a_no){
		return DBManager.findMate(a_no);
	}
}
