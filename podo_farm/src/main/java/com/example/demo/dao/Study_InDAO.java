package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.AdminVO;
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

	//가입승인
	public int allowed(int a_no){
		return DBManager.allow(a_no);
	}

	//가입거절
	public int reject(int a_no){
		return DBManager.reject(a_no);
	}

	public List<AdminVO> StudyMemberList(int a_no){
		return DBManager.StudyMemberList(a_no);
	}

	public List<AdminVO> PermissionList(int a_no){
		System.out.println("DAO동작함");
		return DBManager.PermissionMemberList(a_no);
	}

	public int FindTeamLeader(int a_no){
		System.out.println("DAO 동작함");
		return DBManager.getTeamLeader(a_no);
	}

}
