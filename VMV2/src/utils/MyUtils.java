package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.User;

public class MyUtils {
	private static MyUtils instance = null;
	private boolean isLogin = false;
	private boolean isRememberMe = false;
	private Cookie[] cookies = null;
	private HttpServletRequest request;
	private static final int TIME_REMEMBER = 60 * 60 * 24 * 365;
	private static final String KEYWORD_SESSION = "userLogin";
	private static final String KEYWORD_COOKIE = "userRemember";

	protected MyUtils(HttpServletRequest request) {
		this.request = request;
		this.cookies = request.getCookies();
		setRememberMe();
	}

	public static MyUtils getInstance(HttpServletRequest request) {
		if (instance == null) {
			instance = new MyUtils(request);
		}

		return instance;
	}
	

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	public boolean isLogin() {
		return isLogin;
	}

	public boolean isRememberMe() {
		return this.isRememberMe;
	}

	/**
	 * Create login session
	 */
	public static void createLoginSession(HttpServletRequest request,User user) {
		HttpSession  session = request.getSession(true);
		if (session != null) {
			session.setAttribute(KEYWORD_SESSION, user);
		}
		
	}

	public static User getSessionLogin(HttpServletRequest request) {
		User user = null;
		HttpSession  session = request.getSession(true);
		if (session != null) {
			user = (User) session.getAttribute(KEYWORD_SESSION);
		}
		return user;
	}

	public static void sessionLogout(HttpServletRequest request) {
		HttpSession  session = request.getSession(true);
		if (session != null) {
			session.removeAttribute(KEYWORD_SESSION);
		}

	}

	public void createValueCookieRemember(int value, HttpServletResponse response) {
		Cookie cookie = new Cookie(KEYWORD_COOKIE, String.valueOf(value));
		cookie.setMaxAge(TIME_REMEMBER);
		response.addCookie(cookie);
		this.isRememberMe = true;
	}

	public String getDetailCookieRemember() {
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (KEYWORD_COOKIE.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return "";
	}

	public void deleteCookieRemember(HttpServletResponse response) {
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if ((cookie.getName()).toString().compareTo(KEYWORD_COOKIE) == 0) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);

				}
			}
		}
		this.isRememberMe = false;
	}

	public void editCookieRemember(int value, HttpServletResponse response) {
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (KEYWORD_COOKIE.equals(cookie.getName())) {
					cookie.setValue(String.valueOf(value));
					cookie.setMaxAge(TIME_REMEMBER);
					response.addCookie(cookie);
				}
			}
		}
		this.isRememberMe = true;
	}

	public void setRememberMe() {
		this.isRememberMe = false;
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (KEYWORD_COOKIE.equals(cookie.getName())) {
					this.isRememberMe = true;
				}

			}
		}
	}




}
