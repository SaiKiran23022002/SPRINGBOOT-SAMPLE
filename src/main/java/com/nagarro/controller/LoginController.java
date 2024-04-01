package com.nagarro.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nagarro.dao.LoginDAO;

@Controller

public final class LoginController {

	@Autowired
	LoginDAO loginDao;

	@PostMapping("/Login")
	public ModelAndView checkUser(HttpServletRequest request, HttpServletResponse response, Model model) {

		ModelAndView mv = new ModelAndView();

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");

		if (userId.length() == 0 && password.length() == 0) {
			model.addAttribute("error", "Login Details can't be Empty");
			mv.setViewName("Login");
		} else if (loginDao.checkUser(userId, password)) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", userId);
			mv.setViewName("redirect:/display");
		} else {
			model.addAttribute("error", "User Id and Password Doesnot Match");
			mv.setViewName("Login");
		}
		return mv;
	}

}
