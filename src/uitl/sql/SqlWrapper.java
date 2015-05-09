package uitl.sql;

/**
 * 
 * @author wangliang
 *
 */
public class SqlWrapper {
    /**
     * 拼接大于
     * @param orEquals
     * @return
     */
	public static String returnMoreSQL(boolean orEquals)
	{
		if (orEquals)
    		return " >= ? ";
        return " > ? ";
	}
	/**
	 * 拼接小于
	 * @param orEquals
	 * @return
	 */
	public static String returnLessSQL(boolean orEquals)
	{
		if (orEquals)
    		return " <= ? ";
        return " < ? ";
	}
	/**
	 * 拼接等于
	 * @param orEquals
	 * @return
	 */
	public static String returnEqualsSQL()
	{
		return " = ? ";
	}
	/**
	 * 拼接like
	 * @param orEquals
	 * @return
	 */
	public static String returnLikeSQL()
	{
		return " LIKE  ";
	}
 
}
