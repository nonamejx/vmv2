package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;

public class MyUtils {
	private static MyUtils instance = null;
	private HttpServletRequest request;
	private HttpServletResponse response;

	protected MyUtils(HttpServletRequest request, HttpServletResponse response) {
		this.request = request;
		this.response = response;
	}

	public static MyUtils getInstance(HttpServletRequest request, HttpServletResponse response) {
		if (instance == null) {
			instance = new MyUtils(request, response);
		}
		return instance;
	}

	public void setSessionLogin(Object obj, String keyword) {
		javax.servlet.http.HttpSession session = request.getSession();
		session.setAttribute(keyword, obj);
	}

	public Object getSessionLogin(String keyword) {
		javax.servlet.http.HttpSession session = request.getSession();
		return session.getAttribute(keyword);

	}

	public void deleteSessionLogin(String keyword) {
		javax.servlet.http.HttpSession session = request.getSession();
		session.removeAttribute(keyword);
	}

	public void setValueCookieRemember(int value, String keyword) {
		Cookie cookie = new Cookie(keyword, String.valueOf(value));
		cookie.setMaxAge(60 * 60 * 24);
		response.addCookie(cookie);
	}

	public String getValueCookieRemember(String keyword) {
		String value = "";
		Cookie cookie = null;
		Cookie[] cookies = null;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (keyword.equals(cookie.getName())) {
					value = cookie.getValue();
				}
			}
		}
		return value;
	}

	public int deleteCookieRemember(String keyword) {
		int rs = 1;
		Cookie cookie = null;
		Cookie[] cookies = null;
		// Get an array of Cookies associated with this domain
		cookies = request.getCookies();
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (keyword.equals(cookie.getName())) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
				}
			}
		} else {
			rs = 0;
		}
		return rs;
	}
}
