package com.cdc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewDTO;
import com.cdc.mapper.ReviewBoardMapper;

import lombok.Data;
import lombok.Setter;

@Service
@Data
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardMapper mapper;

	@Override
	public List<ReviewDTO> getList(PageInfoDTO pageInfo,boolean reviewlike) {
		return mapper.getList(pageInfo,reviewlike);
	}
	
	@Override
	public void register(ReviewDTO reviewDTO) {
		mapper.register(reviewDTO);
	}
	
	@Override
	public ReviewDTO getReview(Long rvno) {
		return mapper.getReview(rvno);
	}
	
}
