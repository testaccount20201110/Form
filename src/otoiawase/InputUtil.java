package otoiawase;

import java.util.ArrayList;

public class InputUtil {
	/** 総称型の未検査のキャスト警告回避(ArrayList<String>) */
	@SuppressWarnings("unchecked")
	public static  ArrayList<String> automaticCast(Object object) {
		ArrayList<String> castedObject = (ArrayList<String>) object;
		return castedObject;
	}

	public static String errKindFind(ArrayList<String> errArray,String kind){
		if(errArray != null){
			for(String str : errArray){
				if(str.equals(kind)){
					return "error";
				}
			}
		}
		return "";
	}

	public static String objToString(Object object){
		if(object != null){
			return (String)object;
		}
		return "";
	}

	public static String initValue(String str,String str2, String ret ){
		if(str.equals("") || str == null){
			return "";
		}
		if(str.equals(str2)){
			return ret;
		}
		return "";
	}

	public static String initValue(String[] strArray,String str2, String ret){
		if(strArray != null){
			for(String str : strArray){
				if(str.equals(str2)){
					return ret;
				}
			}
		}
		return "";
	}

	public static String numberChangeHan(String str) {
		StringBuffer sb = new StringBuffer(str);
		for (int i = 0; i < sb.length(); i++) {
			char c = sb.charAt(i);
			if (c >= '０' && c <= '９') {
				sb.setCharAt(i, (char)(c - '０' + '0'));
			}
		}
		return sb.toString();
	}

	public static String alphabetChangeHan(String str) {
		StringBuffer sb = new StringBuffer(str);
	    for (int i = 0; i < sb.length(); i++) {
	    	char c = sb.charAt(i);
	    	if (c >= 'ａ' && c <= 'ｚ') {
	    		sb.setCharAt(i, (char) (c - 'ａ' + 'a'));
	    	} else if (c >= 'Ａ' && c <= 'Ｚ') {
	    		sb.setCharAt(i, (char) (c - 'Ａ' + 'A'));
	    	}else if (c == '＠') {
	    		sb.setCharAt(i, (char) (c - '＠' + '@'));
	    	}else if (c == '／') {
	    		sb.setCharAt(i, (char) (c - '／' + '/'));
	    	}else if (c == '．') {
	    		sb.setCharAt(i, (char) (c - '．' + '.'));
	    	}else if (c == '：') {
	    		sb.setCharAt(i, (char) (c - '：' + ':'));
	    	}
	    }
	    return sb.toString();
	}

	public static String firstZeroDelete(String str){
		StringBuffer sb = new StringBuffer(str);
	    for (int i = 0; i < sb.length(); i++) {
	    	char c = sb.charAt(i);
	    	if(c != '0'){
	    		sb.delete(0, i);
	    		return sb.toString();
	    	}
	    }
	    return sb.toString();
	}
}
