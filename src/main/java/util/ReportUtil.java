package util;

import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.CreationHelper;

import com.jit.project.bean.Project;

public class ReportUtil {
	/**
	 * 生成Excel输出到IO
	 * @param title
	 * @param headers
	 * @param dataset
	 * @param stream
	 */
	public void exportExcel(String title, String[] headers, List<Project> dataset, OutputStream stream){
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		// 设置表格默认列宽度为15个字节
		sheet.setDefaultColumnWidth(15);
		// 表头样式
		HSSFCellStyle style = createStyle(workbook, HSSFColor.LIGHT_ORANGE.index, HSSFFont.BOLDWEIGHT_BOLD);
		// 内容样式样式
		HSSFCellStyle style2 = createStyle(workbook, HSSFColor.WHITE.index, HSSFFont.BOLDWEIGHT_NORMAL);
		//日期样式
		HSSFCellStyle style3 = createStyle(workbook, HSSFColor.WHITE.index, HSSFFont.BOLDWEIGHT_NORMAL);

		CreationHelper helper = workbook.getCreationHelper();
		style3.setDataFormat(helper.createDataFormat().getFormat("yyyy-mm-dd"));
		// 产生表格标题行
		int rdex = 0;
		HSSFRow rowHeader = sheet.createRow(rdex++);
		for (int i = 0; i < headers.length; i++) {
			HSSFCell cell = rowHeader.createCell(i);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellStyle(style);
			cell.setCellValue(text);
		}
		// 遍历集合数据，产生数据行
		for (Project prj : dataset) {
			HSSFRow row = sheet.createRow(rdex++);
			int cdex = 0;
			createCell(row, style2, cdex++, prj.getPrjName());
			createCell(row, style2, cdex++, prj.getIndustry());
			createCell(row, style2, cdex++, prj.getIssueType());
			createCell(row, style2, cdex++, prj.getPrudectVersion());
			createCell(row, style2, cdex++, prj.getDescribtion());
			createCell(row, style3, cdex++, prj.getSubmitDate());
			createCell(row, style2, cdex++, prj.getStatus());
			createCell(row, style2, cdex++, prj.getEngineer());
			createCell(row, style2, cdex++, prj.getReporter());
			createCell(row, style2, cdex++, prj.getContact());
			createCell(row, style3, cdex++, prj.getFinishDate());
			createCell(row, style2, cdex++, prj.getProcess());
			createCell(row, style2, cdex++, prj.getLaborCosts());
		}
		try {
			workbook.write(stream);
		} catch (IOException e) {
			e.printStackTrace();
		} 
	}

	// 字符串类型
	private void createCell(HSSFRow row, HSSFCellStyle cstyle, int index, String value) {
		HSSFCell cell = row.createCell(index);
		HSSFRichTextString richString = new HSSFRichTextString(value);
		cell.setCellValue(richString);
		cell.setCellStyle(cstyle);
	}

	// 日期
	private void createCell(HSSFRow row, HSSFCellStyle cstyle, int index, Date value) {
		HSSFCell cell0 = row.createCell(index);
		cell0.setCellValue(value);
		cell0.setCellStyle(cstyle);
	}

	// 浮点数值
	private void createCell(HSSFRow row, HSSFCellStyle cstyle, int index, Float value) {
		HSSFCell cell0 = row.createCell(index);
		cell0.setCellValue(value);
		cell0.setCellStyle(cstyle);
	}

	// create cell style
	private HSSFCellStyle createStyle(HSSFWorkbook workbook, short foreColor, short fontWeight) {
		HSSFCellStyle style = workbook.createCellStyle();
		// 设置这些样式
		style.setFillForegroundColor(foreColor);
		style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);

		style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		style.setBorderTop(HSSFCellStyle.BORDER_THIN);

		style.setAlignment(HSSFCellStyle.ALIGN_LEFT);
		// 生成一个字体
		HSSFFont font = workbook.createFont();
		font.setFontName("宋体");
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(fontWeight);
		// 把字体应用到当前的样式
		style.setFont(font);
		return style;
	}
}
