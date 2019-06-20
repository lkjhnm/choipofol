package com.cdc.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

import com.cdc.domain.PageInfoDTO;
import com.cdc.domain.PageVO;
import com.cdc.domain.ReviewImgDTO;
import com.cdc.domain.ReviewImgDTOList;
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
	public String reviewModify(ReviewVO review, @RequestParam("page") Long page, ReviewImgDTOList imgList) {
		
		service.modify(review,imgList.getImgList());
		
		return "redirect:/review/get?rvno="+review.getRvno()+"&page="+page; 
	}
	
	@GetMapping("/register")
	public String reviewRegister(PageInfoDTO pageInfo, @RequestParam("reviewlike") boolean reviewlike, Model model) {
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewLike",reviewlike);
		
		return "/review/reviewRegister";
	}
	
	@PostMapping("/register")
	public String reviewRegister(ReviewVO review, ReviewImgDTOList imgList) {
		
		service.register(review,imgList.getImgList());
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
	
	@RequestMapping(value ="/uploadImg", method= {RequestMethod.POST},
					produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<String> imageUpload(MultipartFile upload, HttpServletRequest req) {	//업로드시 input hidden으로 uuid 값을 넘겨줘야함
		
		String jsonStr = service.upload(upload);
		
		if(jsonStr == null) {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<String>(jsonStr, HttpStatus.OK);
	}
	
	
	@RequestMapping(value="/showImg", method=RequestMethod.GET)
	public ResponseEntity<byte[]> showImg(String fileName,String uploadPath){
		
		File file = new File(uploadPath,fileName);
		
		ResponseEntity<byte[]> result = null;
		
		HttpHeaders header = new HttpHeaders();
		try {
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
