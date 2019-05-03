package com.cdc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdc.domain.MovieDTO;
import com.cdc.mapper.MovieBoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class MovieBoardServiceImpl implements MovieBoardService {
	
	@Setter(onMethod_= {@Autowired})
	private MovieBoardMapper mapper;

	@Override
	public void register(MovieDTO movieDTO) {
		
		log.info(movieDTO);
		
		mapper.register(movieDTO);
	}

	@Override
	public void delete(Long mno) {
		
		log.info(mno);
		
		mapper.delete(mno);
	}

	@Override
	public MovieDTO getMovie(Long mno) {
		
		log.info(mno);
		
		return mapper.getMovie(mno);
	}

	
}
