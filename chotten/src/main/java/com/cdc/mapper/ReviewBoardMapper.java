package com.cdc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewImgDTO;
import com.cdc.domain.ReviewVO;

public interface ReviewBoardMapper {
	
	public List<ReviewVO> getList(@Param("pageInfo") PageInfoDTO pageInfo, @Param("reviewlike") boolean reviewlike);
	public int count(@Param("mno") Long mno, @Param("reviewlike") boolean reviewlike);
	public void register(ReviewVO reviewVO);
	public ReviewVO getReview(Long rvno);
	public void modify(ReviewVO reviewVO);
	public void delete(Long rvno);
	
	public int upload(@Param("imgList") List<ReviewImgDTO> reviewImg);
	public ReviewImgDTO getImgInfo(String uuid);
	public void deleteImg(Long rvno);
	
	public List<ReviewImgDTO> cleanList(Long num); //일주일 단위로 실행하며 num를 7까지 증가시켜서 전날,전전날... 의 이미지 리스트를 뽑아온다.
}
