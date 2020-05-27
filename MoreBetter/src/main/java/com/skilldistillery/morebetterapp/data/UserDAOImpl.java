package com.skilldistillery.morebetterapp.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.morebetterapp.entities.Event;
import com.skilldistillery.morebetterapp.entities.User;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findUserById(int id) {
		return em.find(User.class, id);
	}

	@Override
	public User createUser(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public boolean deleteUserById(int id) {
		User userToDelete = em.find(User.class, id);
		userToDelete.setEnabled(false);
		// em.remove(userToDelete);
		boolean stillContains = !em.contains(userToDelete);
		em.flush();
		return stillContains; // should return TRUE if deleted successfully.
	}

//	@Override
//	public User updateUser(User user) {
//		EntityManager em = emf.createEntityManager();
//		User updatedUser = em.find(User.class);
//		System.out.println(updatedUser);
//		updatedUser.setFirstName(user.getFirstName());
//		updatedUser.setLastName(user.getLastName());
//		updatedUser.setEmail(user.getEmail());
//		updatedUser.setRole(user.getRole());
//		updatedUser.setAge(user.getAge());
//		updatedUser.setUsername(user.getUsername());
//		updatedUser.setPassword(user.getPassword());
//		updatedUser.setEnabled(user.getEnabled());
//		updatedUser.setPicture(user.getPicture());
//		updatedUser.setBiography(user.getBiography());
//		System.out.println(user);
//		System.out.println(updatedUser);
//		em.flush();
//		em.getTransaction().commit();
//		return updatedUser;
//	}

	@Override
	public User findByUserNameAndPassword(String username, String password) {
		String jpql = "SELECT u FROM User u WHERE u.username =:username AND u.password = :password";
		User user = null;
		try {
			user = em.createQuery(jpql, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	// ________________Jeff Touched This________________//
	@Override
	public User updateUser(User user) {
		User updatedUser = em.find(User.class, user.getId());
		updatedUser.setFirstName(user.getFirstName());
		updatedUser.setLastName(user.getLastName());
		updatedUser.setEmail(user.getEmail());
		updatedUser.setRole(user.getRole());
		updatedUser.setAge(user.getAge());
		updatedUser.setUsername(user.getUsername());
		updatedUser.setPassword(user.getPassword());
		updatedUser.setEnabled(user.getEnabled());
		updatedUser.setPicture(user.getPicture());
		updatedUser.setBiography(user.getBiography());
		em.flush();

		return updatedUser;
	}
	// ____________________________________________________//

	// ____________________userToEvent_____________________//

	@Override
	public List<Event> addUserToEvent(int uId, int eId) {

		Event eventToAddTo = em.find(Event.class, eId);
		User user = em.find(User.class, uId);
		user.addEventAttended(eventToAddTo);

		em.persist(eventToAddTo);
		em.persist(user);

		return user.getEventsAttended();
	}

	@Override
	public List<Event> deleteUserFromEvent(int uId, int eId) {

		Event deleteFromThis = em.find(Event.class, eId);
		User user = em.find(User.class, uId);
		
	
		
		if (deleteFromThis != null) {
			deleteFromThis.removeAttendee(user);
			
			
			em.persist(deleteFromThis);
			em.persist(user);

		} 
		
		    em.flush();
		
			return user.getEventsAttended();
	
	}

	// ____________________________________________________//

}
