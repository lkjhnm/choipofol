package com.cdc.service;

import java.util.List;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewDTO;

public interface ReviewBoardService {
	
	public List<ReviewDTO> getList(PageInfoDTO pageInfo,boolean reviewlike);
	public void register(ReviewDTO reviewDTO);
	public ReviewDTO getReview(Long rvno);
	
}
