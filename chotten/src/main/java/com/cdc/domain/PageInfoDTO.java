package com.cdc.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Data;

@Data
public class PageInfoDTO {

	private Long mno;
	private Long page;
	private Long amount;
	private boolean latest,like,dislike;
	
	public PageInfoDTO() {
		this(1l,10l);
	}
	
	public PageInfoDTO(Long page, Long amount) {
		this.page = page;
		this.amount = amount;
	}
	
	public String getListLink() {
		
		UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
				.queryParam("mno", this.mno)
				.queryParam("page", this.page)
				.queryParam("amount", this.amount)
				.queryParam("latest", this.latest)
				.queryParam("like",this.like)
				.queryParam("dislike",this.dislike);
		
		return builder.toUriString();
	}
}
