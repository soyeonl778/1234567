package com.kh.qna.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnaDao;
import com.kh.qna.model.vo.Qna;

public class QnaService {
	
	// 1:1 문의 작성 서비스
	public int insertQuestion(Qna q) {
		
		// 커넥션 객체 생성
		Connection conn = getConnection();
		
		// Dao 로 커넥션 객체와 전달받은값(q) 을 넘겨주면서 요청
		int result = new QnaDao().insertQuestion(conn, q);
		
		// 트랜잭션 처리 해주기
		if(result > 0) { // 성공시 커밋
			commit(conn);
		} else { // 실패시 롤백
			rollback(conn);
		}
		// 커넥션 객체 자원 반납 해주기
		close(conn);
		
		// 결과값 반환
		return result;
	}
	
	// 총 게시글 갯수 구하는 서비스
	public int selectListCount(int userNo) {
		
		
		Connection conn = getConnection();
		
		int listCount = new QnaDao().selectListCount(conn, userNo);
		
		// 트랜잭션 생략
		
		close(conn);
	
		return listCount;
	}
	
	// 1:1 문의 전체조회용 서비스
	public ArrayList<Qna> selectList(PageInfo pi, Qna q, int userNo) {
		
		Connection conn = getConnection();
		ArrayList<Qna> list = new QnaDao().selectList(conn, pi, q, userNo);
		
		// 셀렉문 트랜잭션 패스
		
		close(conn);
		
		return list;
	}
	
	// 1:1문의 상세조회용 서비스(임시로 만든것)
	public Qna selectAsk(int askNo) {
		
		Connection conn = getConnection();
		
		Qna q = new QnaDao().selectAsk(conn, askNo);
		
		close(conn);
		
		return q;
		
	}
	
	// 1:1 문의 수정용 서비스
	public int updateAsk(Qna q) {
		
		Connection conn = getConnection();
		
		int result = new QnaDao().updateAsk(conn, q);
		
		if(result > 0) { // 성공
			commit(conn);
		} else { // 실패
			rollback(conn);
		}
		close(conn);
		
		// 5. 결과 반환
		return result;
	}
	
	// 1:1 문의 삭제용 서비스
	public int deleteAsk(int askNo) {
		
		Connection conn = getConnection();
		
		int result = new QnaDao().deleteAsk(conn, askNo);
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		if(result > 0) { 
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}
	
	public int insertAnswer(int ano, String aContent) {
		
		Connection conn = getConnection();
		
		int result = new QnaDao().insertAnswer(conn, ano, aContent);
		
		
		
	}
	
	public Qna selectAnswer() {
		
		
		
		
	}
	
}
