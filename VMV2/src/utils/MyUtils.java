package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MyUtils {
	private static MyUtils instance = null;
	private HttpServletRequest request = null;
	private boolean isLogin = false;
	private boolean isRememberMe = false;
	private javax.servlet.http.HttpSession session;
	private Cookie[] cookies = null;

	public static final int TIME_REMEMBER = 60 * 60 * 24;
	private String KEYWORD_SESSION = "userLogin";
	private String KEYWORD_COOKIE = "userRemember";

	protected MyUtils(HttpServletRequest request) {
		this.request = request;
		this.session = request.getSession();
		this.cookies = request.getCookies();
	}

	public static MyUtils getInstance(HttpServletRequest request) {
		if (instance == null) {
			instance = new MyUtils(request);
		}
		return instance;
	}

	/**
	 * Create login session
	 */
	public void createLoginSession(Object obj) {
		session.setAttribute(KEYWORD_SESSION, obj);
		this.isLogin = true;
	}

	public Object getSessionLogin() {
		return session.getAttribute(KEYWORD_SESSION);
	}

	public void sessionLogout() {
		session.removeAttribute(KEYWORD_SESSION);
		this.isLogin = false;
	}

	public boolean isLoggedIn() {
		return this.isLogin;
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
				if (KEYWORD_COOKIE.equals(cookie.getName())) {
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					this.isRememberMe = false;
				}
			}
		}
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
	}

	public boolean isRememberMeOn() {
		return this.isRememberMe;
	}
}
