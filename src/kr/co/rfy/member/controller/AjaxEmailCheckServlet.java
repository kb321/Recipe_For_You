package kr.co.rfy.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.rfy.member.service.MemberService;
import kr.co.rfy.member.service.MemberServiceImpl;

/**
 * Servlet implementation class AjaxEmailCheckServlet
 */
@WebServlet("/AjaxEmailCheck.do")
public class AjaxEmailCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxEmailCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 입력받은 이메일주소
		String userEmail = request.getParameter("userEmail");
		
		// 이메일 중복 검사
		MemberService mService = new MemberServiceImpl();
		String email = mService.emailCheck(userEmail);
		
		int result = 0;
		if(email.equals("")) {
			//MemberMailCheck.emailSend(userEmail);
		}else {
			result = 1;
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			
			out.println(result);
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
