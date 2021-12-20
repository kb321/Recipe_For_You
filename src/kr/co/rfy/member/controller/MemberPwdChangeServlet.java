package kr.co.rfy.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.co.rfy.member.service.MemberService;
import kr.co.rfy.member.service.MemberServiceImpl;
import kr.co.rfy.member.vo.Member;

/**
 * Servlet implementation class MemberPwdChangeServlet
 */
@WebServlet("/member/memberPwdChange.do")
public class MemberPwdChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberPwdChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//로그인한 회원인지 확인
		if(request.getSession().getAttribute("member")==null) {
			response.sendRedirect("/views/commons/error.jsp");
			return;
		}
		String userId = ((Member)request.getSession().getAttribute("member")).getUserId();
		String userPwd = request.getParameter("userPwd");
		
		MemberService mService = new MemberServiceImpl();
		int result = mService.memberPwdChange(userId, userPwd);
		
		// 성공여부 알림을 위해  member/memberMsg.jsp로 페이지 이동 및 메세지 세팅
		RequestDispatcher view = request.getRequestDispatcher("/views/member/memberMsg.jsp");
		String addr = "/";
		String msg = "";
		if(result>0) {
			msg = "비밀번호를 변경하였습니다.";
			
		}else {
			msg = "비밀번호를 변경하지 못했습니다."+"<br>"+"- 지속적인 문제발생시 관리자에게 문의해주세요 -";
		}
		
		request.setAttribute("addr", addr);
		request.setAttribute("msg", msg);
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
