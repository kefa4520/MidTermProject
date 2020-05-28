package com.skilldistillery.morebetterapp.controllers;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
import com.skilldistillery.morebetterapp.entities.Event;
import com.skilldistillery.morebetterapp.entities.Role;
import com.skilldistillery.morebetterapp.entities.User;

@Controller
public class HomeController {

	@Autowired
	private ArticleDAO articleDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home() {
		return "index";
	}

	@RequestMapping(path = "addUserToEvent.do", params = { "uId", "eId" }, method = RequestMethod.POST)
	public ModelAndView addUserToEvent(@RequestParam Integer uId, Integer eId, HttpSession session)
			throws SQLException {
		ModelAndView mv = new ModelAndView();
		List<Event> events = userDao.addUserToEvent(uId, eId);
		mv.addObject("eventsToAttend", events);

		mv.setViewName("userEventsList");

		return mv;

	}

	@RequestMapping(path = "userEvents.do", method = RequestMethod.GET)
	public ModelAndView userEvent(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		User updatedUser = (User) (session.getAttribute("loggedInUser"));
		User refreshedUser = userDao.findUserById(updatedUser.getId());

		session.setAttribute("loggedInUser", refreshedUser);
		mv.addObject("eventsToAttend", refreshedUser.getEventsAttended());

		mv.setViewName("userEventsList");
		return mv;
	}

	@RequestMapping(path = "removeFromEvent.do", params = { "uId", "eId" }, method = RequestMethod.POST)
	// id=1
	public ModelAndView removeUserFromEvent(@RequestParam Integer uId, @RequestParam Integer eId, HttpSession session)
			throws SQLException {
		ModelAndView mv = new ModelAndView();
		List<Event> events = userDao.deleteUserFromEvent(uId, eId);

		mv.setViewName("redirect:userEvents.do");

		return mv;

	}

	// ______________________________for Admin______________________________//
	
	@RequestMapping(path = "userStatus.do", method = RequestMethod.GET)
	public ModelAndView userStatus() {
		ModelAndView mv = new ModelAndView();
		mv.addObject("users", userDao.findAll());
		mv.setViewName("adminBoard");
		return mv;
	}
	
	

	@RequestMapping(path = "deactivateUser.do", method = RequestMethod.POST)
	public String disableUser(HttpSession session, Integer uId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.MENTOR)) {
			userDao.disableUser(uId);
			model.addAttribute("users", userDao.findAll());
			return "redirect:userStatus.do";
		} else {
			return "index";
		}
	}

	@RequestMapping(path = "activateUser.do", method = RequestMethod.POST)
	public String activateUser(HttpSession session, Integer uId, Model model) {
		User currentUser = (User) session.getAttribute("loggedInUser");
		if (currentUser.getRole().equals(Role.MENTOR)) {
			userDao.enableUser(uId);
			model.addAttribute("users", userDao.findAll());
			return "redirect:userStatus.do";
		} else {
			return "index";
		}
	}

}
