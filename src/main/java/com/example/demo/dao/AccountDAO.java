package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.AccountVO;
import com.example.demo.vo.AccountVO2;


@Repository
public class AccountDAO {
	public AccountVO findMyPage(int a_no){
		return DBManager.getProfile(a_no);
	}
	public int updateProfileImg(AccountVO a){
		return DBManager.updateProfile(a);
	}

	public int deleteProfileImg(AccountVO a){
		return DBManager.deleteProfile(a);
	}

	public int updateNickName(AccountVO a){
		return DBManager.updateNickName(a);
	}

	public AccountVO2 findLeaderByNo(int no){
		return DBManager.findLeaderByNo(no);
	}

	public String checkID(String a_email){
		return DBManager.checkID(a_email);
	}

	public int loginPODOFAM(String a_name, String a_email){
		return DBManager.loginPODOFAM(a_name, a_email);
	}
}
