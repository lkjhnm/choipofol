package com.cdc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdc.service.MovieBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/summary/*")
@Log4j
public class SummaryController {
	
	@Setter(onMethod_= {@Autowired})
	private MovieBoardService service;

	@GetMapping("/movieInfo")
	public String getList(@RequestParam("mno") Long mno, Model model) {	
		
		log.info(mno);
		
		log.info(model.addAttribute("movie", service.getMovie(mno)));
		
		return "movieInfo";
	}
	
	@PostMapping("/register")
	public String register() {
		return "redirect:/summary/list";
	}
	
}
