package com.sp.grooveware.member;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Service;

import com.sp.grooveware.common.dao.CommonDAO;


@Service("member.memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private CommonDAO dao;
	
	@Override
	public Member loginMember(String emp_email) {
		Member dto = null;

		try {
			dto = dao.selectOne("member.loginMember", emp_email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dto;
	}
}

	