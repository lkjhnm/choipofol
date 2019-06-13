package com.cdc.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ScoreDTO;
import com.cdc.service.ScoreBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/oneline/*")
@Log4j
public class OneLineController {	//한줄평 페이지 컨트롤러 
	
	
	@Setter(onMethod_= {@Autowired})
	private ScoreBoardService scoreService;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String commentRegister(ScoreDTO scoreDTO, PageInfoDTO pageInfo) {
		log.info(scoreDTO);
		scoreService.register(scoreDTO);
		
		return "redirect:/oneline/commentView" + pageInfo.getListLink();
	}
	
	
	@GetMapping("/commentView")
	public String commentList(PageInfoDTO pageInfo,Model model) { 
		
		log.info(pageInfo);	
		model.addAttribute("ScoreList",scoreService.getListWithPaging(pageInfo));
		int total  = scoreService.getTableCount(pageInfo.getMno());
		
		model.addAttribute("pageData",new PageVO(pageInfo, total));		
		return "oneLineComment";
	}
	
	
	@RequestMapping(method= {RequestMethod.PUT},
					value= "/{sno}",
					consumes="application/json; charset=utf-8")
	public ResponseEntity<String> hitsUp(@PathVariable("sno") Long sno, @RequestBody PageInfoDTO pageInfo){
		
		log.info("페이지 인포"+pageInfo);
		log.info(sno);
		
		return scoreService.updateHits(sno) == 1
					? new ResponseEntity<>("success",HttpStatus.OK)
					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
