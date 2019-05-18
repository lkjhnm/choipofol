package com.cdc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private Long rno;
	private String content;
	private String writer;
	private String regDate;
	private Long rvno;
	
}
