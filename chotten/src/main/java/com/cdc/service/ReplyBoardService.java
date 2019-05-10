package com.cdc.service;

import java.util.List;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReplyDTO;

public interface ReplyBoardService {
	
	public List<ReplyDTO> getList(Long rvno,PageInfoDTO pageInfo);
	public int register(ReplyDTO replyDTO);
}
