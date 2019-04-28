package com.cdc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cdc.domain.ScoreBoard;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class DbTest {
	
	@Setter(onMethod_= {@Autowired})
	private TestMapper mapper;
	
	@Test
	public void insertTest(){
		
		ScoreBoard sb = new ScoreBoard();
		sb.setScore(5);
		sb.setContent("재밌는 작품이다.");
		sb.setWriter("박평평");
		
		log.info(mapper);
		mapper.insert(sb);
	}
	
	@Test
	public void deleteTest() {
		
		mapper.delete(2);
	}
}
