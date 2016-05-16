package com.jit.project.web;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jfree.data.category.CategoryDataset;
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

import com.jit.project.bean.Project;
import com.jit.project.bean.Query;
import com.jit.project.service.ChartService;
import com.jit.project.service.PrjService;

/**
 * 报表
 * 
 * @author daiyma
 * 
 */
@InjectName("chartAction")
public class ChartAction {

	@Inject("prjService")
	private PrjService prjService;

	@Inject("reportUtil")
	private ReportUtil reportUtil;

	@Inject("chartService")
	private ChartService chartService;

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
	public OutputStream export(HttpServletRequest request, HttpServletResponse response, @Param("::query.") Query query) {
		if (query == null) {
			query = new Query(1024);
		}
		query.setPageSize(1024);
		// query data
		QueryResult qResult = prjService.query(query);

		OutputStream out = null;
		try {
			response.addHeader("Content-Disposition", "attachment;filename=prj_export.xls");
			response.setContentType("application/msexcel;charset=UTF-8");
			out = response.getOutputStream();
			reportUtil.exportExcel(Const.title, Const.headers, (List<Project>) qResult.getList(), out);
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
	 * @return
	 */
	@At("/chart")
	@Ok("jsp:views.chart.chart")
	public String chart(){
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
		CategoryDataset dataset = chartService.getEngineerBarDataset("2014-03-24", "2016-05-01");
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawEngineer("个人工作统计量图", "负责人", "项目数量", dataset, stream);
		return stream;
	}
	
	/**
	 * 统计问题类型
	 */
	@At("/issue_type_pie")
	@Ok("raw:stream")
	public OutputStream drawIssueTypeBar(HttpServletResponse response, @Param("begin") String begin,
			@Param("end") String end) {
		response.setContentType("image/jpeg");
		DefaultPieDataset dataset = chartService.getIssueTypeDataset("2014-03-24", "2016-05-01");
		OutputStream stream = null;
		try {
			stream = response.getOutputStream();
		} catch (Exception e) {
			e.printStackTrace();
		}
		ChartUtil.drawIssueType("问题分类统计图", dataset, stream);
		return stream;
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
