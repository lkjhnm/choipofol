package com.cdc.service;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReplyDTO;
import com.cdc.domain.ReplyPageDTO;

public interface ReplyBoardService {
	
	public ReplyPageDTO getListWithPaging(Long rvno,PageInfoDTO pageInfo);
	public int register(ReplyDTO replyDTO);
}
