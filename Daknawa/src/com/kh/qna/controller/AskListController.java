package com.kh.qna.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.common.model.vo.SubNav;
import com.kh.member.model.vo.Member;
import com.kh.qna.model.service.QnaService;
import com.kh.qna.model.vo.Qna;

/**
 * Servlet implementation class AskListController
 */
@WebServlet("/list.ask")
public class AskListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AskListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	// 페이징 처리
	
		// 필요한 변수들
		int listCount; // 현재 총 게시글의 갯수
		int currentPage; // 현재 사용자가 요청하는 페이지
		int pageLimit; // 파이지 하단에 보여질 페이징바 최대 갯수
		int postLimit; // 한페이지에 보여질 문의글 최대 갯수
		
		int maxPage; // 가장 마지막 페이지(총 페이지수)
		int startPage; // 페이지 하단에 보여질 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝수
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		listCount = new QnaService().selectListCount(userNo);
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 10;
		
		postLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / postLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1; 
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 페이지 정보들을 하나의 VO로 객체로 담아서 DAO로 보내기
		
		Qna q = new Qna();
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, postLimit,
								   maxPage, startPage, endPage);
				
		// pi를 서비스단으로 넘기면서 결과 받기
		ArrayList<Qna> list = new QnaService().selectList(pi, q, userNo); // 내가쓴 문의글만 봐야함
		
		System.out.println(list);
		
		// 응답페이지 데이터 담기
		// 조회된 리스트, 페이징바
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		SubNav sn = new SubNav();
		
		sn.setTitle1("MY PAGE");
		sn.setTitle1Addr("myInfo.me");
		sn.setTitle2("문의내역");
		sn.setTitle2Addr("list.ask?currentPage=1");
		sn.setTitle3("1:1문의내역관리");
		sn.setActive1("1");
		sn.setActive2("1");
		sn.setActive3("1");
		sn.setActive4("active");
		
		request.setAttribute("sn", sn);
		
		request.getRequestDispatcher("views/qna/askList.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
