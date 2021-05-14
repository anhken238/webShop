package com.hoa.common;
/**
 * Creator NguyenDucAnh
 * 
 * 2021/05/07 16:22:28
 */
public class Validation {
	public boolean isNull(String str) {
		boolean check = false;
		if(str == "" || str == null) {
			check = true;
		}
		return check;
	}

}
