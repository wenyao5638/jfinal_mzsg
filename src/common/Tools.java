package common;

import java.math.BigDecimal;

public class Tools {

	public static Integer null2Int(Object object) {
		if (object != null) {
			if (object instanceof Integer)
				return (Integer) object;
			else if (object instanceof Long)
				return ((Long) object).intValue();
			else if (object instanceof BigDecimal)
				return ((BigDecimal) object).intValue();
			else
				return 0;
		} else
			return Integer.valueOf(0);

	}
}
