package utils;

public class StringUtils {
	
	public static String shorten(String str, int length) {
		if (!str.equals(null)) {
			if (str.trim().length() <= length) {
				return str;
			} else {
				return str.substring(0, length) + "...";
			}
		}
		return "";	
	}
	
}

