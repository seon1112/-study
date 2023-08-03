package com.example.demo.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BoardDetailVO;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.LanguageVO;

@Repository
public class BoardDAO {
	//한 화면에 보여줄 레코드의 수
		public static int pageSIZE=1;
		
		//전체레코드의 수
		public static int totalRecord;
		
		//전체페이지의 수
		public static int totalPage;
	
	public int insert(BoardVO b) {
		return DBManager.insertBoard(b);
	}
	
	public int getNextNo() {
		return DBManager.getNextNoBoard();
	}
/*
	public List<BoardVO> findAll(int no){
		return DBManager.findAllBoard(no);
	}
	*/
	
	public List<BoardVO> findByAno(HashMap<String,Object> map){
		totalRecord = DBManager.getTotalRecord(map);
		System.out.println("totalRecord"+totalRecord);
		totalPage=(int)Math.ceil(totalRecord/(double)pageSIZE);
		System.out.println("totalPage"+totalPage);
		
		return DBManager.findByAnoBoard(map);
	}
	
	public BoardDetailVO findByBno(int no) {
		return DBManager.findByBnoBoard(no);
	}
	
	public int update(BoardVO b) {
		return DBManager.updateBoard(b);
	}
	
	public int delete(int no) {
		return DBManager.deleteBoard(no);
	}
}
