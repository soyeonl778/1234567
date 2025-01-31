package com.kh.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CheckPwdController
 */
@WebServlet("/checkPwd.me")
public class CheckPwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckPwdController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String userId = ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		String userPwd = request.getParameter("userPwd");
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		int count = new MemberService().checkPwd(m);
		
		if(count > 0) {

			Member loginUser = (Member)request.getSession().getAttribute("loginUser");
			
			if(loginUser.getUserId().equals("admin")) {
				
				response.sendRedirect(request.getContextPath() + "/admin.me");				
			} else {
				
				response.sendRedirect(request.getContextPath() + "/myInfo.me");
			}
			
		} else {
			
			request.getSession().setAttribute("alertMsg", "현재 비밀번호와 다릅니다. 다시 입력해주세요.");
			
			request.getRequestDispatcher("views/member/checkPwdForm.jsp").forward(request, response);
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
