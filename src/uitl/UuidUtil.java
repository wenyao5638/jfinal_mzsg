package uitl;

import java.util.UUID;
/**
 * 王亮
 * @author wangliang
 *
 */
public class UuidUtil {
     /**
      * 生成uuid
      * @return
      */
	 public  static String createUUID() {
	        UUID uuid = UUID.randomUUID();
	        return String.valueOf(uuid);
	    }

}
