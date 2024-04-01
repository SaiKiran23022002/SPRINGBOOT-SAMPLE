package com.nagarro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AddBookController {
	
	@PostMapping("/addBook")
	public ModelAndView addBooks(HttpServletRequest request, HttpServletResponse response, Model model) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addBook");
		return mv;
	}
}
