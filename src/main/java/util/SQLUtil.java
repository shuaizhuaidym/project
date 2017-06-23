package util;

import org.apache.commons.lang3.StringUtils;

//TODO functional char filter
public class SQLUtil {
	public static String varchar(String paramName, String paramValue) {
		StringBuilder buf = new StringBuilder("");
		if (!StringUtils.isEmpty(paramValue)) {
			buf.append(" and ").append(paramName).append("='").append(paramValue).append("'");
		}
		return buf.toString();
	}

	public static String number(String paramName, String paramValue) {
		StringBuilder buf = new StringBuilder("");
		if (!StringUtils.isEmpty(paramValue)) {
			buf.append(" and ").append(paramName).append("=").append(paramValue);
		}
		return buf.toString();
	}
}
