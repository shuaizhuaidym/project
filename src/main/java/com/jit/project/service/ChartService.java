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
import com.jit.project.bean.Project;

public class ChartService extends NameEntityService<Project> implements IChartService {

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
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultPieDataset getIssueTypeDataset(String begin, String end) {
		Sql sql = Sqls.create("select issue_type, count(prj_id) as data from t_project "
				+ "where DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) " + "GROUP BY issue_type");
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
	 * 行业分类数据集合获取
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultPieDataset getIndustryDataset(String begin, String end) {
		Sql sql = Sqls.create("select industry, count(prj_id) as data from t_project "
				+ "where DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) " + "GROUP BY industry");
		sql.params().set("begin", begin);
		sql.params().set("end", end);
		DefaultPieDataset dataset = new DefaultPieDataset();
		// 数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartPie> list = new LinkedList<ChartPie>();
				while (rs.next())
					list.add(new ChartPie(rs.getString("industry"), rs.getInt("data")));
				System.out.println(list.size());
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
}
