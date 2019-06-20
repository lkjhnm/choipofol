package com.cdc.domain;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

@Data
public class ReviewImgDTOList {
	
	private List<ReviewImgDTO> imgList;
	
	public ReviewImgDTOList() {
		imgList = new ArrayList<ReviewImgDTO>();
	}
}
