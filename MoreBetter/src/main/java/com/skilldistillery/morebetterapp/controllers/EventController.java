package com.skilldistillery.morebetterapp.controllers;

import java.beans.PropertyEditorSupport;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

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
import com.skilldistillery.morebetterapp.entities.Category;
import com.skilldistillery.morebetterapp.entities.Event;

@Controller
public class EventController {

	@Autowired
	private ArticleDAO articleDao;
	@Autowired
	private CategoryDAO categoryDao;
	@Autowired
	private EventDAO eventDao;
	@Autowired
	private UserDAO userDao;
	
//	@RequestMapping(path= )
//	public String eventPage() {
//		return "";
//	}
	//------------------------------------------FIND EVENT-----------------------------------------------------//
	
	@RequestMapping(path = "getEvent.do") // takes id inputed by user/looks up event
	public String findEvent(Integer id, Model model) {
		Event event = eventDao.findEventById(id);
			model.addAttribute("event", event);

			return "FIXME"; //JSP for Event found
	}
	
	//------------------------------------------FIND EVENT-----------------------------------------------------//
	
	
	
	
	//------------------------------------------ADD EVENT-----------------------------------------------------//
	
	@RequestMapping(path = "addEvent.do")
	public ModelAndView goToAddEventPage() throws SQLException { // addEvent view page for mentor to input data
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("FIXME");     //JSP for adding an event view

		return mv;

	}

	@RequestMapping(path = "addEvent.do", method = RequestMethod.POST)
	public ModelAndView addEvent(Event event) { // takes user input/process it/posts new trip
		ModelAndView mv = new ModelAndView();

		Event newEvent = eventDao.createEvent(event);

			mv.addObject("event", newEvent);
			mv.setViewName("FIXME");    // jsp for mentor to add event
			return mv;
		}

	
	//------------------------------------------ADD EVENT-----------------------------------------------------//
	
	
	//------------------------------------------UPDATE EVENT-----------------------------------------------------//
	
	
	@RequestMapping(path = "updateEvent.do", method = RequestMethod.POST)
	public ModelAndView updateEvent(int id, Event event, @RequestParam int updatedCategoryId) {
		ModelAndView mv = new ModelAndView();
			mv.addObject("event", eventDao.updateEvent(id, event, updatedCategoryId));
			mv.addObject("category", event.getCategory());
			mv.addObject("mentor", event.getEventMentor());
			mv.setViewName("eventDisplayPage");   //
			return mv;
	}
	
	
	//------------------------------------------UPDATE EVENT-----------------------------------------------------//
	
	
	//------------------------------------------DELETE EVENT-----------------------------------------------------//
	
//	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.GET)
//	public ModelAndView deleteEventViewPage() throws SQLException { // delete event view page for mentor
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("FIXME");     //JSP view for mentor to delete event
//
//		return mv;
//
//	}
	
	@RequestMapping(path = "deleteEvent.do", method = RequestMethod.POST)
	public ModelAndView deleteEvent(int id) throws SQLException { 
		Event event = eventDao.findEventById(id);
		ModelAndView mv = new ModelAndView();
		boolean result = eventDao.deleteEventById(id);
		mv.addObject("eventsByCategory", categoryDao.displayAllEventsByCategory(event.getCategory().getId()));
		mv.addObject("category", categoryDao.findCategoryById(id));
		mv.addObject("result", result);
		mv.setViewName("eventPage"); //JSP page to submit event delete
		return mv;

	}
	
	//------------------------------------------DELETE EVENT-----------------------------------------------------//
	
	//---------------------------------------DISPLAY INDIVIDUAL EVENTS--------------------------------------------------//
	
	
		@RequestMapping(path= "individualEvent.do")
		public String displayListEvents(Integer id, Model model) {
			Event event = eventDao.findEventById(id);
			Category category = event.getCategory();
			model.addAttribute("event", event);
			model.addAttribute("category", category);
			model.addAttribute("mentor", event.getEventMentor());
			return "eventDisplayPage";
		}
	//---------------------------------------DATE BINDER--------------------------------------------------//
	
		
		@InitBinder
		public void initBinder(WebDataBinder webDataBinder) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:MM");
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
			dateFormat.setLenient(true);
//			dateTimeFormat.setLenient(true);
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
