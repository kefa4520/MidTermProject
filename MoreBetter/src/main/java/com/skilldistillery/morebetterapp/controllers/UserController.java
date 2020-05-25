package com.skilldistillery.morebetterapp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
import com.skilldistillery.morebetterapp.entities.Article;
import com.skilldistillery.morebetterapp.entities.User;

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

	@RequestMapping(path = "userLogin.do", method = RequestMethod.GET)
	public String userLoginPage() {
		return "userlogin";
	}

	//_______________________________user log in__________________________________
	@RequestMapping(path = "userLogin.do", method = RequestMethod.POST)
	public String userLoginPage(String username, String password, Model model, HttpSession session) {
		User currentUser = userDao.findByUserNameAndPassword(username, password);
		if (currentUser == null) {
			return "userCreateProfile";
		} else {
			session.setAttribute("loggedInUser", currentUser);
			model.addAttribute("user", currentUser);
			return "userProfileDetail";
		}
	}
	
	//_______________________________user logout__________________________________
	@RequestMapping(path = "userLogout.do", method = RequestMethod.GET)
	public String userLogout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		
		return "index";
	}
	


	@RequestMapping(path = "updateProfile.do")
	public String userProfileDisplay() {
		return "userProfileDetail";
	}
	
	
	@RequestMapping(path = "userCreateProfile.do", method = RequestMethod.GET)
	public String userCreatePage() {
		return "userCreateProfile";
		
	}

	@RequestMapping(path = "addUser.do", method = RequestMethod.POST)
	public ModelAndView addUser(User user) { 
		ModelAndView mv = new ModelAndView();

		User newUser = userDao.createUser(user);
			mv.addObject("newUser", newUser);
			mv.setViewName("userlogin");     //jsp name for displaying new user
			return mv;
		}
	
	
}
