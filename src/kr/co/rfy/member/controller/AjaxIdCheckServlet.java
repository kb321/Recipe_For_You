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
import kr.co.rfy.member.vo.Member;

/**
 * Servlet implementation class AjaxIdCheckServlet
 */
@WebServlet("/member/AjaxIdCheck.do")
public class AjaxIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력받은 아이디
		String userId = request.getParameter("userId");
		
		MemberService mService = new MemberServiceImpl();
		String id = mService.memberIdCheck(userId);
		
		// 결과에 따라 ajax에 보내줄 값 설정
		int result;
		if(id.equals("")) result=0;
		else result=1;
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println(result);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
