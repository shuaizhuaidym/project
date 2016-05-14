package com.jit.project.web;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nutz.dao.QueryResult;
import org.nutz.ioc.annotation.InjectName;
import org.nutz.ioc.loader.annotation.Inject;
import org.nutz.mvc.annotation.At;
import org.nutz.mvc.annotation.Ok;
import org.nutz.mvc.annotation.Param;

import util.Const;
import util.ReportUtil;

import com.jit.project.bean.Project;
import com.jit.project.bean.Query;
import com.jit.project.service.PrjService;

/**
 * 报表
 * 
 * @author daiyma
 * 
 */
@InjectName("reportAction")
public class ReportAction {

	@Inject("prjService")
	private PrjService prjService;

	@Inject("reportUtil")
	private ReportUtil reportUtil;

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
			query = new Query();
		}
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

	@At("/data/analyse")
	@Ok("jsp:views.report.report")
	public String analyse() {
		// TODO
		return "REPORT";
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

}
