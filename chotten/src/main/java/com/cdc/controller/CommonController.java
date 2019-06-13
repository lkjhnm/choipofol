package com.cdc.controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cdc.domain.MemberDTO;
import com.cdc.service.CommonService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {
	
	@Setter(onMethod_= {@Autowired})
	private CommonService service;
	

	@GetMapping("/signUp")
	public String signUp() {
		return "signUp";
	}
	
	@RequestMapping(value="/signup/check/{userid}",
					method= {RequestMethod.GET},
					produces= {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<Boolean> check(@PathVariable("userid") String userid){
		
		boolean result = service.check(userid);
		
		return  new ResponseEntity<>(result,HttpStatus.OK);
	}
	
	@RequestMapping(value="/loginFail",
					method= {RequestMethod.GET})
	public ResponseEntity<String> delLoginFlag(HttpServletRequest req){
		
		HttpSession session = req.getSession();
		session.removeAttribute("loginFail");
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	
	@PostMapping("/signup")
	public String signup(MemberDTO member, @RequestParam(value = "taste", required=false)ArrayList<String> checkList ) {
		
		log.info(member);
		
		service.signup(member, checkList);
		
		return "movieInfo";
	}
}
