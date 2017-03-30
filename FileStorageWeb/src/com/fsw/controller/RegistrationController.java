package com.fsw.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fsw.dao.RegistrationDao;
import com.fsw.vo.RegistrationVo;

@Controller
public class RegistrationController {
	@RequestMapping(value = "/register.do", method = RequestMethod.POST)
	public String register(@ModelAttribute RegistrationVo registrationVo, ModelMap model) {
		int count = registrationDao.registerUser(registrationVo);
		if (count != 0) {
			model.addAttribute("success", registrationVo.getUserName() + " your registration was successful");
		} else {
			model.addAttribute("error", "Your registration is not successful");
		}
		return "index";
	}

	@RequestMapping(value = "/getUsers.do", method = RequestMethod.GET)
	public String getUsers(ModelMap model) {
		model.addAttribute("users", registrationDao.getUsers());
		model.addAttribute("vu", "display");
		return "adminHome";
	}

	@RequestMapping(value = "/updateUser.do", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute RegistrationVo registrationVo, ModelMap model) {
		int count = registrationDao.updateUser(registrationVo);
		if (count != 0) {
			model.addAttribute("success", "User details has been updated");
		} else {
			model.addAttribute("error", "User details aren't updated");
		}
		return "userHome";
	}

	@Resource
	private RegistrationDao registrationDao;
}
