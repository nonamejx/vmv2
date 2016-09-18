package model.bo;

import java.util.ArrayList;

import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO dao = new UserDAO();
	
	public ArrayList<User> getAllUsers() {
		return dao.getAllUsers();
	}
	
	public User getUserById(int userId) {
		return dao.getUserById(userId);
	}
	
	public User getUserByUsernamePassword(String username, String password) {
		return dao.getUserByUsernamePassword(username, password);
	}
	
	public int insertUser(User user) {
		return dao.insertUser(user);
	}
	
	public int updateUser(User user) {
		return dao.updateUser(user);
	}
	
	public int deleteUser(int UserId) {
		return dao.deleteUser(UserId);
	}
}
