package com.skilldistillery.morebetterapp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;

@Controller
public class UserController {
	
	@Autowired
	private ArticleDAO articleDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path="userLogin.do")
	public String userLoginPage() {
		return "userlogin";
	}
	
	@RequestMapping(path="userCreateProfile.do")
	public String userCreatePage() {
		return "userCreateProfile";
	}
	
	@RequestMapping(path="updateProfile.do")
	public String userProfileDisplay() {
		return "userProfileDetail";
	}
	
	

	
	

}
