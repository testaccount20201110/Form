package otoiawase;

public class Sanitizing {
	/** XSC対策 */
	public static String htmlEscape(String strVal){
		if(strVal.equals("") || strVal == null || strVal.equals(" ") || strVal.equals("　")){
			return "";
		}
		StringBuffer strResult=new StringBuffer();
		for(int i=0;i<strVal.length();i++){
			switch(strVal.charAt(i)){
			case '&' :
				strResult.append("&amp;");
				break;
			case '<' :
				strResult.append("&lt;");
				break;
			case '>' :
				strResult.append("&gt;");
				break;
			case '\'' :
				strResult.append("&#39;");
				break;
			case '"' :
				strResult.append("&quot;");
				break;
			default :
				strResult.append(strVal.charAt(i));
				break;
			}
		}
		return strResult.toString();
	}

	/** CSV対策 */
	public static String csvEscape(String strVal){
		if(strVal.equals("") || strVal == null || strVal.equals(" ") || strVal.equals("　")){
			return "";
		}
		StringBuffer strResult=new StringBuffer();
		for(int i=0;i<strVal.length();i++){
			switch(strVal.charAt(i)){
			case '"':
				strResult.append("\"\"");
				break;
			default :
				strResult.append(strVal.charAt(i));
				break;
			}
		}
		return strResult.toString();
	}

	/** SQL対策 */
	public static String sqlEscape(String strVal){
		StringBuffer strResult=new StringBuffer();
		for(int i=0;i<strVal.length();i++){
			switch(strVal.charAt(i)){
			case '\'':
				strResult.append("\'\'");
				break;
			default :
				strResult.append(strVal.charAt(i));
				break;
			}
		}
		return strResult.toString();
	}
}
