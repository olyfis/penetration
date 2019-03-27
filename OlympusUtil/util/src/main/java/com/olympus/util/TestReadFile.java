package com.olympus.util;

import java.util.ArrayList;
import java.util.Date;

import com.olympus.util.JButils;

public class TestReadFile {

	
	static String filename = "c:\\temp\\h.txt";
	static ArrayList<String> strArr = new ArrayList<String>();
	 
	public static void main(String[] args) {
		
		JButils jutil = new JButils();
		
		strArr = jutil.readInputFile(filename);
		jutil.printStrArray(strArr);
		
		Date date = jutil.getCurrentDate();
		String dateVal = date.toString();
		System.out.println("Date=" + dateVal);
		
	}

}
