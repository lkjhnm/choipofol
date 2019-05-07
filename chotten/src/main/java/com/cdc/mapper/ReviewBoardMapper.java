package com.cdc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewDTO;

public interface ReviewBoardMapper {
	
	public List<ReviewDTO> getList(@Param("pageInfo") PageInfoDTO pageInfo, @Param("reviewlike") boolean reviewlike);
	public void register(ReviewDTO reviewDTO);
	public ReviewDTO getReview(Long rvno);
}
