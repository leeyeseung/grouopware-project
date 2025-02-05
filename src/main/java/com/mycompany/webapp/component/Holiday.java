package com.mycompany.webapp.component;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Component;

import com.ibm.icu.util.ChineseCalendar;

@Component
public class Holiday {
	public static void main(String[] args) {
		
	}
	
	public List<String> holidaysFomat(String yyyy){
		Holiday holiday = new Holiday();
		List<String> holifomat = new ArrayList<>();
		List<String> holi = holiday.holidayArray(yyyy);
		for(String day : holi) {
			holifomat.add("'"+day.substring(0,4)+"/"+day.substring(4,6)+"/"+day.substring(6)+"'");
		}
		return holifomat;
	}
	
	public List<String> getCurMonday() {
		List<String> list = new ArrayList<String>();
		SimpleDateFormat formatter = new SimpleDateFormat("yy.MM.dd");

		Calendar c = Calendar.getInstance();
		c.add(Calendar.DATE, -1);
		c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);

		list.add(formatter.format(c.getTime()));

		for (int i = 1; i < 7; i++) {
			c.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
			c.add(Calendar.DATE, i);
			list.add(formatter.format(c.getTime()));
			//System.out.println(list.toString());
		}

		return list;

	}

	public boolean isHoliday(String yyyymmdd) {
		boolean result = false;
		String year = yyyymmdd.substring(0, 4);
		for (String date : holidayArray(year)) {
			if (date.equals(yyyymmdd)) {
				result = true;
			}
		}
		return result;
	}

	static Set<String> holidaysSet = new HashSet<>();
	public static final int LD_SUNDAY = 7;
	public static final int LD_SATURDAY = 6;
	public static final int LD_MONDAY = 1;

	/**
	 * 음력날짜를 양력날짜로 변환
	 */
	public String Lunar2Solar(String yyyymmdd) {
		ChineseCalendar cc = new ChineseCalendar();

		if (yyyymmdd == null)
			return null;

		String date = yyyymmdd.trim();
		if (date.length() != 8) {
			if (date.length() == 4)
				date = date + "0101";
			else if (date.length() == 6)
				date = date + "01";
			else if (date.length() > 8)
				date = date.substring(0, 8);
			else
				return null;
		}

		cc.set(ChineseCalendar.EXTENDED_YEAR, Integer.parseInt(date.substring(0, 4)) + 2637); // 년, year + 2637
		cc.set(ChineseCalendar.MONTH, Integer.parseInt(date.substring(4, 6)) - 1); // 월, month -1
		cc.set(ChineseCalendar.DAY_OF_MONTH, Integer.parseInt(date.substring(6))); // 일

		LocalDate solar = Instant.ofEpochMilli(cc.getTimeInMillis()).atZone(ZoneId.of("UTC")).toLocalDate();

		int y = solar.getYear();
		int m = solar.getMonth().getValue();
		int d = solar.getDayOfMonth();

		StringBuilder ret = new StringBuilder();
		ret.append(String.format("%04d", y));
		ret.append(String.format("%02d", m));
		ret.append(String.format("%02d", d));

		return ret.toString();
	}

	public List<String> holidayArray(String yyyy) {
		holidaysSet.clear();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");

		// 양력 휴일
		holidaysSet.add(yyyy + "0101"); // 신정
		holidaysSet.add(yyyy + "0301"); // 삼일절
		holidaysSet.add(yyyy + "0505"); // 어린이날
		holidaysSet.add(yyyy + "0606"); // 현충일
		holidaysSet.add(yyyy + "0815"); // 광복절
		holidaysSet.add(yyyy + "1003"); // 개천절
		holidaysSet.add(yyyy + "1009"); // 한글날
		holidaysSet.add(yyyy + "1225"); // 성탄절

		// 음력 휴일

		String prev_seol = LocalDate.parse(Lunar2Solar(yyyy + "0101"), formatter).minusDays(1).toString().replace("-",
				"");
		holidaysSet.add(yyyy + prev_seol.substring(4)); // ""
		holidaysSet.add(yyyy + SolarDays(yyyy, "0101")); // 설날
		holidaysSet.add(yyyy + SolarDays(yyyy, "0102")); // ""
		holidaysSet.add(yyyy + SolarDays(yyyy, "0408")); // 석탄일
		holidaysSet.add(yyyy + SolarDays(yyyy, "0814")); // ""
		holidaysSet.add(yyyy + SolarDays(yyyy, "0815")); // 추석
		holidaysSet.add(yyyy + SolarDays(yyyy, "0816")); // ""

		try {
			// 어린이날 대체공휴일 검사 : 어린이날은 토요일, 일요일인 경우 그 다음 평일을 대체공유일로 지정

			int childDayChk = LocalDate.parse(yyyy + "0505", formatter).getDayOfWeek().getValue();
			if (childDayChk == LD_SUNDAY) { // 일요일
				holidaysSet.add(yyyy + "0506");
			}
			if (childDayChk == LD_SATURDAY) { // 토요일
				holidaysSet.add(yyyy + "0507");
			}

			// 설날 대체공휴일 검사
			if (LocalDate.parse(Lunar2Solar(yyyy + "0101"), formatter).getDayOfWeek().getValue() == LD_SUNDAY) { // 일
				holidaysSet.add(Lunar2Solar(yyyy + "0103"));
			}
			if (LocalDate.parse(Lunar2Solar(yyyy + "0101"), formatter).getDayOfWeek().getValue() == LD_MONDAY) { // 월
				holidaysSet.add(Lunar2Solar(yyyy + "0103"));
			}
			if (LocalDate.parse(Lunar2Solar(yyyy + "0102"), formatter).getDayOfWeek().getValue() == LD_SUNDAY) { // 일
				holidaysSet.add(Lunar2Solar(yyyy + "0103"));
			}

			// 추석 대체공휴일 검사
			if (LocalDate.parse(Lunar2Solar(yyyy + "0814"), formatter).getDayOfWeek().getValue() == LD_SUNDAY) {
				holidaysSet.add(Lunar2Solar(yyyy + "0817"));
			}
			if (LocalDate.parse(Lunar2Solar(yyyy + "0815"), formatter).getDayOfWeek().getValue() == LD_SUNDAY) {
				holidaysSet.add(Lunar2Solar(yyyy + "0817"));
			}
			if (LocalDate.parse(Lunar2Solar(yyyy + "0816"), formatter).getDayOfWeek().getValue() == LD_SUNDAY) {
				holidaysSet.add(Lunar2Solar(yyyy + "0817"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		List<String> holidaysList = new ArrayList<>(holidaysSet);
		return holidaysList;
	}

	private String SolarDays(String yyyy, String date) {
		return Lunar2Solar(yyyy + date).substring(4);
	}
}
