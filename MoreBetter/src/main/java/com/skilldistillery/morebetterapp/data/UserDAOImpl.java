package com.skilldistillery.morebetterapp.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.morebetterapp.entities.Category;
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
		em.remove(userToDelete);
		boolean stillContains = !em.contains(userToDelete);
		em.flush();
		return stillContains; // should return TRUE if deleted successfully.
	}

	@Override
	public User updateUser(int id, User user) {
		User updatedUser = em.find(User.class, id);
	
		updatedUser.setFirstName(updatedUser.getFirstName());
		updatedUser.setLastName(updatedUser.getLastName());
		updatedUser.setEmail(updatedUser.getEmail());
		updatedUser.setRole(updatedUser.getRole());
		updatedUser.setAge(updatedUser.getAge());
		updatedUser.setUsername(updatedUser.getUsername());
		updatedUser.setPassword(updatedUser.getPassword());
		updatedUser.setEnabled(updatedUser.getEnabled());
		updatedUser.setPicture(updatedUser.getPicture());
		updatedUser.setBiography(updatedUser.getBiography());
		em.persist(updatedUser);
		em.flush();
		return updatedUser;
	}

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
	


}
