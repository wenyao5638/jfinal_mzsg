package uitl;

import java.util.StringTokenizer;
/**
 * 
 * @author wangliang
 *
 */
public class StringUtil {
	 /**
     * 判断字是否为空字符串
     */
    public static boolean isEmpty(String value){
        return (value == null) || (value.trim().length() ==0);
    }
    
    /**
     * 分解字符串，用StringTokenizer实现
     * @param source 源字符串
     * @param symbol 分隔符
     * @return 
     */
    public static String[] split(String source, String symbol) {
        if (isEmpty(source) || isEmpty(symbol))
            return new String[0];
        
/*        
 * 		为兼容1.4以下版本
 		StringTokenizer st = new StringTokenizer(source, symbol);
        int len = st.countTokens();
        
        String str[] = new String[len];
        for (int i = 0; i < len; i++ ) {
            str[i] = st.nextToken();
        }
*/
        
        return source.split(symbol);
    }
    
    /**
     * 屏蔽字符，将屏蔽字符替换成指定字符
     * @param source 原字符串
     * @param shieldedStr 屏蔽字符
     * @param replaceStr 替换字符串
     * @return
     */
    public static String shield(String source, String shieldedStr, String replaceStr) {  
         for (int i = 0; i < shieldedStr.length(); i++) {
            String from = shieldedStr.substring(i, i + 1);        

            StringBuffer bf = new StringBuffer();         
            StringTokenizer st = new StringTokenizer(source, from, true);
            while (st.hasMoreTokens()) {
                String tmp = st.nextToken();
                if (tmp.equals(from)) {
                    bf.append(replaceStr);
                } else {
                    bf.append(tmp);
                }
            }
            
            source = bf.toString();
        }
        
        return source;
    }
    
    /**
     * 删除分隔符
     * @param source
     * @param symbol
     * @return
     */
    public static String delSpilth(String source, String symbol) {
        String[] strs = split(source, symbol);
        
        if (strs.length ==0) return null;
        
        StringBuffer result = new StringBuffer(source.length());
        for (int i=0; i<strs.length; i++){
            if (! isEmpty(strs[i]))
                result.append(strs[i])
                    .append(symbol);
        }
        
        if (result.length() >0){
            result.delete(result.length()- symbol.length(), result.length());
        }
        
        return result.toString();
    }    
    
    /**
     * 合并字串
     */
    public static String merge(String source, String addStr) {
        
        int pos = source.indexOf(addStr);
        if (pos < 0) {
            source = source + addStr;
        }
        
        return source;  
    }
    
    /**
     * 除去字串
     */ 
    public static String delete(String source, String delStr) {

        int pos = 0; 
        int delStrLen = delStr.length();   
        StringBuffer result = new StringBuffer(source);
        
        while ((pos = result.indexOf(delStr)) >= 0) {
            result.delete(pos, pos + delStrLen);
            //source = source.substring(0, pos) + source.substring(pos + delStr.length(), source.length());
        }
        
        return result.toString();  
    }    
    
    public static void main(String[] args) {
        System.out.println(shield("Aasf\\d1234s中国B★d@aasd\"fasdfs6465d%fa＠sdf$%da〓sd", "\\\"§№☆★○●◎◇◆□■△▲※→←↑↓〓＃＆＠＼＾〖〗【】『』「」［］｛｝'~!@#$%^*()_+|`;:>?", ""));
        System.out.println(shield("测试\\asdf1234s中国B★d@aasd\"fasdfs6465d%fa＠sdf$%da〓sd", "\\\"§№☆★○●◎◇◆□■△▲※→←↑↓〓＃＆＠＼＾〖〗【】『』「」［］｛｝'~!@#$%^*()_+|`;:>?", ""));
    
        
    }    
}
