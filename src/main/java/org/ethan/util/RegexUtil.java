package org.ethan.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexUtil {
	
	/**
	 * 返回正则匹配的第一组
	 * @param regex
	 * @param source
	 * @return
	 */
	public static String getMatcher(String regex, String source) {  
        String result = null;  
        Pattern pattern = Pattern.compile(regex);  
        Matcher matcher = pattern.matcher(source);  
        if(matcher.find()) {  
            result = matcher.group(1);  
        }
        return result;  
    }
}