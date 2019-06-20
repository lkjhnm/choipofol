package com.cdc.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.file.Files;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.bytecode.ByteArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;

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
	
	@PostMapping("/uploadTrailer")
	public void uploadTrailer(MultipartFile trailer) {
		
		String uploadFolder = "D:\\upload";
		
		File saveTrailer = new File(uploadFolder,trailer.getOriginalFilename());
		
		try {
			trailer.transferTo(saveTrailer);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}	
	}
	
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> sendTrailer(WebRequest req) {
		
		log.info(req.getHeader("Range"));
		
		File file = new File("D:\\upload\\preview.mp4");
		
		ResponseEntity<byte[]> result = null;
		
		try {
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file),header,HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
