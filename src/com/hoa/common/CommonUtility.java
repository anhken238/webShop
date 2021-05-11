package com.hoa.common;
/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/07 16:15:16
 */
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CommonUtility {
	public String formatDateTime(String dateInput, String patternDateOfInput,String patternDateOfOutput) {
		SimpleDateFormat oldFormat = new SimpleDateFormat(patternDateOfInput);
		Date date;
		try {
			date = oldFormat.parse(dateInput);
			SimpleDateFormat newFormat = new SimpleDateFormat(patternDateOfOutput);
			dateInput = newFormat.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return dateInput;
	}
}
