package com.common;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONValue;


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
	// Resultset을 받아서 json으로 반환하기 
		public String getJSONFromResultSet(ResultSet rs,String keyName) {
		    Map json = new HashMap(); 
		    List list = new ArrayList();
		    if(rs!=null)
		    {
		        try {
		            ResultSetMetaData metaData = rs.getMetaData();
		            while(rs.next())
		            {
		                Map<String,Object> columnMap = new HashMap<String, Object>();
		                for(int columnIndex=1;columnIndex<=metaData.getColumnCount();columnIndex++)
		                {
		                    if(rs.getString(metaData.getColumnName(columnIndex))!=null)
		                        columnMap.put(metaData.getColumnLabel(columnIndex),     rs.getString(metaData.getColumnName(columnIndex)));
		                    else
		                        columnMap.put(metaData.getColumnLabel(columnIndex), "");
		                }
		                list.add(columnMap);
		            }
		        } catch (SQLException e) {
		            e.printStackTrace();
		        }
		        json.put(keyName, list);
		     }
		     return JSONValue.toJSONString(json);
		}	
	
		public String answerChange(String input) {
			
			if(input == null ) {
				return "N/A";
			}else if(input.equals("1") || input.equals("1.0")) {
				return "①";
			}else if(input.equals("2") || input.equals("2.0")) {
				return "②";
			}else if(input.equals("3") || input.equals("3.0")) {
				return "③";
			}else if(input.equals("4") || input.equals("4.0")) {
				return "④";
			}else if(input.equals("5") || input.equals("5.0")) {
				return "⑤";
			}else {
				return "N/A";
			}
			
		}
	

}
