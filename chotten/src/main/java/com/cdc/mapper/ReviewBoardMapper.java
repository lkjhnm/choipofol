package com.cdc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewVO;

public interface ReviewBoardMapper {
	
	public List<ReviewVO> getList(@Param("pageInfo") PageInfoDTO pageInfo, @Param("reviewlike") boolean reviewlike);
	public int count(@Param("mno") Long mno, @Param("reviewlike") boolean reviewlike);
	public void register(ReviewVO reviewVO);
	public ReviewVO getReview(Long rvno);
	public void modify(ReviewVO reviewVO);
	public void delete(Long rvno);
}
