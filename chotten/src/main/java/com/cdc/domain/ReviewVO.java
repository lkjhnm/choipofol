package com.cdc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	
	private Long rvno;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private Long mno;
	private Long hits;
	private Boolean reviewlike;
}
