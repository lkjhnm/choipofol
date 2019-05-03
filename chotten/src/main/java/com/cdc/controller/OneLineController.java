package com.cdc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	
	@GetMapping("/commentView")
	public String commentListByLatest(PageInfoDTO pageInfo,Model model) { 
					
		log.info(pageInfo);	
		model.addAttribute("ScoreList",scoreService.getListWithPaging(pageInfo));
		int total  = scoreService.getTableCount(pageInfo.getMno());

		model.addAttribute("pageData",new PageVO(pageInfo, total));		
		return "oneLineComment";
	}
	
	
	@PostMapping("/register")
	public String commentRegister(ScoreDTO scoreDTO, PageInfoDTO pageInfo) {
		log.info(scoreDTO);
		scoreService.register(scoreDTO);
		
		return "redirect:/oneline/commentView" + pageInfo.getListLink();
	}
	
	
}
