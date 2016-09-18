package utils;

public class Validate {
	
	public static boolean checkNumber(String value) {
		if (value == null) return false;
		return value.matches("\\d+");
	}

	public static boolean checkEmail(String value) {
		if (value == null) return false;
		return value.matches("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
	}

	public static boolean checkPhone(String value) {
		if (value == null) return false;
		return value.matches("\\d{9,13}");
	}

	public static boolean checkDate(String value) {
		if (value == null)
			return false;
		return value.matches("(0?[1-9]|[12][0-9]|3[01])/(0?[1-9]|1[012])/((18|19|20)\\d\\d)");
	}

	public static boolean isEmpty(String value) {
		return value == null || value.length() == 0;
	}

	public static boolean checkString(String value, int minLength, int maxLength) {
		if (value == null)
			return false;
		else {
			if (value.length() >= minLength && value.length() <= maxLength)
				return true;
		}
		return false;
	}
	
	// kiet them
	public static boolean checkKeyword(String value) {
		if (value == null)
            return false;
		return value.matches("[a-zA-Z0-9_-ÀÁÂÃÈÉÊÌÍÒÓÔÕÙÚĂĐĨŨƠàáâãèéêìíòóôõùúăđĩũơƯĂẠẢẤẦẨẪẬẮẰẲẴẶẸẺẼỀỀỂưăạảấầẩẫậắằẳẵặẹẻẽềềểỄỆỈỊỌỎỐỒỔỖỘỚỜỞỠỢỤỦỨỪễệỉịọỏốồổỗộớờởỡợụủứừỬỮỰỲỴÝỶỸửữựỳỵỷỹ]+");
	}
}
