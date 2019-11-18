package utils;

import java.util.Calendar;

public class DateUtil {
	// 计算剩余的借阅天数
	public static int getDay(String start, String end) {
		Calendar before = DateUtil.changeStringToDate(start); // 得到开始时间对象
		Calendar after = DateUtil.changeStringToDate(end); // 得到结束时间对象
		long first = before.getTimeInMillis(); // 得到开始时间的毫秒值
		long second = after.getTimeInMillis(); // 得到结束时间的毫秒值
		int day = (int) ((second - first) / (1000 * 60 * 60 * 24));
		return day;
	}

	// 计算还书日期
	public static String addSomeDay(String date, int day) {
		Calendar cal = DateUtil.changeStringToDate(date);
		cal.add(Calendar.DAY_OF_MONTH, day);
		String newString = DateUtil.getDateString(cal);
		return newString;
	}

	// 计算借书日期
	public static String getDateString(Calendar cal) {
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONDAY) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return year + "-" + month + "-" + day;
	}

	// 将字符串转换成日期格式
	public static Calendar changeStringToDate(String date) {
		String regex = "-"; // 拆分字符串的正则式
		String d[] = date.split(regex); // 拆分得到字符串数组
		int year = Integer.parseInt(d[0]); // 得到年份
		int month = Integer.parseInt(d[1]) - 1; // 得到月份
		int day = Integer.parseInt(d[2]); // 得到这天是该月中的第几天
		Calendar calendar = Calendar.getInstance(); // 得到一个Calendar实例
		calendar.set(year, month, day); // 设置日期为字符串内容的日期
		return calendar; // 返回日期对象
	}

	// 设计编号
	// Calendar rightNow = Calendar.getInstance();
	public static String newId(Calendar cal) {
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONDAY) + 1;
		int day = cal.get(Calendar.DAY_OF_MONTH);
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int minute = cal.get(Calendar.MINUTE);
		int second = cal.get(Calendar.SECOND);
		String newid = "" + year + month + day + hour + minute + second;
		return newid;
	}

	// 比较天数大小
	public static boolean compare(String start, String end) {
		Calendar before = DateUtil.changeStringToDate(start); // 得到开始时间对象
		Calendar after = DateUtil.changeStringToDate(end); // 得到结束时间对象
		long first = before.getTimeInMillis(); // 得到开始时间的毫秒值
		long second = after.getTimeInMillis(); // 得到结束时间的毫秒值
		if (first < second) {
			return true;
		} else {
			return false;
		}
	}
}