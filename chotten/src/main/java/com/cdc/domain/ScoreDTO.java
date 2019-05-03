package com.cdc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScoreDTO {
	
	private Long sno;
	private Long score;
	private String content;
	private String writer;
	private Date regdate;
	private Long mno;
	private Long hits;
	
}
