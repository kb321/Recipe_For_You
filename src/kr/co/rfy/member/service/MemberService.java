package kr.co.rfy.member.service;

import kr.co.rfy.member.vo.Member;

public interface MemberService {



	/**
	 * @param userId
	 * @return Member
	 * Description : 회원 아이디 조회
	 */
	Member memberIdCheck(String userId);

	/**
	 * @param m 
	 * @return int
	 * Description : 회원가입 
	 */
	int memberJoin(Member m);

	/**
	 * @param userId
	 * @param userPwd
	 * @return Member
	 * Description : 로그인
	 */
	Member memberLogin(String userId, String userPwd);

	/**
	 * @param userId
	 * @return int
	 * Description : 회원탈퇴 
	 */
	int memberWithDraw(String userId);

	/**
	 * @param userEmail
	 * @param userPhone
	 * @param userId
	 * @return int
	 * Description : 회원정보 Email과 Phone 업데이트 
	 */
	int memberUpdate(String userEmail, String userPhone, String userId);

	/**
	 * @param userId
	 * @param userPwd
	 * @return int
	 * Description : 회원비밀번호 변경 
	 */
	int memberPwdChange(String userId, String userPwd);

}
