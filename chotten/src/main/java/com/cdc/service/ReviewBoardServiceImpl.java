package com.cdc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewVO;
import com.cdc.mapper.ReviewBoardMapper;

import lombok.Data;
import lombok.Setter;

@Service
@Data
public class ReviewBoardServiceImpl implements ReviewBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardMapper mapper;

	@Override
	public List<ReviewVO> getList(PageInfoDTO pageInfo,boolean reviewlike) {
		return mapper.getList(pageInfo,reviewlike);
	}
	
	@Override
	public int count(Long mno, boolean reviewlike) {
		return mapper.count(mno,reviewlike);
	}
	
	
	@Override
	public void register(ReviewVO reviewVO) {
		mapper.register(reviewVO);
	}
	
	@Override
	public ReviewVO getReview(Long rvno) {
		return mapper.getReview(rvno);
	}
	
	@Override
	public void modify(ReviewVO reviewVO) {
		mapper.modify(reviewVO);
	}
	
	@Override
	public void delete(Long rvno) {
		mapper.delete(rvno);
	}
}
