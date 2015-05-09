package uitl;

import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.format.Colour;
import jxl.format.UnderlineStyle;
import jxl.format.VerticalAlignment;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;


import com.demo.controller.BaseController;

/**
 * 
 * @author wangliang
 * 
 */
public class JExcelReportMap extends BaseController{
	/**
	 * 瀵煎嚭Excel
	 * 
	 * @param title
	 * @param coltitles
	 * @param dates
	 * @param outName
	 * @return
	 */
	public void exportReport(String title, String[] coltitles,
			List<String[]> dates, String outName) {
		try {
			OutputStream os = getRespose(outName).getOutputStream();// 鍙栧緱杈撳嚭娴�
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			jxl.write.WritableSheet sheet = wwb.createSheet("sheet1", 0);
			addExcelTitle(title, sheet, coltitles.length - 1);
			addCellTitle(coltitles, sheet);
			addCellDate(dates, sheet);
			wwb.write();
			wwb.close();
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 瀵煎嚭Excel
	 * 
	 * @param title
	 * @param coltitles
	 * @param dates
	 * @param outName
	 * @return
	 */
	public void exportReport(String title, String[] coltitles,
			List<String[]> dates, List<Integer[]> colours, String outName) {
		try {
			OutputStream os = getRespose(outName).getOutputStream();// 鍙栧緱杈撳嚭娴�
			WritableWorkbook wwb = Workbook.createWorkbook(os);
			jxl.write.WritableSheet sheet = wwb.createSheet("sheet1", 0);
			addExcelTitle(title, sheet, coltitles.length - 1);
			addCellTitle(coltitles, sheet);
			addCellDate(dates, colours, sheet);
			wwb.write();
			wwb.close();
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 寰楀埌respose
	 * 
	 * @param outName
	 */
	public HttpServletResponse getRespose(String outName) {
		HttpServletResponse respose = getResponse();
		respose.reset();// 娓呯┖杈撳嚭娴�
		respose.setContentType("application/msexcel");
		try {
			respose.setHeader("Content-disposition", "attachment; filename="
					+ new String(outName.getBytes("gb2312"), "ISO8859-1"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return respose;
	}

	/**
	 * 澧炲姞Excel鏍囬
	 * 
	 * @param coltitles
	 * @param sheet
	 */
	public void addExcelTitle(String title, WritableSheet sheet, Integer cols) {
		try {
			sheet.mergeCells(0, 0, cols, 0);
			WritableFont wfc = new WritableFont(WritableFont.ARIAL, 15,
					WritableFont.NO_BOLD, false, UnderlineStyle.NO_UNDERLINE);
			WritableCellFormat wcfFC = new WritableCellFormat(wfc);
			wcfFC.setAlignment(Alignment.CENTRE);
			wcfFC.setBackground(Colour.GOLD);
			wcfFC.setVerticalAlignment(VerticalAlignment.CENTRE);
			wcfFC.setBorder(jxl.format.Border.ALL,
					jxl.format.BorderLineStyle.THIN);
			jxl.write.Label labelC = new jxl.write.Label(0, 0, title, wcfFC);
			sheet.setRowView(0, 800);
			sheet.addCell(labelC);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**
	 * 澧炲姞Excel鍒楃殑鏍囬
	 * 
	 * @param coltitles
	 * @param sheet
	 */
	public void addCellTitle(String[] coltitles, WritableSheet sheet) {
		for (int i = 0; i < coltitles.length; i++) {
			try {
				WritableFont wfc = new WritableFont(WritableFont.ARIAL, 10,
						WritableFont.NO_BOLD, false,
						UnderlineStyle.NO_UNDERLINE);
				WritableCellFormat wcfFC = new WritableCellFormat(wfc);
				wcfFC.setAlignment(Alignment.CENTRE);
				wcfFC.setBackground(Colour.AQUA);
				wcfFC.setVerticalAlignment(VerticalAlignment.CENTRE);
				wcfFC.setBorder(jxl.format.Border.ALL,
						jxl.format.BorderLineStyle.THIN);
				jxl.write.Label labelC = new jxl.write.Label(i, 1,
						coltitles[i], wcfFC);
				sheet.setRowView(1, 500);
				sheet.setColumnView(i, 20);
				sheet.addCell(labelC);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}

	/**
	 * 澧炲姞Excel琛岃褰�
	 * 
	 * @param dates
	 * @param sheet
	 */
	public void addCellDate(List<String[]> dates, List<Integer[]> colours,
			WritableSheet sheet) {
		for (int i = 0; i < dates.size(); i++) {
			String[] date = dates.get(i);
		  Integer [] colour=colours.get(i);
			for (int j = 0; j < date.length; j++) {
				try {
					WritableFont wfc = new WritableFont(WritableFont.ARIAL, 10,
							WritableFont.NO_BOLD, false,
							UnderlineStyle.NO_UNDERLINE);
					WritableCellFormat wcfFC = new WritableCellFormat(wfc);
					wcfFC.setAlignment(Alignment.CENTRE);
					wcfFC.setVerticalAlignment(VerticalAlignment.CENTRE);
					if (colour[j] == 1) {
						wcfFC.setBackground(jxl.format.Colour.RED);
					}
					wcfFC.setBorder(jxl.format.Border.ALL,
							jxl.format.BorderLineStyle.THIN);
					jxl.write.Label labelC = new jxl.write.Label(j, i + 2,
							date[j], wcfFC);
					sheet.setRowView(i + 2, 300);
					sheet.setColumnView(j, 20);
					sheet.addCell(labelC);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
	}

	/**
	 * 澧炲姞Excel琛岃褰�
	 * 
	 * @param dates
	 * @param sheet
	 */
	public void addCellDate(List<String[]> dates, WritableSheet sheet) {
		for (int i = 0; i < dates.size(); i++) {
			String[] date = dates.get(i);
			for (int j = 0; j < date.length; j++) {
				try {
					WritableFont wfc = new WritableFont(WritableFont.ARIAL, 10,
							WritableFont.NO_BOLD, false,
							UnderlineStyle.NO_UNDERLINE);
					WritableCellFormat wcfFC = new WritableCellFormat(wfc);
					wcfFC.setAlignment(Alignment.CENTRE);
					wcfFC.setVerticalAlignment(VerticalAlignment.CENTRE);
					// wcfFC.setBackground(jxl.format.Colour.RED);
					wcfFC.setBorder(jxl.format.Border.ALL,
							jxl.format.BorderLineStyle.THIN);
					jxl.write.Label labelC = new jxl.write.Label(j, i + 2,
							date[j], wcfFC);
					sheet.setRowView(i + 2, 300);
					sheet.setColumnView(j, 20);
					sheet.addCell(labelC);
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
	}
}
