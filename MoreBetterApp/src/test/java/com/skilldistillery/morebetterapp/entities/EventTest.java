package com.skilldistillery.morebetterapp.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

class EventTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Event event;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("MoreBetterPU");

	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		event = em.find(Event.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		event = null;
	}

	@Test
	@DisplayName("testing that event mappings work")
	void test1() {

		assertNotNull(event);
		assertEquals("Social Media Online Summit 2020", event.getTitle());
		assertEquals("Social media marketing changes FAST. And that is why every year, since 2018, thousands of entrepreneurs and marketers sign up for Social Media Online Summit to lear the latest, the hottest, and what is actually working RIGHT NOW in social media marketing.", event.getDescription());

	}
	
	// SELECT category.name FROM category JOIN event ON category.id = event.category_id WHERE event.id = 1;
	@Test
	@DisplayName("testing that event to category works")
	void test2() {
		assertNotNull(event);
		assertEquals("Finance", event.getCategory().getName());

	}
	@Test
	@DisplayName("testing that event to user thru event_participant works")
	void test3() {
		assertNotNull(event);
		assertNotNull(event.getAttendees());
		assertTrue(event.getAttendees().size()>0); // changed user to attendees
	
	}
	@Test
	@DisplayName("testing that eventOwned to userOwner works")
	void test4() {
		assertNotNull(event);
		assertNotNull(event.getEventMentor());
		assertEquals("Jeff",  event.getEventMentor().getFirstName());
	}
}
