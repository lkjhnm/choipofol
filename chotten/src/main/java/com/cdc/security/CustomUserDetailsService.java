package com.cdc.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.cdc.domain.MemberDTO;
import com.cdc.mapper.MemberMapper;
import com.cdc.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService{
	
	@Setter(onMethod_= {@Autowired})
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberDTO mem = memberMapper.read(username);
		
		return mem == null ? null : new CustomUser(mem);
	}
}
