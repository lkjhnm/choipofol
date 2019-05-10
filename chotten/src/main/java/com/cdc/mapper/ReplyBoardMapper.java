package com.cdc.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReplyDTO;

public interface ReplyBoardMapper {
	
	public List<ReplyDTO> getList(@Param("rvno") Long rvno,@Param("pageInfo") PageInfoDTO page);
	public int register(ReplyDTO replyDTO);
}
