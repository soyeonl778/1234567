package com.kh.qna.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.common.JDBCTemplate;
import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.vo.Qna;

public class QnaDao {
	
	private Properties prop = new Properties();
	
	public QnaDao() {
		
		// sql 쿼리문이랑 연결시킬 파일을 위치 지정해서 변수로 선언해줌.
		String fileName = QnaDao.class.getResource("/sql/qna/qna-mapper.xml").getPath();
		
		try {
			// xml파일의 내용을 위에서 만든 prop 객체에 연결시켜주는 구문
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int insertQuestion(Connection conn, Qna q) {
		// insert 문은 int로 셋팅
		
		// 변수 셋팅
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		// 필요한 쿼리문 불러오는 구문 ( 키값 일치해야함*중요*)
		String sql = prop.getProperty("insertQuestion");
		
		try {
			// PreparedSatatement 객체 생성 
			pstmt = conn.prepareStatement(sql);
			
			// 비어있는 값을 채워줄 쿼리문 만들기
			pstmt.setInt(1, q.getAskType());
			pstmt.setString(2, q.getAskTitle());
			pstmt.setString(3, q.getAskContent());
			pstmt.setInt(4, q.getMemberNo());
			
			// 위에 실행한 쿼리문의 결과값 받아내는 구문
			// insert 구문이니까 executeUpdate / 셀렉문은 executeQuery
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 자원반납 무조건해야함!! finally 써서!!
			JDBCTemplate.close(pstmt);
		}
		// 결과 반환
		return result;
	}

	public int selectListCount(Connection conn, int userNo) {
		
		// 셀렉문이니까 ResultSet
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, userNo);
			
			rset = pstmt.executeQuery();
			
		// 조회된 결과를 변수로 가공하기
			if(rset.next()) {
				listCount = rset.getInt("COUNT"); // 별칭임
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return listCount;
	}
	
	public ArrayList<Qna> selectList(Connection conn, PageInfo pi, Qna q, int userNo) {
		
		// 여러행 조회 ResultSet
		
		ArrayList<Qna> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getPostLimit() + 1;
			int endRow = startRow + pi.getPostLimit() - 1;
			
			pstmt.setInt(1, userNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			// 조회된 결과를 VO로 가공
			while(rset.next()) {
				list.add(new Qna(rset.getInt("ASK_NO") 
							   , rset.getInt("ASK_TYPE") 
							   , rset.getString("ASK_TITLE")
							   , rset.getString("ASK_CONTENT")
							   , rset.getInt("MEMBER_NO") 
							   , rset.getDate("ASK_DATE")
							   , rset.getString("ANSWER_CONTENT")
							   , rset.getDate("ANSWER_DATE")));
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;	
	}
	
	public Qna selectAsk(Connection conn, int askNo) {
		
		Qna q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				q = new Qna();
				q.setAskNo(rset.getInt("ASK_NO"));
				q.setAskTitle(rset.getString("ASK_TITLE"));
				q.setAskContent(rset.getString("ASK_CONTENT"));
				q.setAskDate(rset.getDate("ASK_DATE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return q;
	}
	
	public int updateAsk(Connection conn, Qna q) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateAsk");
		
		System.out.println(q);
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, q.getAskTitle());
			pstmt.setString(2, q.getAskContent());
			pstmt.setInt(3, q.getAskNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int deleteAsk(Connection conn, int askNo) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("deleteAsk");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, askNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int insertAnswer(Connection conn, int ano, String aContent) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertAnswer");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
