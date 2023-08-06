package com.example.demo.dao;

import java.util.List;

import com.example.demo.vo.AdminVO;
import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AccountVO;
import com.example.demo.vo.Study_InVO;

@Repository
public class Study_inDAO {
	//스터디 생성시 방장 추가
	public int insertLeader(Study_InVO s) {
		return DBManager.insertStudy_inLeader(s);
	}

	//스터디 다음 no 찾기
	public int getNextNo() {
		return DBManager.getNextNoStudy_in();
	}

	//스터디 신청시 멤버추가
	public int insertMember(Study_InVO s) {
		return DBManager.insertStudy_inMember(s);
	}

	//스터디 멤버인지 확인
	public int isMember(int no) {
		return DBManager.isMember(no);
	}
	//--------------------------------------
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

	//스터디 멤버리스트 출력
	public List<AdminVO> StudyMemberList(int a_no){
		return DBManager.StudyMemberList(a_no);

	}
	//승인목록 출력
	public List<AdminVO> PermissionList(int a_no){
		System.out.println("DAO동작함");
		return DBManager.PermissionMemberList(a_no);
	}
	//IF문을 위한 리더찾기
	public int FindTeamLeader(int a_no){
		System.out.println("DAO 동작함");
		return DBManager.getTeamLeader(a_no);
	}
	//방장 정보 가져오기
	public AdminVO TeamLeaderInfo(int a_no){
		return DBManager.TeamLeaderInfo(a_no);
	}

	public String nickName(int b_no){
		return DBManager.nickName(b_no);
	}
}
