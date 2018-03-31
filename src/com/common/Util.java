package com.common;

public class Util {
	
	public String nulltoString(String input) {
		
		String output="";
		if(input != null || input !="" || input !="null") {
			output = input;
		}
		return output;
	}
	
	public String cutStirng(String inputString, int cut) { // 원하는 글자수 만큼 잘라내기.
		String outputString ="";
		if(inputString == null || inputString =="" )
		{
			return outputString;
		}
		else if (inputString.length() < cut) {
			
			return inputString;
			
		}else {
			outputString = inputString.substring(0,cut) + "..." ;
		}
		
		return outputString;
	}
	
	public Boolean nullCheck(Object obj) {
		if(obj==null) {
			return true;
		}else {
			return false;
		}
	}

}
