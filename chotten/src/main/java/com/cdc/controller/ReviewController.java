package com.cdc.controller;

import org.springframework.beans.factory.annotation.Autowired;	
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ReviewVO;
import com.cdc.service.ReviewBoardService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/review/*")
@Log4j
public class ReviewController {
	
	@Setter(onMethod_= {@Autowired})
	private ReviewBoardService service;

	@GetMapping("/list")
	public String reviewList(PageInfoDTO pageInfo, @RequestParam("reviewlike") boolean reviewlike, Model model) {
		log.info(pageInfo);
		log.info(reviewlike);
		
		model.addAttribute("ReviewList", service.getList(pageInfo, reviewlike));
		int total = service.count(pageInfo.getMno(),reviewlike);
		log.info(total);
		model.addAttribute("pageData",new PageVO(pageInfo,total));
		model.addAttribute("reviewlike",reviewlike);
		
		return "/review/reviewList";
	}
	
	@GetMapping("/get")
	public String reviewGet(@RequestParam("rvno") Long rvno,@RequestParam("page") Long page,Model model) {
		
		model.addAttribute("review",service.getReview(rvno));
		model.addAttribute("page",page);
		
		return "/review/reviewPage";
	}
	
	@GetMapping("/modify")
	public String reviewModify(@RequestParam("rvno") Long rvno, @RequestParam("page") Long page, Model model) {
		
		model.addAttribute("review",service.getReview(rvno));
		model.addAttribute("page",page);
	
		return "/review/reviewModify";
	}
	
	@PostMapping("/modify")
	public String reviewModify(ReviewVO review, @RequestParam("page") Long page) {
		
		log.info(review);
		
		service.modify(review);
		
		return "redirect:/review/get?rvno="+review.getRvno()+"&page="+page; 
	}
	
	@GetMapping("/register")
	public String reviewRegister(PageInfoDTO pageInfo, @RequestParam("reviewlike") boolean reviewlike, Model model) {
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewLike",reviewlike);
		
		return "/review/reviewRegister";
	}
	
	@PostMapping("/register")
	public String reviewRegister(ReviewVO review) {
		service.register(review);
		long mno = review.getMno();
		boolean reviewlike = review.getReviewlike();
		
		return "redirect:/review/list?mno="+mno+"&reviewlike="+reviewlike;
	}
	
	@GetMapping("/delete")
	public String reviewDelete(@RequestParam("rvno") Long rvno, PageInfoDTO pageInfo, @RequestParam("reviewlike") boolean reviewlike) {
		service.delete(rvno);
		long mno = pageInfo.getMno();
		long page = pageInfo.getPage();
		
		return "redirect:/review/list?mno="+mno+"&reviewlike="+reviewlike+"&page="+page;
	}
}
