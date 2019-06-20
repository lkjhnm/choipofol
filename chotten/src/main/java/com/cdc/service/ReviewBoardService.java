package com.cdc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewImgDTO;
import com.cdc.domain.ReviewImgDTOList;
import com.cdc.domain.ReviewVO;

public interface ReviewBoardService {
	
	public List<ReviewVO> getList(PageInfoDTO pageInfo,boolean reviewlike);
	public int count(Long mno, boolean reviewlike);
	public void register(ReviewVO reviewVO,List<ReviewImgDTO> imgDTO);
	public ReviewVO getReview(Long rvno);
	public void modify(ReviewVO reviewVO,List<ReviewImgDTO> imgList);
	public void delete(Long rvno);
	
	public String upload(MultipartFile uploadFile);
	public void clean();
}
