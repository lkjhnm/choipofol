package com.cdc.domain;

import java.util.List;

import lombok.Data;

@Data
public class MemberDTO {
	
	private String userid;
	private String userpw;
	private String userName;
	private String userEmail;
	private String regDate;
	
	private List<MovieTasteDTO> tasteList;
	private List<AuthVO> authList;
}
