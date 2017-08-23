package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtil {

	/**
	 * 比较两个日期的差
	 * @param erly
	 * @param late
	 * @param field Calendar.* 日、时、分、秒
	 * @return
	 */
	public static long dateDiff(java.util.Date erly, Date late, int field) {

		long diff = 0L;
		Date erlyTrunc = org.apache.commons.lang3.time.DateUtils.truncate(erly, field);
		Date lateTrunc = org.apache.commons.lang3.time.DateUtils.truncate(late, field);
		switch (field) {
		case Calendar.DATE:
			diff = (lateTrunc.getTime() - erlyTrunc.getTime()) / 1000 / 3600 / 24;
			break;
		case Calendar.HOUR:
			diff = (lateTrunc.getTime() - erlyTrunc.getTime()) / 1000 / 3600;
			break;
		case Calendar.MINUTE:
			diff = (lateTrunc.getTime() - erlyTrunc.getTime()) / 1000 / 60;
			break;
		case Calendar.SECOND:
			diff = (lateTrunc.getTime() - erlyTrunc.getTime()) / 1000;
			break;
		default:
			diff = 0L;
		}
		return diff;
	}

	public static String getDateOfMonday() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd");
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0){
			day_of_week = 7;
		}
		c.add(Calendar.DATE, -day_of_week + 1);
		return ft.format(c.getTime());
	}

	public static String getDateOfSunnday() {
		Calendar c = Calendar.getInstance();
		SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd");
		int day_of_week = c.get(Calendar.DAY_OF_WEEK) - 1;
		if (day_of_week == 0)
			day_of_week = 7;
		c.add(Calendar.DATE, -day_of_week + 7);
		return ft.format(c.getTime());
	}

	public static void main(String[] args) throws ParseException {
		Date e = org.apache.commons.lang3.time.DateUtils.parseDate("2016-07-29 13:01:25",
				"yyyy-MM-dd hh:mm:ss");
		Date l = org.apache.commons.lang3.time.DateUtils.parseDate("2016-07-30 13:02:25",
				"yyyy-MM-dd hh:mm:ss");
		System.out.println(dateDiff(e, l, Calendar.MINUTE));
		
		System.out.println(getDateOfMonday()+"--"+getDateOfSunnday());
	}
}
