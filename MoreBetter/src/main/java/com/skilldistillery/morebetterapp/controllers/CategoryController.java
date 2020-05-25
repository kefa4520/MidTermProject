package com.skilldistillery.morebetterapp.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
import com.skilldistillery.morebetterapp.entities.Article;
import com.skilldistillery.morebetterapp.entities.Category;

@Controller
public class CategoryController {

	@Autowired
	private ArticleDAO articleDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private UserDAO userDao;
	

	//------------------------------------------FIND CATEGORY BY ID-----------------------------------------------------//
	
	
	@RequestMapping(path = "getCategory.do") // takes id inputed by user/looks up category
	public String findCategoryById(Integer id, Model model) {
		Category category = categoryDao.findCategoryById(id);
			model.addAttribute("category", category);

			return "FIXME"; //JSP for category found by id
		}
	

	
	//------------------------------------------FIND BY ID CATEGORY-----------------------------------------------------//
	
	
	
	
	
//	
//	//------------------------------------------FIND CATEGORY BY NAME-----------------------------------------------------//
//	
//	
//	@RequestMapping(path = "getCategory.do") // takes id inputed by user/looks up category
//	public String findCategoryByName(String name, Model model) {
//		Category category = categoryDao.findCategoryByName(name);
//			model.addAttribute("category", category);
//
//			return "FIXME"; //JSP for category found by name
//		} 
//	
//	
//	
//	//------------------------------------------FIND CATEGORY BY NAME-----------------------------------------------------//
//	
//	
//	//--------------------------------------- DISPLAY EVENTS BY CATEGORY--------------------------------------------------//
//	
//	
//	
//	@RequestMapping(path = "getCategory.do") // takes id inputed by user/looks up category
//	public String findEventByCatId(Integer id, Model model) {
//		
//			model.addAttribute("eventsByCategory", categoryDao.displayAllEventsByCategory(id));
//
//			return "FIXME"; //JSP for list of events found
//		
//	}
//	
////	//--------------------------------------- DISPLAY EVENTS BY CATEGORY--------------------------------------------------//
////	//--------------------------------------- DISPLAY ARTICLE BY CATEGORY--------------------------------------------------//
//	
//	
//	
//	@RequestMapping(path = "getCategory.do") // takes id inputed by user/looks up category
//	public String displayAllArticlesByCategory(Integer id, Model model) {
//		
//		model.addAttribute("articlesByCategory", categoryDao.displayAllArticlesByCategory(id));
//		
//		return "FIXME"; //JSP for list of events found
//		
//	}
//	
////	//--------------------------------------- DISPLAY ARTICLE BY CATEGORY--------------------------------------------------//
//	
}
