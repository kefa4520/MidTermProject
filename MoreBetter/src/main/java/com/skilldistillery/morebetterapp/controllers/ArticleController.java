package com.skilldistillery.morebetterapp.controllers;

import java.beans.PropertyEditorSupport;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.morebetterapp.data.ArticleDAO;
import com.skilldistillery.morebetterapp.data.CategoryDAO;
import com.skilldistillery.morebetterapp.data.EventDAO;
import com.skilldistillery.morebetterapp.data.UserDAO;
import com.skilldistillery.morebetterapp.entities.Article;
import com.skilldistillery.morebetterapp.entities.Category;
import com.skilldistillery.morebetterapp.entities.User;

@Controller
public class ArticleController {
	
	@Autowired
	private ArticleDAO articleDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private UserDAO userDao;
	


	//------------------------------------------FIND ARTICLE-----------------------------------------------------//
	
	@RequestMapping(path = "getArticle.do") 
	public String findArticle(Integer id, Model model) {
		Article article = articleDao.findArticleById(id);
			model.addAttribute("article", article);
			return "FIXME";  // stretch goal

	}
	
	//------------------------------------------FIND ARTICLE-----------------------------------------------------//
	
	
	//------------------------------------------ADD ARTICLE-----------------------------------------------------//
	@RequestMapping(path = "addArticle.do")
	public ModelAndView goToAddArticlePage() throws SQLException { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("articlePage");       

		return mv;
	}
	
	@RequestMapping(path = "addArticle.do", method = RequestMethod.POST)
	public ModelAndView addArticle(Article article, @RequestParam int categoryId, HttpSession session) { 
		ModelAndView mv = new ModelAndView();

		User updatedUser = (User) (session.getAttribute("loggedInUser"));
		 	mv.addObject("article", articleDao.createArticle(article, categoryId, updatedUser));	 	
		 	
			User refreshedUser = userDao.findUserById(updatedUser.getId());
		 	
		 	mv.addObject("category", article.getCategory());
		 	mv.addObject("author", refreshedUser);

			mv.setViewName("redirect:articleDisplay.do"); 
			return mv;
		}
	
	
	
	@RequestMapping(path = "articleDisplay.do", method = RequestMethod.GET)
    public ModelAndView articleDisplay(HttpSession session) {
        ModelAndView mv = new ModelAndView();
        User updatedUser = (User) (session.getAttribute("loggedInUser"));
        User refreshedUser = userDao.findUserById(updatedUser.getId());
        session.setAttribute("loggedInUser", refreshedUser);
        mv.addObject("articles", refreshedUser.getWrittenArticles());
        mv.setViewName("categoryDisplayPage");
        return mv; 
    }
	

	//------------------------------------------UPDATE ARTICLE-----------------------------------------------------//
	
	
	//------------------------------------------UPDATE ARTICLE-----------------------------------------------------//
	
	
	@RequestMapping(path = "updateArticle.do", method = RequestMethod.POST)
	public ModelAndView updateArticle(int id, Article article) throws SQLException {  //requestParam deleted, might have to put it back
		ModelAndView mv = new ModelAndView();
			mv.addObject("article", articleDao.updateArticle(id, article));
			mv.setViewName("FIXME");    //JSP for updating article
			return mv;
	}
	
	//------------------------------------------UPDATE ARTICLE-----------------------------------------------------//
	
	//------------------------------------------DELETE ARTICLE-----------------------------------------------------//
	

	
	@RequestMapping(path = "deleteArticle.do", method = RequestMethod.POST)
	public ModelAndView deleteArticle(int id) throws SQLException { 

		ModelAndView mv = new ModelAndView();
		articleDao.deleteArticleById(id);

		mv.setViewName("redirect:articleDisplay.do"); 
		return mv;

	}
	
	//------------------------------------------DELETE ARTICLE-----------------------------------------------------//
	
	//---------------------------------------DISPLAY ALL ARTICLES--------------------------------------------------//
	@RequestMapping(path= "categoryPage.do")
	public ModelAndView genericCategoryPage(Integer id) {
		
		ModelAndView mv = new ModelAndView();
		List<Article> articles = categoryDao.displayAllArticlesByCategory(id);
		Category category = categoryDao.findCategoryById(id);
		mv.addObject("category", category);
		mv.addObject("articles", articles);
		mv.setViewName("categoryDisplayPage");
		return mv;
	}
	//---------------------------------------DISPLAY ALL ARTICLES--------------------------------------------------//
	
	
	//---------------------------------------DATE BINDER--------------------------------------------------//
	
	
			@InitBinder
			public void initBinder(WebDataBinder webDataBinder) {
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
				SimpleDateFormat timeFormat = new SimpleDateFormat("HH:MM");
				SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
				dateFormat.setLenient(true);
//				dateTimeFormat.setLenient(true);
				webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
				webDataBinder.registerCustomEditor(LocalDateTime.class, new CustomDateEditor(dateTimeFormat, true));
				webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) throws IllegalArgumentException {
						setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
					}
					@Override
					public String getAsText() throws IllegalArgumentException {
						return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
					}
				});
				webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) throws IllegalArgumentException {
						setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:MM")));
					}
					@Override
					public String getAsText() throws IllegalArgumentException {
						return DateTimeFormatter.ofPattern("HH:MM").format((LocalDate) getValue());
					}
				});
				webDataBinder.registerCustomEditor(LocalDateTime.class, new PropertyEditorSupport() {
					@Override
					public void setAsText(String text) throws IllegalArgumentException {
						setValue(LocalDateTime.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm")));
					}
					@Override
					public String getAsText() throws IllegalArgumentException {
						return DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm").format((LocalDateTime) getValue());
					}
				});
		}
			
}
