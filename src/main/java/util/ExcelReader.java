package util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.jit.project.bean.Project;

public class ExcelReader<T> {

	/**
	 * 读取Excel2003-2007文件
	 * 
	 * @param file
	 * @return
	 */
	public List<Project> readExcelXls(String file) {
		List<Project> list = new ArrayList<Project>();
		InputStream is;
		try {
			is = new FileInputStream(file);
			HSSFWorkbook hssfWorkbook = new HSSFWorkbook(is);
			for (int numSheet = 0; numSheet < hssfWorkbook.getNumberOfSheets(); numSheet++) {
				HSSFSheet hssfSheet = hssfWorkbook.getSheetAt(numSheet);
				if (hssfSheet == null) {
					continue;
				}
				// Read the Row
				for (int rowNum = 1; rowNum <= hssfSheet.getLastRowNum(); rowNum++) {
					HSSFRow hssfRow = hssfSheet.getRow(rowNum);
					if (hssfRow != null) {
						HSSFCell cell = hssfRow.getCell(0);
						System.out.println(cell);
					}
				}
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return list;
	}

	/**
	 * Read the Excel 2010
	 * 
	 * @param path the path of the excel file
	 * @return xssfWorkbook.getNumberOfSheets()
	 * @throws IOException
	 */
	public List<Project> readXlsx(String path) throws IOException {
		InputStream is = new FileInputStream(path);
		XSSFWorkbook xssfWorkbook = new XSSFWorkbook(is);
		Project prj = null;
		List<Project> list = new ArrayList<Project>();
		// Read the Sheet
		for (int numSheet = 0; numSheet < 1; numSheet++) {
			XSSFSheet xssfSheet = xssfWorkbook.getSheetAt(numSheet);
			if (xssfSheet == null) {
				continue;
			}
			// Read the Row
			for (int rowNum = 1; rowNum <= xssfSheet.getLastRowNum(); rowNum++) {
				XSSFRow xssfRow = xssfSheet.getRow(rowNum);
				if (xssfRow != null) {
					
					prj = new Project();
					XSSFCell name = xssfRow.getCell(0);
					XSSFCell indr = xssfRow.getCell(1);
					XSSFCell ver = xssfRow.getCell(2);
					XSSFCell type = xssfRow.getCell(3);
					XSSFCell desc = xssfRow.getCell(4);

					prj.setPrjName(getValue(name));
					prj.setIndustry(getValue(indr));
					prj.setPrudectVersion(getValue(ver));
					prj.setIssueType(getValue(type));
					prj.setDescribtion(getValue(desc));

					XSSFCell subDate = xssfRow.getCell(5);
					XSSFCell finDate = xssfRow.getCell(6);
					XSSFCell state = xssfRow.getCell(7);
					XSSFCell engineer = xssfRow.getCell(8);
					// TODO
					XSSFCell cost = xssfRow.getCell(9);

					prj.setSubmitDate(getDateValue(subDate));
					prj.setFinishDate(getDateValue(finDate));
					prj.setStatus(getValue(state));
					prj.setEngineer(getValue(engineer));
					prj.setEngineerTel("62618866");

					XSSFCell contact = xssfRow.getCell(10);
					XSSFCell tel = xssfRow.getCell(11);
					XSSFCell proc = xssfRow.getCell(12);
					XSSFCell comm = xssfRow.getCell(13);
					XSSFCell impr = xssfRow.getCell(14);

					prj.setLaborCosts(getNumberValue(cost));
					prj.setReporter(getValue(contact));
					prj.setContact(getValue(tel));
					prj.setProcess(getValue(proc));
					prj.setComments(getValue(comm));
					prj.setImprovement(getValue(impr));

					list.add(prj);
				}
			}
		}
		return list;
	}

	// TODO 综合
	protected Object getPValue(XSSFCell xssfCell) {
		return new Date();
	}

	// 获取日期
	protected java.sql.Date getDateValue(XSSFCell xssfCell) {
		java.sql.Date d = null;
		String raw = getValue(xssfCell);
		if ("NULL".equals(raw)) {
			try {
				d = new java.sql.Date(java.text.DateFormat.getDateInstance().parse("1970-1-1").getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			try {
				d = new java.sql.Date(java.text.DateFormat.getDateInstance().parse(raw.trim()).getTime());
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		return d;
	}

	// 数字
	protected float getNumberValue(XSSFCell xssfCell) {
		String raw = getValue(xssfCell);
		if ("NULL".equals(raw) || StringUtils.isEmpty(raw)) {
			return 0.0F;
		}
		return Float.parseFloat(raw);
	}

	@SuppressWarnings("static-access")
	private String getValue(XSSFCell xssfCell) {
		if (xssfCell == null) {
			return "NULL";
		} else if (xssfCell.getCellType() == xssfCell.CELL_TYPE_NUMERIC) {
			String result = null;
			// 处理日期格式、时间格式
			if (HSSFDateUtil.isCellDateFormatted(xssfCell)) {
				SimpleDateFormat sdf = null;
				if (xssfCell.getCellStyle().getDataFormat() == HSSFDataFormat.getBuiltinFormat("h:mm")) {
					sdf = new SimpleDateFormat("HH:mm");
				} else {// 日期
					sdf = new SimpleDateFormat("yyyy-MM-dd");
				}
				Date date = xssfCell.getDateCellValue();
				result = sdf.format(date);
			} else if (xssfCell.getCellStyle().getDataFormat() == 58) {
				// 处理自定义日期格式：m月d日(通过判断单元格的格式id解决，id的值是58)
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				double value = xssfCell.getNumericCellValue();
				Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
				result = sdf.format(date);
			} else {
				double value = xssfCell.getNumericCellValue();
				CellStyle style = xssfCell.getCellStyle();
				DecimalFormat format = new DecimalFormat();
				String temp = style.getDataFormatString();
				// 单元格设置成常规
				if (temp.equals("General")) {
					format.applyPattern("#");
				}
				result = format.format(value);
			}
			return result;
		} else {// 字符串
			String str = String.valueOf(xssfCell.getStringCellValue());
			return str;// str.length() > 10 ? str.substring(0, 10) : str;
		}
	}

	public static void main(String[] args) throws ParseException {
		ExcelReader<Project> u = new ExcelReader<Project>();
		try {
			u.readXlsx("C:/Users/daiyma/Desktop/项目支持跟踪表.xlsx");
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "static-access", "unused" })
	private String getValue(HSSFCell hssfCell) {
		if (hssfCell.getCellType() == hssfCell.CELL_TYPE_BOOLEAN) {
			return String.valueOf(hssfCell.getBooleanCellValue());
		} else if (hssfCell.getCellType() == hssfCell.CELL_TYPE_NUMERIC) {
			return String.valueOf(hssfCell.getNumericCellValue());
		} else {
			String str = String.valueOf(hssfCell.getStringCellValue());
			return str.length() > 10 ? str.substring(0, 10) : str;
		}
	}

}
