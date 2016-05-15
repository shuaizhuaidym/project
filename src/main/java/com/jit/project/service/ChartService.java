package com.jit.project.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import org.jfree.data.category.DefaultCategoryDataset;
import org.nutz.dao.Sqls;
import org.nutz.dao.sql.Sql;
import org.nutz.dao.sql.SqlCallback;
import org.nutz.service.NameEntityService;

import com.jit.project.bean.ChartBar;
import com.jit.project.bean.Project;

public class ChartService extends NameEntityService<Project> implements IChartService {

	/**
	 * 按负责人统计柱状图数据集
	 * @param begin
	 * @param end
	 * @return
	 */
	public DefaultCategoryDataset getEngineerBarDataset(String begin, String end) {
		//JFREECHART 数据集合
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		//NUTZ自定义查询
		Sql sql = Sqls.create("SELECT engineer,count(prj_id) as data from t_project "
				+ "WHERE DATE(submit_date) BETWEEN DATE(@begin) and DATE(@end) GROUP BY engineer;");
		sql.params().set("begin", begin);
		sql.params().set("end", end);
		//数据处理
		sql.setCallback(new SqlCallback() {
			public Object invoke(Connection conn, ResultSet rs, Sql sql) throws SQLException {
				List<ChartBar> list = new LinkedList<ChartBar>();
				while (rs.next())
					list.add(new ChartBar(rs.getString("engineer"),rs.getInt("data"))); 
				return list;
			}
		});
		dao().execute(sql);
		//转换
		for(ChartBar bar:sql.getList(ChartBar.class)){
			dataset.addValue(bar.getData(), "", bar.getEngineer()); 
		}
		return dataset;
	}
}
