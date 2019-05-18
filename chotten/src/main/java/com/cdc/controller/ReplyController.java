package com.cdc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReplyDTO;
import com.cdc.domain.ReplyPageDTO;
import com.cdc.service.ReplyBoardService;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/*")
@Data
@Log4j
public class ReplyController {
	
	@Setter(onMethod_= {@Autowired})
	private ReplyBoardService service;
	
	
	@RequestMapping(value="/list/{rvno}/{page}",
					method= {RequestMethod.GET},
					produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ReplyPageDTO> replyGet(@PathVariable("rvno") Long rvno, @PathVariable("page") Long page){
		
		PageInfoDTO pageInfo = new PageInfoDTO(page,5l);
		
		return new ResponseEntity<ReplyPageDTO>(service.getListWithPaging(rvno, pageInfo),HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/register",
					method= {RequestMethod.POST},
					consumes= {MediaType.APPLICATION_JSON_UTF8_VALUE},
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> replyRegister(@RequestBody ReplyDTO replyDTO){
		
		log.info(replyDTO);
		int insert = service.register(replyDTO);
		log.info(insert);
		
		return insert == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
}
