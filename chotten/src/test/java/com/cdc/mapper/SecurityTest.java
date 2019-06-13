package com.cdc.mapper;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cdc.domain.AuthVO;
import com.cdc.domain.MemberDTO;
import com.cdc.domain.MovieTasteDTO;
import com.cdc.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
						"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class SecurityTest {
	
	@Setter(onMethod_= {@Autowired})
	private MemberMapper mapper;
	
	@Setter(onMethod_= {@Autowired})
	private PasswordEncoder pwencoder;
	
	@Test
	public void Test() {
		log.info(mapper.read("테스트"));
		MemberDTO member = mapper.read("테스트");
		
		log.info("목록 보기 :   "+member);
		
		System.out.println(member.getUserid()+"의 좋아하는 영화 목록 : "+member.getTasteList());
		System.out.println(member.getUserid()+"의 권한 목록 : " + member.getAuthList());
	}
	
//	@Test
	public void test2() {
		
		MemberDTO mem = mapper.read("mastercdc");
		
		assert(mem != null);
	}
	
//	@Test
	public void test3() {
		
		System.out.println(pwencoder.encode("1234"));
	}
	
//	@Test
	public void test4() {
		MemberDTO mem = new MemberDTO();
		mem.setUserid("테스트");
		mem.setUserpw("123");
		mem.setUserName("테스트라");
		mem.setUserEmail("테스트 닷컴");
		List<AuthVO> list = new ArrayList<>();
		AuthVO auth1 = new AuthVO();
		auth1.setUserid("테스트");
		auth1.setAuth("권한1");
		AuthVO auth2 = new AuthVO();
		auth2.setUserid("테스트");
		auth2.setAuth("권한2");
		list.add(auth1);
		list.add(auth2);
		List<MovieTasteDTO> tasteList = new ArrayList<>();
		MovieTasteDTO mot1 = new MovieTasteDTO();
		mot1.setUserid("테스트");
		mot1.setTaste("호러");
		MovieTasteDTO mot2 = new MovieTasteDTO();
		mot2.setUserid("테스트");
		mot2.setTaste("코미디");
		MovieTasteDTO mot3 = new MovieTasteDTO();
		mot3.setUserid("테스트");
		mot3.setTaste("드라마");
		tasteList.add(mot1);
		tasteList.add(mot2);
		tasteList.add(mot3);
		mem.setAuthList(list);
		mem.setTasteList(tasteList);
		
		mapper.signup(mem);
	}
}
