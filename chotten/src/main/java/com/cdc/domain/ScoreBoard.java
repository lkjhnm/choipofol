package com.cdc.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScoreBoard {
	
	private int sno;
	private int score;
	private String content;
	private String writer;
	private Date regdate;
	private int mno;
	
}
