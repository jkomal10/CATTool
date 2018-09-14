package com.example.cattool.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@ResponseBody
public class ApplicationController {
	
	@RequestMapping("/user")
	public String getUser()
	{

	System.out.printlln("change 2");
		System.out.println("Controller by priyanjali");
		return "Hello word";
	}

	@GetMapping("/app")
			public String grt()
			{
		return "hjkk";
			}
}
