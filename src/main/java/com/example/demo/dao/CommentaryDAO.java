package com.example.demo.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.demo.db.DBManager;
import com.example.demo.vo.BoardDetailVO;
import com.example.demo.vo.BoardVO;
import com.example.demo.vo.CommentaryVO;
import com.example.demo.vo.LanguageVO;

@Repository
public class CommentaryDAO {
	//질문별 댓글	
	public List<CommentaryVO> findByNo(int no) {
		return DBManager.findByNoComment(no);
	}
	
	//댓글 다음 번호
	public int getNextNo() {
		return DBManager.getNextNoComment();
	}
	
	//댓글 생성
	public int insert(CommentaryVO c) {
		return DBManager.insertComment(c);
	}
	
	//댓글 수정
	public int update(CommentaryVO c) {
		return DBManager.updateComment(c);
	}
	
	//댓글 삭제
	public int delete(int no) {
		return DBManager.deleteComment(no);
	}
}
