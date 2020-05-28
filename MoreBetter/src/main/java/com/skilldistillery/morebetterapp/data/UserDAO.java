package com.skilldistillery.morebetterapp.data;

import java.util.List;

import com.skilldistillery.morebetterapp.entities.Event;
import com.skilldistillery.morebetterapp.entities.User;

public interface UserDAO {
	public User findUserById(int id);
	public User createUser(User user);
	public boolean deleteUserById(int id);
	
	public List<Event> addUserToEvent(int uId, int eId);
	public List<Event> deleteUserFromEvent(int uId, int eId);
	
	
	//__________________Jeff Touched This_________________________//
	public User updateUser(User user);
	
	public User findByUserNameAndPassword(String username, String password);
	
	//_________________________for Admin_________________________//
	
	
	public User disableUser(int id);
	public User enableUser(int id);
	List<User> findAll();
	
}
