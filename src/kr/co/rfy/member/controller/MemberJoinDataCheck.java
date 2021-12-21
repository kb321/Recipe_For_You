package kr.co.rfy.member.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.co.rfy.member.vo.Member;

public class MemberJoinDataCheck {

	public boolean regExp(Member m) {
		
		// 정규식
		String id = "\\w{6,12}"; // 영문자+숫자 6~12글자
		String name = "^[가-힣]{2,10}"; // 한글 2~10글자
		String email = "\\w+@[a-z]+.[a-z]+";  // 이메일 (영문자+숫자) @ 영문자  
		String phone = "^[0-9]{10,11}"; // 숫자 10~11글자
		
		String pwd_a = "[a-z]"; // 영문자 확인
		String pwd_n = "[0-9]"; // 숫자 확인
		String pwd_s = "[~!@#$%^&*()-_=+<>/?]"; // 특수문자 확인
		String pwd_b = "\s"; // 공백문자 확인
		
		String [] exp = {pwd_a, pwd_n, pwd_s};
		
		// 아이디, 이름, 이메일, 전화번호 검증
		boolean valId = m.getUserId().matches(id); 
		boolean valName = m.getUserName().matches(name); 
		boolean valEmail = m.getUserEmail().matches(email);
		boolean valPhone = m.getUserPhone().matches(phone); 
		boolean valPwd = true; 
		
			// 비밀번호 글자수 검사
		if(m.getUserPwd().length()>8) {
				// 영문자, 숫자, 특수문자 검사
			for(int i=0;i<exp.length;i++) {
				Pattern pattern = Pattern.compile(exp[i]);
				Matcher matcher = pattern.matcher(m.getUserPwd());
				if(!matcher.find()) valPwd = false;
			}
				// 공백문자 검사
			Pattern pattern = Pattern.compile(pwd_b);
			Matcher matcher = pattern.matcher(m.getUserPwd());
			if(matcher.find()) valPwd = false; 
		}else {
			valPwd = false;
		}
		
		// 유효성검사 결과가 전부 맞으면 true 리턴
		if(valId && valName && valEmail && valPhone && valPwd) return true;
		else return false;
	}
}
