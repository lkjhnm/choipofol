package com.cdc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.cdc.domain.AuthVO;
import com.cdc.domain.MemberDTO;
import com.cdc.domain.MovieTasteDTO;
import com.cdc.mapper.MemberMapper;

import lombok.Setter;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder encoder;
	
	@Override
	public boolean check(String userid) {
		
		return mapper.read(userid) != null ? true: false; //중복된값이 있으면 true
	}

	@Override
	public int signup(MemberDTO member, List<String> checkList) {
		
		insertInfo(member,checkList);
		
		return mapper.signup(member);
	}
	
	private void insertInfo(MemberDTO member, List<String> checkList) {
		
		String rawPw = member.getUserpw();
		String encodedPw = encoder.encode(rawPw);
		
		List<MovieTasteDTO> tasteList = new ArrayList<>();
		List<AuthVO> authList = new ArrayList<>();
		AuthVO auth = new AuthVO();
		auth.setUserid(member.getUserid());
		auth.setAuth("ROLE_MEMBER");
		authList.add(auth);
		
		if(checkList == null) {
			MovieTasteDTO tst = new MovieTasteDTO();
			tst.setUserid(member.getUserid());
			tst.setTaste("");
			tasteList.add(tst);
		}else {
			for(String taste : checkList) {
				MovieTasteDTO tst = new MovieTasteDTO();
				tst.setUserid(member.getUserid());
				tst.setTaste(taste);
				tasteList.add(tst);	
			}
		}
		
		member.setAuthList(authList);
		member.setUserpw(encodedPw);
		member.setTasteList(tasteList);
	}
	
}
