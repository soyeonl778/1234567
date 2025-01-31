package com.kh.member.model.service;

import static com.kh.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.member.model.dao.MemberDao;
import com.kh.member.model.vo.Member;

public class MemberService {

	// 로그인 요청 서비스
	public Member loginMember(Member m) {
		
		Connection conn = getConnection();
		
		Member loginUser = new MemberDao().loginMember(conn, m);
		
		close(conn);
		
		return loginUser;		
	}
	
	// 회원가입 서비스
	public int insertMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, m);
		
		if(result > 0) {
			
			commit(conn);
		} else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 회원정보 변경 서비스
	public Member updateMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updateMember(conn, m);
		
		Member updateMem = null;
		
		if(result > 0) {
			
			commit(conn);
			
			updateMem = new MemberDao().selectMember(conn, m.getUserId());
			
		} else {
			
			rollback(conn);
			
		}
		
		close(conn);
		
		return updateMem;
	}

	// 아이디 중복 확인
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().idCheck(conn, checkId);
		
		close(conn);
		
		return count;		
	}
	
	// 닉네임 중복 확인
	public int nicknameCheck(String checkNickname) {

		Connection conn = getConnection();
		
		int count = new MemberDao().nicknameCheck(conn, checkNickname);
		
		close(conn);
		
		return count;
	}
	
	// 회원 탈퇴 서비스
	public int deleteMember(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, m);
		
		if(result > 0) {
			
			commit(conn);
		} else {
			
			rollback(conn);	
		}
		
		return result;
	}
	
	// 비밀번호 체크 서비스
	public int checkPwd(Member m) {
		
		Connection conn = getConnection();
		
		int count = new MemberDao().checkPwd(conn, m);
		
		close(conn);
		
		return count;
	}
	
	// 비밀번호 변경 서비스
	public int updatePwd(Member m) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, m);
		
		if(result > 0) {
			
			commit(conn);
		} else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 비밀번호 찾기 - 이메일 인증기능 서비스
	public String searchPwd(String userId) {
		
		Connection conn = getConnection();
		
		String email = new MemberDao().searchPwd(conn, userId);
		
		close(conn);
		
		return email;
	}
	
	// 회원 등급 조회용 서비스
	public String selectGradeName(int userPoint) {
		
		Connection conn = getConnection();
		
		String gradeName = new MemberDao().selectGradeName(conn, userPoint);
		
		close(conn);
		
		return gradeName;
	}

}
