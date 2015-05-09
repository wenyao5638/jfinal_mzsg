package common;

import java.io.Serializable;
import java.util.List;

/**
 * 鍒嗛〉
 * 
 * @author xukaixuan
 */
public class Page{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -465430717486539227L;
	
	

	private List result = null;
	/**
	 * 褰撳墠椤�
	 * 
	 * @uml.property name="currentPage"
	 */
	private int currentPage = 1;

	/**
	 * 姣忛〉鏄剧ず鏉℃暟
	 * 
	 * @uml.property name="pageNum"
	 */
	private int pageSize = 20;

	/**
	 * 涓嬩竴椤�
	 * 
	 * @uml.property name="nextPage"
	 */
	private int nextPage = 1;

	/**
	 * 涓婁竴椤�
	 * 
	 * @uml.property name="forwardPage"
	 */
	private int forwardPage = 1;

	/**
	 * 鎬诲叡椤垫暟
	 * 
	 * @uml.property name="totalPage"
	 */
	private int totalPage = 0;

	/**
	 * 绗﹀悎鏉′欢鐨勪釜鏁�
	 * 
	 * @uml.property name="totalElement"
	 */
	private int totalElement;

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}

	/**
	 * 鑾峰彇褰撳墠椤�
	 * 
	 * @return
	 * @uml.property name="currentPage"
	 */
	public int getCurrentPage() {
		return currentPage;
	}

	/**
	 * 璁剧疆褰撳墠椤�
	 * 
	 * @param currentPage
	 * @uml.property name="currentPage"
	 */
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	/**
	 * 鑾峰彇绗﹀悎鏉′欢鐨勪釜鏁�
	 * 
	 * @return
	 * @uml.property name="totalElement"
	 */
	public int getTotalElement() {
		return totalElement;
	}

	/**
	 * 璁剧疆绗﹀悎鏉′欢鐨勪釜鏁�
	 * 
	 * @param totalElement
	 *            锛氱鍚堟潯浠剁殑涓暟
	 * @uml.property name="totalElement"
	 */
	public void setTotalElement(int totalElement) {
		this.totalElement = totalElement;
		this.totalPage = this.totalElement % pageSize == 0 ? (this.totalElement / pageSize)
				: (this.totalElement / pageSize) + 1;
		this.forwardPage = this.currentPage == 1 ? this.currentPage
				: this.currentPage - 1;
		this.nextPage = this.currentPage == this.totalPage ? this.currentPage
				: this.currentPage + 1;
	}

	/**
	 * 鑾峰彇涓婁竴椤甸〉鐮�
	 * 
	 * @return the forwardPage
	 * @uml.property name="forwardPage"
	 */
	public int getForwardPage() {
		return forwardPage;
	}

	/**
	 * 璁剧疆涓婁竴椤甸〉鐮�
	 * 
	 * @param forwardPage
	 *            椤电爜
	 * @uml.property name="forwardPage"
	 */
	public void setForwardPage(int forwardPage) {
		this.forwardPage = forwardPage;
	}

	/**
	 * 鑾峰彇涓嬩竴椤甸〉鐮�
	 * 
	 * @return the nextPage
	 * @uml.property name="nextPage"
	 */
	public int getNextPage() {
		return nextPage;
	}

	/**
	 * 璁剧疆涓嬩竴椤甸〉鐮�
	 * 
	 * @param nextPage
	 *            椤电爜
	 * @uml.property name="nextPage"
	 */
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	/**
	 * 鑾峰彇鎬婚〉鏁�
	 * 
	 * @return
	 * @uml.property name="totalPage"
	 */
	public int getTotalPage() {
		return totalPage;
	}

	/**
	 * 璁剧疆鎬婚〉鏁�
	 * 
	 * @param totalPage
	 *            锛氭�椤垫暟
	 * @uml.property name="totalPage"
	 */
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	/**
	 * 鑾峰彇姣忛〉鏄剧ず鏉℃暟
	 * 
	 * @return
	 * @uml.property name="pageNum"
	 */
	public int getPageSize() {
		return pageSize;
	}

	/**
	 * 璁剧疆姣忛〉鏄剧ず鏉℃暟
	 * 
	 * @param pageNum
	 *            锛氭瘡椤垫樉绀烘潯鏁�
	 * @uml.property name="pageNum"
	 */
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirst() {
		return (currentPage - 1) * pageSize;
	}

}
