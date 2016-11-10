package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.User;

public class MyUtils {
	private static MyUtils instance = null;
	private boolean isLogin = false;
	private boolean isRememberMe = false;
	private javax.servlet.http.HttpSession session;
	private Cookie[] cookies = null;
	private HttpServletRequest request;
	private static final int TIME_REMEMBER = 60 * 60 * 24;
	private static final String KEYWORD_SESSION = "userLogin";
	private static final String KEYWORD_COOKIE = "userRemember";

	protected MyUtils(HttpServletRequest request) {
		this.request=request;
		
		this.cookies = request.getCookies();
		isLogin();
		setRememberMe();
	}

	public static MyUtils getInstance(HttpServletRequest request) {
		if (instance == null) {
			instance = new MyUtils(request);
		}

		return instance;
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
	public void createLoginSession(User user) {
		try{
			this.session = request.getSession();
			session.setAttribute(KEYWORD_SESSION, user);
			this.isLogin = true;
		}catch(IllegalStateException ex){
			System.err.println(ex.getMessage());
		}
		
	}

	public User getSessionLogin() {
		System.out.println(this.isLogin);
		User user=null;
		try{
			this.session = request.getSession();
			user=(User) session.getAttribute(KEYWORD_SESSION);
		}catch(IllegalStateException ex){
			System.err.println(ex.getMessage());
		}
		return user ;
	}

	public void sessionLogout() {
		this.session = request.getSession();
		session.removeAttribute(KEYWORD_SESSION);
		this.isLogin = false;
	}

	public void createValueCookieRemember(int value, HttpServletResponse response) {
		Cookie cookie = new Cookie(KEYWORD_COOKIE, String.valueOf(value));
		cookie.setMaxAge(TIME_REMEMBER);
		response.addCookie(cookie);
		this.isRememberMe = true;
	}

	public String getDetailCookieRemember() {
		String value = "";
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if (KEYWORD_COOKIE.equals(cookie.getName())) {
					value = cookie.getValue();
				}
			}
		}
		return value;
	}

	public void deleteCookieRemember(HttpServletResponse response) {
		Cookie cookie = null;
		if (cookies != null) {
			for (int i = 0; i < cookies.length; i++) {
				cookie = cookies[i];
				if ((cookie.getName()).compareTo(KEYWORD_COOKIE) == 0) {
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

	public void setLogin() {
		if (getSessionLogin() != null) {
			this.isLogin = true;
		} else {
			this.isLogin = false;
		}
	}

}
