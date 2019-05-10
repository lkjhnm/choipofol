package com.cdc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReplyDTO;
import com.cdc.mapper.ReplyBoardMapper;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@Data
public class ReplyBoardServiceImpl implements ReplyBoardService{
	
	@Setter(onMethod_= {@Autowired})
	private ReplyBoardMapper mapper;
	
	@Override
	public List<ReplyDTO> getList(Long rvno, PageInfoDTO pageInfo) {
		
		return mapper.getList(rvno,pageInfo);
	}

	@Override
	public int register(ReplyDTO replyDTO) {
		
		return mapper.register(replyDTO);
	}
	
	
	
}
