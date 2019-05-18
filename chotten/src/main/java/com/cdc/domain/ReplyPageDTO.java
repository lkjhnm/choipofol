package com.cdc.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;


@AllArgsConstructor
@Data
public class ReplyPageDTO {
	
	private List<ReplyDTO> list;
	private int replyCnt;
	
}
