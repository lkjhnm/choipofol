package com.cdc.service;

import com.cdc.domain.MovieDTO;

public interface MovieBoardService {
	
	public void register(MovieDTO movieDTO);
	public void delete(Long mno);
	public MovieDTO getMovie(Long mno);
}
