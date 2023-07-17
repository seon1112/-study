package com.example.demo.dao;


import com.example.demo.db.DBManager;
import com.example.demo.vo.AccountVO;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAO {
    public int updateProfileImg(AccountVO a){
        return DBManager.updateProfile(a);
    }
}
