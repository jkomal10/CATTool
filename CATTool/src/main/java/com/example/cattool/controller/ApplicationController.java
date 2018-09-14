package com.example.cattool.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ApplicationController {
	
	@RequestMapping("/user")
	public String getUser()
	{
		return "Hello word";
	}
	
	@RequestMapping("/application")
	public String getapplication()
	{
		
		System.out.println("hi ");
		return "Hello everyone";
	}

}
