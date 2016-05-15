package util;

import java.awt.Font;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.util.Rotation;

public class ChartUtil {
	/**
	 * 按负责人统计柱状图
	 * 
	 * @param title
	 * @param xlabel
	 * @param ylabel
	 * @param dataset
	 * @return
	 */
	public static JFreeChart drawEngineer(String title, String xlabel, String ylabel, CategoryDataset dataset,
			OutputStream stream) {

		JFreeChart chart = ChartFactory.createBarChart3D(title, // 图表标题
				xlabel, // 目录轴的显示标签
				ylabel, // 数值轴的显示标签
				dataset, // 数据集
				PlotOrientation.VERTICAL, // 图表方向：水平、垂直
				false, // 是否显示图例(对于简单的柱状图必须是 false)
				false, // 是否生成工具
				false // 是否生成 URL 链接
				);
		// 中文乱码
		CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
		categoryplot.setForegroundAlpha(0.8f);
		NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
		CategoryAxis domainAxis = categoryplot.getDomainAxis();
		TextTitle textTitle = chart.getTitle();
		textTitle.setFont(new Font("黑体", Font.PLAIN, 20));

		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

		domainAxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));
		domainAxis.setLabelFont(new Font("宋体", Font.PLAIN, 16));// x大标题
		numberaxis.setTickLabelFont(new Font("sans-serif", Font.PLAIN, 12));
		numberaxis.setLabelFont(new Font("宋体", Font.PLAIN, 16));
		try {
			ChartUtilities.writeChartAsJPEG(stream, 1.0f, chart, 1366, 480, null);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// try {
			// stream.close();
			// } catch (Exception e) {
			// }
		}
		return chart;
	}

	/**
	 * 饼图，按问题分类统计
	 * 
	 * @param title
	 * @param dataset
	 * @param stream
	 * @return
	 */
	public static JFreeChart drawIssueType(String title, DefaultPieDataset dataset, OutputStream stream) {
		JFreeChart chart = ChartFactory.createPieChart3D("Pie Chart 3D Demo 1", dataset, true, true, false);
		PiePlot3D piePlot3D = (PiePlot3D) chart.getPlot();
		piePlot3D.setDarkerSides(true);
		piePlot3D.setStartAngle(290.0D);
		piePlot3D.setDirection(Rotation.CLOCKWISE);
		piePlot3D.setForegroundAlpha(0.8F);
		piePlot3D.setNoDataMessage("No data to display");
		// 中文乱码
		StandardPieSectionLabelGenerator gr=(StandardPieSectionLabelGenerator)piePlot3D.getLegendLabelGenerator();
//		piePlot3D.getLegendLabelGenerator().generateSectionLabel(arg0, arg1)grzh_CN
		piePlot3D.setLabelFont(new Font("宋体", Font.PLAIN, 16));
		try {
			ChartUtilities.writeChartAsJPEG(stream, 1.0f, chart, 1366, 480, null);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// try {
			// stream.close();
			// } catch (Exception e) {
			// }
		}
		return chart;
	}
}
