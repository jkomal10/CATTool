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

	System.out.println("change 2");
		System.out.println("Controller by priyanjali");
		return "Hello word";
	}
	
	@RequestMapping("/application")
	public String getapplication()
	{
		
		System.out.println("hi ");
		return "Hello everyone";
	}

	@GetMapping("/app")
			public String grt()
			{
		System.out.println("Controller by priyanjali");
		return "hjkk";
			}
}
