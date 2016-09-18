package model.bo;

import java.util.ArrayList;

import model.bean.User;
import model.dao.UserDAO;

public class UserBO {
	UserDAO dao = new UserDAO();
	
	public ArrayList<User> getAllUser() {
		return dao.getAllUser();
	}
	
	public User getUserById(int userId) {
		return dao.getUserById(userId);
	}
	
	public User getUserLogin(String username, String password) {
		return dao.getUserLogin(username, password);
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
