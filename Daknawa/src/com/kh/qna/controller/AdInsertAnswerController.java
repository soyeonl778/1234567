package com.kh.qna.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.qna.model.service.QnaService;

/**
 * Servlet implementation class AdInsertAnswerController
 */
@WebServlet("/adAnswer.ask")
public class AdInsertAnswerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdInsertAnswerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		HttpSession session = request.getSession();
//		int ano = Integer.parseInt(request.getParameter("askNo"));
//		String aContent = request.getParameter("askContent");
//		
//		response.setContentType("text/html; charset=UTF-8"); // 한글이 깨질수있기 때문
//		
//		PrintWriter out = response.getWriter(); // 데이터 보내줄 통로 열어주기(출력스트림)
//		
//		out.print(response);
//		
//		new QnaService().insertAnswer(ano, aContent);
		
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(response);
		
		new QnaService().insertAnswer();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
