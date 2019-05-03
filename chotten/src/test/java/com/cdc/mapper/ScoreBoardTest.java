package com.cdc.mapper;

import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ScoreDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ScoreBoardTest {

	@Setter(onMethod_= {@Autowired})
	ScoreBoardMapper mapper;
	
//	@Test
//	public void register() {
//		ScoreDTO sc = new ScoreDTO();
//		
//		sc.setScore(5l);
//		sc.setWriter("테스터5");
//		sc.setContent("테스트 컨텐츠5");
//		sc.setMno(0l);
//		
//		mapper.register(sc);
//	}
	
	@Test
	public void getLikeList() {
		PageInfoDTO pi = new PageInfoDTO();
		pi.setMno(0l);
		mapper.getLikeList(pi);
		
	}
	
	
//	@Test
//	public void getTotalScore() {
//		
//		double count = mapper.getTotalCount();
//		List<Integer> scores = mapper.getTotalScore();
//		int sum = 0;
//		for(int x : scores) {
//			sum += x;
//		}
//		
//		double avg = sum / count;
//		log.info("평균값: " + avg);
//	}
}
