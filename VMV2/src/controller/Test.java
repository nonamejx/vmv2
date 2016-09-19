package controller;

import java.util.ArrayList;

import model.bean.User;
import model.bo.UserBO;

public class Test {
	public static void main(String[] args) {
		UserBO userBO = new UserBO();
		ArrayList<User> users = userBO.getAllUsers();
		
		for (User user : users) {
			System.out.println(user.toString());
		}
	}
}
