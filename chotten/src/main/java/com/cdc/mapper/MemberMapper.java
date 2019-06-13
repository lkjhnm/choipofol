package com.cdc.mapper;

import com.cdc.domain.MemberDTO;

public interface MemberMapper {
	
	public MemberDTO read(String userid);
	
	public MemberDTO check(String userid);
	
	public int signup(MemberDTO member);
}
