package com.cdc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MovieBoardTest {

	@Setter(onMethod_= {@Autowired})
	private MovieBoardMapper mapper;
	
	
	@Test
	public void getMovie() {
		log.info(mapper.getMovie(4l));
	}
	
//	@Test
//	public void register() {
//		MovieVO mv = new MovieVO();
//		
//		mv.setTitle("영화3");
//		mv.setContent("콘텐츠3");
//		mapper.register(mv);
//	}
}
