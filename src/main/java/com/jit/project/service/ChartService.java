package com.jit.project.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.service.NameEntityService;

import com.jit.project.bean.ChartBar;
import com.jit.project.bean.ChartPie;
import com.jit.project.project.bean.Project;
import com.jit.project.report.bean.Report;

public class ChartService extends NameEntityService<Project> implements IChartService {

	private static final String STATE_RUN = "进行中";
	private static final String STATE_END = "已完成";
	/**
	 * 按负责人统计柱状图数据集
	 * 
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultCategoryDataset getEngineerBarDataset(String begin, String end) {
		// JFREECHART 数据集合
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		// NUTZ自定义查询
		Sql sql = Sqls.create("SELECT engineer,count(prj_id) as data from t_project "
				+ "WHERE DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) GROUP BY engineer;");
		sql.params().set("begin", begin);
		sql.params().set("end", end);
		// 数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartBar> list = new LinkedList<ChartBar>();
				while (rs.next())
					list.add(new ChartBar(rs.getString("engineer"), rs.getInt("data")));
				return list;
			}
		});
		dao().execute(sql);
		// 转换
		for (ChartBar bar : sql.getList(ChartBar.class)) {
			dataset.addValue(bar.getData(), "", bar.getEngineer());
		}
		return dataset;
	}

	/**
	 * 问题分类数据集合获取
	 * 
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultPieDataset getIssueTypeDataset(String begin, String end) {
		Sql sql = Sqls.create("select issue_type, count(prj_id) as data from t_project "
				+ "where DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) "
				+ "GROUP BY issue_type");
		sql.params().set("begin", begin);
		sql.params().set("end", end);
		DefaultPieDataset dataset = new DefaultPieDataset();
		// 数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartPie> list = new LinkedList<ChartPie>();
				while (rs.next())
					list.add(new ChartPie(rs.getString("issue_type"), rs.getInt("data")));
				return list;
			}
		});
		dao().execute(sql);
		// 转换
		for (ChartPie pie : sql.getList(ChartPie.class)) {
			dataset.setValue(pie.getCategory(), new Double(pie.getData()));
		}
		return dataset;
	}

	/**
	 * 行业分类饼图，数据集合获取
	 * 
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultPieDataset getIndustryDataset(String begin, String end) {
		Sql sql = Sqls.create("select industry, count(prj_id) as data from t_project "
				+ "where DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) "
				+ "GROUP BY industry");
		sql.params().set("begin", begin);
		sql.params().set("end", end);
		DefaultPieDataset dataset = new DefaultPieDataset();
		// 数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartPie> list = new LinkedList<ChartPie>();
				while (rs.next())
					list.add(new ChartPie(rs.getString("industry"), rs.getInt("data")));
				return list;
			}
		});
		dao().execute(sql);
		// 转换
		for (ChartPie pie : sql.getList(ChartPie.class)) {
			dataset.setValue(pie.getCategory(), new Double(pie.getData()));
		}
		return dataset;
	}

	/**
	 * 按时间段统计折线图，数据集获取
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultCategoryDataset getRangeDataset(String begin, String end) {
		Sql sql = Sqls
				.create("select month(submit_date) as label, count(prj_id) as data "
						+ "from t_project "
						+ "where submit_date BETWEEN DATE(@begin) and DATE(@end) group by month(submit_date)");

		sql.params().set("begin", begin);
		sql.params().set("end", end);
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		// 数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartBar> list = new LinkedList<ChartBar>();
				while (rs.next())
					list.add(new ChartBar(rs.getString("label"), rs.getInt("data")));//FIXME 公用实体
				return list;
			}
		});
		dao().execute(sql);
		// 转换
		for (ChartBar bar : sql.getList(ChartBar.class)) {
			dataset.addValue(bar.getData(), "", bar.getEngineer());
		}
		return dataset;
	}
	
	/**
	 * 人力统计
	 * 默认以周为单位，统计状态为 进行中的|已完成&完成时间 between(本周一&&本周末)
	 */
	//TODO 通过任务名称和ID共同关联任务,避免项目支持和开发任务主键重复
	public List<Report> labor_count(String begin, String end) {
		Sql sql = Sqls.create("SELECT work_name,industry,work_type,work_content,manager,engineer,state,"
				+ "process,hours,finish_date,product,module,baseVersion,"
				+ "publishVersion,function,planStartDate,startDate,planEndDate,endDate,"
				+ "arrangedInvestment,investment,work_content " + "FROM labor_statistics WHERE "
				+ "instr(state, @state_run) > 0 AND update_time "
				+ "BETWEEN @monday AND DATE_ADD(@sunday,INTERVAL 1 DAY) "
				+ "OR state = @state_end AND finish_date BETWEEN @monday AND DATE_ADD(@sunday,INTERVAL 1 DAY)");
		
		sql.params().set("state_run", STATE_RUN);
		sql.params().set("state_end", STATE_END);
		sql.params().set("monday", begin);
		sql.params().set("sunday", end);
		
		// 数据处理
		final List<Report> list = new LinkedList<Report>();
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				while (rs.next()) {
					Report r = new Report(rs.getString("work_name"), rs.getString("industry"), rs
							.getString("work_type"), rs.getString("manager"), rs.getString("state"), rs
							.getString("product"), rs.getString("module"), rs.getString("baseVersion"), rs
							.getString("publishVersion"), rs.getString("function"), rs.getString("engineer"), rs
							.getString("planStartDate"), rs.getString("startDate"), rs.getString("planEndDate"), rs
							.getString("endDate"), rs.getString("arrangedInvestment"), rs.getString("investment"), rs
							.getString("process"), rs.getString("work_content"));
					list.add(r);
				}
				return list;
			}
		});
		dao().execute(sql);

		return list;
	}
}
