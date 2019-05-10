package com.cdc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cdc.domain.ReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReviewBoardTest {

	@Setter(onMethod_= {@Autowired})
	private ReviewBoardMapper mapper;
	
//	@Test
	public void register() {
		ReviewVO rd = new ReviewVO();
		rd.setTitle("제목을 굉장히 길게 지으면 과연 감당할 것인가 나는 그게 궁금해서 제목을 정말 굉장히 길게 지어본다");
		rd.setContent("테스트내용리뷰3");
		rd.setWriter("테스트작성자3번");
		rd.setMno(0l);
		
		
		mapper.register(rd);
	}
}
