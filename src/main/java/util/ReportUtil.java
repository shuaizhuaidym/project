package util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
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

	public void exportExcel(String title, String[] headers, List<Project> dataset, String file) {
		// 声明一个工作薄
		HSSFWorkbook workbook = new HSSFWorkbook();
		// 生成一个表格
		HSSFSheet sheet = workbook.createSheet(title);
		// 设置表格默认列宽度为15个字节
		sheet.setDefaultColumnWidth(15);
		// 生成一个样式
		HSSFCellStyle style = createStyle(workbook, HSSFColor.LIGHT_ORANGE.index, HSSFFont.BOLDWEIGHT_BOLD);
		// 生成并设置另一个样式
		HSSFCellStyle style2 = createStyle(workbook, HSSFColor.LIGHT_YELLOW.index, HSSFFont.BOLDWEIGHT_NORMAL);
		HSSFCellStyle style3 = createStyle(workbook, HSSFColor.LIGHT_YELLOW.index, HSSFFont.BOLDWEIGHT_NORMAL);

		CreationHelper helper = workbook.getCreationHelper();
		style3.setDataFormat(helper.createDataFormat().getFormat("yyyy-mm-dd"));
		// 产生表格标题行
		int rdex = 0;
		HSSFRow rowHeader = sheet.createRow(rdex++);
		for (int i = 0; i < headers.length; i++) {
			HSSFCell cell = rowHeader.createCell(i);
			cell.setCellStyle(style);
			HSSFRichTextString text = new HSSFRichTextString(headers[i]);
			cell.setCellValue(text);
		}
		// 遍历集合数据，产生数据行
		int cdex = 0;
		for (Project prj : dataset) {
			rowHeader = sheet.createRow(rdex++);

			createCell(rowHeader, style2, cdex++, prj.getPrjName());
			createCell(rowHeader, style2, cdex++, prj.getIndustry());
			createCell(rowHeader, style2, cdex++, prj.getIssueType());
			createCell(rowHeader, style2, cdex++, prj.getPrudectVersion());
			createCell(rowHeader, style2, cdex++, prj.getDescribtion());
			createCell(rowHeader, style3, cdex++, prj.getSubmitDate());
			createCell(rowHeader, style2, cdex++, prj.getStatus());
			createCell(rowHeader, style2, cdex++, prj.getEngineer());
			createCell(rowHeader, style2, cdex++, prj.getReporter());
			createCell(rowHeader, style2, cdex++, prj.getContact());
			createCell(rowHeader, style3, cdex++, prj.getFinishDate());
			createCell(rowHeader, style2, cdex++, prj.getProcess());
			createCell(rowHeader, style2, cdex++, prj.getLaborCosts());
		}
		FileOutputStream fileOut = null;
		try {
			fileOut = new FileOutputStream(file);
			workbook.write(fileOut);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fileOut.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
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

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		// 生成一个字体
		HSSFFont font = workbook.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(fontWeight);
		// 把字体应用到当前的样式
		style.setFont(font);
		return style;
	}

	public static void main(String[] args) {
		Project p = new Project("水利部安全平台", "政府/综合", "2.0", "网关服务器", "升级后打不开网页", new Date(), "进行中", "朱元璋", new Date(),
				0.6F, "李林洋", "13593284098", "一看二摸三诊脉");
		List<Project> rs = new ArrayList<Project>();
		rs.add(p);
		String[] hdr = new String[] { "项目名称", "行业", "问题类型", "产品版本", "问题描述", "提交日期", "状态", "工程师", "工程", "联系方式", "结束日期",
				"处理过程", "人力成本" };
		ReportUtil u = new ReportUtil();
		u.exportExcel("工程报表", hdr, rs, "D:/ppsfile/workbook.xls");
	}
}