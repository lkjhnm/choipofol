package com.cdc.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.ReviewDTO;
import com.cdc.service.ReviewBoardService;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
@Data
public class ReviewController {
	
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardService service;

	@GetMapping("/list")
	public String reviewList(PageInfoDTO pageInfo, @RequestParam("reviewlike") boolean reviewlike,Model model) {
		log.info(pageInfo);
		log.info(reviewlike);
		
		model.addAttribute("ReviewList", service.getList(pageInfo, reviewlike));
		
		return "/review/movieReview";
	}
	
	@GetMapping("/register")
	public String reviewRegister() {
		return "/review/register";
	}
	
	@PostMapping("/register")
	public String reviewRegister(ReviewDTO reviewDTO) {	
		return "redirect:/review/list";
	}
}
