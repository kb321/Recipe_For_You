package kr.co.rfy.member.controller;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import kr.co.rfy.member.vo.Member;

public class MemberJoinDataCheck {

	public boolean regExp(Member m) {
		
		String id = "\\w+{6,12}";
		String name = "^[가-힣]{2,10}";
		String email = "\\w+@[a-z]+.[a-z]+";
		String phone = "^[0-9]{10,11}";
		
		String pwd_a = "[a-z]";
		String pwd_n = "[0-9]";
		String pwd_s = "[~!@#$%^&*()-_=+<>/?]";
		String pwd_b = "\s";
		
		String [] exp = {pwd_a, pwd_n, pwd_s, pwd_b};
		
		boolean valId = Pattern.matches(m.getUserId(), id); 
		boolean valName = Pattern.matches(m.getUserName(), name); 
		boolean valEmail = Pattern.matches(m.getUserEmail(), email); 
		boolean valPhone = Pattern.matches(m.getUserPhone(), phone); 
		 
		System.out.println(valId);
		System.out.println(valName);
		System.out.println(valEmail);
		System.out.println(valPhone);
		
		
		
		for(int i=0;i<exp.length;i++) {
			Pattern pattern = Pattern.compile(exp[i]);
			Matcher matcher = pattern.matcher(m.getUserPwd());
			if(!matcher.find()) {
				return false;
			}
		}
		
		if(valId || valName || valEmail || valPhone) {
			return true;
		}else {
			return false;
		}
	}
}
