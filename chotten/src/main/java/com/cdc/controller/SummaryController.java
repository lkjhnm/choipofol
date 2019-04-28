package com.cdc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/summary/*")
@Log4j
public class SummaryController {

	@GetMapping("/register")
	public String register() {
		
		return "summary";
	}
}
