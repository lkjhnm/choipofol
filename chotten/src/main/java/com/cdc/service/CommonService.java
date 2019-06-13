package com.cdc.service;

import java.util.List;

import com.cdc.domain.MemberDTO;

public interface CommonService {
	
	public boolean check(String userid);
	
	public int signup(MemberDTO member,List<String> checkList);
}
