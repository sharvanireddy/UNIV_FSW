package com.fsw.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fsw.dao.RegistrationDao;

@Controller
public class LoginController {
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam("userName") String userName, @RequestParam("password") String password,
			HttpServletRequest request) {
		ModelAndView mav = null;
		HttpSession session = null;
		if (userName.equals("admin") && password.equals("admin")) {
			mav = new ModelAndView();
			mav.setViewName("adminHome");
		} else if (registrationDao.validateUser(userName, password) != 0) {
			session = request.getSession();
			mav = new ModelAndView();
			mav.setViewName("userHome");
			session.setAttribute("authorizedUserName", userName);
			session.setAttribute("authorizedPassword", password);
		} else {
			mav = new ModelAndView();
			mav.setViewName("index");
			mav.addObject("error", "Invalid Username and Password");
		}
		return mav;
	}

	@Resource
	private RegistrationDao registrationDao;
}
