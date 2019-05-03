package com.cdc.domain;

import lombok.Data;

@Data
public class PageVO {
	
	private Long realEnd;
	private boolean noneMoveStart, noneMoveEnd;
	private PageInfoDTO pageInfo;
	private int total;
	
	public PageVO(PageInfoDTO pageInfo, int total) {
		
		this.pageInfo = pageInfo;
		this.total = total;

		this.realEnd  = (long)(Math.ceil((total*1.0)/pageInfo.getAmount()));
		
		this.noneMoveStart = realEnd < 6;
		this.noneMoveEnd = pageInfo.getPage() > (realEnd-2);
	}
}
