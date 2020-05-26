package com.skilldistillery.morebetterapp.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
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
	
	
	
	@RequestMapping(path = "userProfile.do", method = RequestMethod.GET)
	public String displayProfile(User user, Model model, HttpSession session) {
		model.addAttribute("user", session.getAttribute("loggedInUser"));
		return "userProfileDetail";
		
	}


//	@RequestMapping(path = "updateProfile.do", method = RequestMethod.POST)
//	public String userProfileDisplay(User user, Integer id, Model model, HttpSession session) {
//		User updatedUser = (User)(session.getAttribute("loggedInUser"));
//		User updated = userDao.updateUser(id, updatedUser);
////		model.addAttribute("user", session.getAttribute("loggedInUser")); 
//		model.addAttribute("updatedUser", updated);
//		 //passing in the user currently logged in
//		return "index";
//	}
	
	
	//________________________JEFF WROTE THIS_____________________//
	
	@RequestMapping(path="updateProfile.do", method = RequestMethod.POST)
	public String updateProfile(Model model, User user, HttpSession session) {
		User updateUser = userDao.updateUser(user);
		session.setAttribute("loggedInUser", updateUser);
		model.addAttribute("user", updateUser);
		return "userCreateProfile";
	}
	
	//_________________________________________________________________//
	
	@RequestMapping(path = "userCreateProfile.do", method = RequestMethod.GET)
	public String userCreatePage() {
		return "userCreateProfile";
	}

//	@RequestMapping(path = "addUser.do", method = RequestMethod.POST)
//	public ModelAndView addUser(User user) { 
//		User newUser = userDao.createUser(user);
//		ModelAndView mv = new ModelAndView();
//
//			mv.addObject("newUser", newUser);
//			mv.setViewName("userlogin");     //jsp name for displaying new user
//			return mv;
//		}
	
	//________________________JEFF WROTE THIS_____________________//
	@RequestMapping(path = "addUser.do", method = RequestMethod.POST)
	public String addUser(User user, Model model, HttpSession session) {
		User newUser = userDao.createUser(user);
		model.addAttribute("user", newUser);
		session.setAttribute("loggedInUser", newUser);
		return "welcome";
	}
	//_______________________________________________________________//
	
}




















