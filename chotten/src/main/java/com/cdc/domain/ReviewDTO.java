package com.cdc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	
	private Long rvno;
	private Long mno;
	private	String title;
	private String content;
	private String writer;
	private Date regDate;
	private Date updateDate;
	private Long hits;
	private boolean reviewlike;
}
