package com.skilldistillery.morebetterapp.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
import com.skilldistillery.morebetterapp.entities.Category;

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
	
	@RequestMapping(path= {"/", "home.do"})
	public String home() {
		return "index";
	}

	
	@RequestMapping(path= "categoryPage.do")
	public ModelAndView genericCategoryPage(Integer id) {
		ModelAndView mv = new ModelAndView();
		Category category = categoryDao.findCategoryById(id);
		mv.addObject("category", category);
		mv.setViewName("categoryDisplayPage");
		return mv;
	}
	
	
	
	
}
