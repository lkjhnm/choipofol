package com.cdc.service;

import java.util.List;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewVO;

public interface ReviewBoardService {
	
	public List<ReviewVO> getList(PageInfoDTO pageInfo,boolean reviewlike);
	public int count(Long mno, boolean reviewlike);
	public void register(ReviewVO reviewVO);
	public ReviewVO getReview(Long rvno);
	public void modify(ReviewVO reviewVO);
	public void delete(Long rvno);
}
