package com.cdc.mapper;

import com.cdc.domain.MovieDTO;

public interface MovieBoardMapper {
	
	public MovieDTO getMovie(Long mno);
	
	public void register(MovieDTO movieDTO);
	
	public void delete(Long mno);
}
