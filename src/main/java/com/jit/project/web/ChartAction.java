package com.jit.project.web;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import util.ChartUtil;
import util.Const;
import util.ReportUtil;

import com.jit.project.bean.Query;
import com.jit.project.project.bean.Project;
import com.jit.project.project.service.PrjService;
import com.jit.project.report.bean.DeptReport;
import com.jit.project.report.bean.Report;
import com.jit.project.service.ChartService;

/**
 * 报表
 * 
 * @author daiyma
 * 
 */
@InjectName("chartAction")
public class ChartAction {
	//工作类型统计
	final String count_type = "mission_type";
	//行业统计
	final String count_industry = "industry";

	@Inject("prjService")
	private PrjService prjService;

	@Inject("reportUtil")
	private ReportUtil reportUtil;

	@Inject("chartService")
	private ChartService chartService;
	
	private static final int MAX_EXPORT_COUNT=10240;

	/**
	 * 导出Excel
	 * 
	 * @param request
	 * @param response
	 * @param query
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	@At("/prj_export")
	@Ok("raw:stream")
	public OutputStream export(HttpServletRequest request, HttpServletResponse response,
			@Param("::query.") Query query) {
		if (query == null) {
			query = new Query();
		}
		//导出不分页
		query.setPageNumber(1);
		query.setPageSize(MAX_EXPORT_COUNT);
		// query data
		QueryResult qResult = prjService.query(query);

		OutputStream out = null;
		try {
			response.addHeader("Content-Disposition", "attachment;filename=prj_export.xls");
			response.setContentType("application/msexcel;charset=UTF-8");
			out = response.getOutputStream();
			reportUtil.exportExcel(Const.title, Const.headers, (List<Project>) qResult.getList(),
					out);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				out.flush();
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return out;
	}

	/**
	 * 跳转到chart页面
	 * 
	 * @return
	 */
	@At("/chart")
	@Ok("jsp:views.chart.chart")
	public String chart() {
		return null;
	}

	/**
	 * 统计个人工作量
	 */
	@At("/engineer_bar")
	@Ok("raw:stream")
	public OutputStream drawEngineerBar(HttpServletResponse response, @Param("begin") String begin,
			@Param("end") String end) {
		response.setContentType("image/jpeg");
		CategoryDataset dataset = chartService.getEngineerBarDataset(begin, end);
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawEngineer("负责人统计图", "负责人", "项目数量", dataset, stream);
		return stream;
	}

	/**
	 * 统计问题类型
	 */
	@At("/issue_type_pie")
	@Ok("raw:stream")
	public OutputStream drawIssueTypePie(HttpServletResponse response,
			@Param("begin") String begin, @Param("end") String end) {
		response.setContentType("image/jpeg");
		DefaultPieDataset dataset = chartService.getIssueTypeDataset(begin, end);
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawPie("问题分类统计图", dataset, stream);
		return stream;
	}

	/**
	 * 按行业分类，饼图
	 * 
	 * @param response
	 * @param begin
	 * @param end
	 * @return
	 */
	@At("/industry_pie")
	@Ok("raw:stream")
	public OutputStream drawIndustryPie(HttpServletResponse response, @Param("begin") String begin,
			@Param("end") String end) {
		response.setContentType("image/jpeg");
		DefaultPieDataset dataset = chartService.getIndustryDataset(begin, end);
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawPie("行业分类统计图", dataset, stream);
		return stream;
	}

	/**
	 * 时间段统计，折线图
	 * 
	 * @param response
	 * @param begin
	 * @param end
	 * @return
	 * @throws FileNotFoundException 
	 */
	@At("/range_line")
	@Ok("raw:stream")
	public OutputStream drawRangeLine(HttpServletResponse response, @Param("begin") String begin,
			@Param("end") String end) throws FileNotFoundException {
		response.setContentType("image/jpeg");
		DefaultCategoryDataset dataset = chartService.getRangeDataset(begin, end);
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawRangeLine("时间段统计图","2014-03-24——2016-05-01","项目数量", dataset, stream);
		return stream;
	}
	
	/**
	 * 部门周报表
	 * 包含：任务明细表，工作类型统计，行业统计 三个报表一起加载
	 * 
	 * @param type
	 * @return
	 */
	@At("/labor_count")
	@Ok("jsp:views.chart.report")
	public List<Report> labor_count(@Param("begin") String begin, @Param("end") String end,
			@Param("count_type") String countType, HttpServletRequest request) {
		//TODO count_detail 要包含BUG
		List<Report> count_detail = chartService.labor_count(begin, end);
		List<DeptReport> reportType = chartService.typeCount(begin, end, this.count_type);
		List<DeptReport> reportIndustry = chartService.typeCount(begin, end, this.count_industry);
		
		request.setAttribute("count_type", reportType);
		request.setAttribute("count_industry", reportIndustry);
		return count_detail;
	}
	
	@At("/labor_count_index")
	@Ok("jsp:views.chart.report")
	public List<Report> labor_count_index(HttpServletRequest request){
		List<Report> count_detail = new ArrayList<Report>();
		List<DeptReport> reportType = new ArrayList<DeptReport>();
		List<DeptReport> reportIndustry = new ArrayList<DeptReport>();
		
		request.setAttribute("count_type", reportType);
		request.setAttribute("count_industry", reportIndustry);
		return count_detail;
	}
	
	public List<DeptReport>deptCount(){
		return null;
	}

	protected PrjService getPrjService() {
		return prjService;
	}

	protected void setPrjService(PrjService prjService) {
		this.prjService = prjService;
	}

	public ReportUtil getReportUtil() {
		return reportUtil;
	}

	public void setReportUtil(ReportUtil reportUtil) {
		this.reportUtil = reportUtil;
	}

	public ChartService getChartService() {
		return chartService;
	}

	public void setChartService(ChartService chartService) {
		this.chartService = chartService;
	}

}
