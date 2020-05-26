package com.skilldistillery.morebetterapp.data;

import com.skilldistillery.morebetterapp.entities.User;

public interface UserDAO {
	public User findUserById(int id);
	public User createUser(User user);
	public boolean deleteUserById(int id);
//	public User updateUser(int id, User user);
	
	//__________________Jeff Touched This_________________________//
	public User updateUser(User user);
	
	public User findByUserNameAndPassword(String username, String password);
}
