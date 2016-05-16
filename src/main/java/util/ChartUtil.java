package util;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.Paint;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.ValueMarker;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.title.TextTitle;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.ui.Layer;
import org.jfree.ui.TextAnchor;
import org.jfree.util.Rotation;

public class ChartUtil {
	
	protected static final Font titleFont=new Font("黑体", java.awt.Font.CENTER_BASELINE, 32);
	protected static final Font labelFont = new Font("宋体", Font.PLAIN, 16);
	protected static final Font stickLabelFont = new Font("sans-serif", Font.PLAIN, 12);
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
		CategoryPlot categoryplot = (CategoryPlot) chart.getPlot();
		categoryplot.setForegroundAlpha(0.8f);
		// 数值
		CustomBarRenderer3D barRenderer3D = new CustomBarRenderer3D();
		barRenderer3D.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		barRenderer3D.setBaseItemLabelsVisible(true);
		barRenderer3D.setItemLabelAnchorOffset(10.0D);
		barRenderer3D.setBasePositiveItemLabelPosition(new ItemLabelPosition(ItemLabelAnchor.OUTSIDE12,
				TextAnchor.BASELINE_LEFT));
		categoryplot.setRenderer(barRenderer3D);

		ValueMarker localValueMarker = new ValueMarker(0.7D, new Color(200, 200, 255), new BasicStroke(1.0F),
				new Color(200, 200, 255), new BasicStroke(1.0F), 1.0F);
		categoryplot.addRangeMarker(localValueMarker, Layer.BACKGROUND);
		barRenderer3D.setBaseItemLabelsVisible(true);
		barRenderer3D.setMaximumBarWidth(0.05D);
		// 中文乱码
		NumberAxis numberaxis = (NumberAxis) categoryplot.getRangeAxis();
		CategoryAxis domainAxis = categoryplot.getDomainAxis();
		chart.getTitle().setFont(titleFont);

		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);

		domainAxis.setTickLabelFont(stickLabelFont);
		domainAxis.setLabelFont(labelFont);// x大标题
		numberaxis.setTickLabelFont(stickLabelFont);
		numberaxis.setLabelFont(labelFont);

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
		JFreeChart chart = ChartFactory.createPieChart3D(title, dataset, true, true, false);
		chart.getTitle().setFont(titleFont);
		PiePlot3D piePlot3D = (PiePlot3D) chart.getPlot();
		piePlot3D.setDarkerSides(true);
		piePlot3D.setStartAngle(290.0D);
		piePlot3D.setDirection(Rotation.CLOCKWISE);
		piePlot3D.setForegroundAlpha(0.8F);
		piePlot3D.setNoDataMessage("No data to display");
		// 中文乱码,饼图标签字体
		piePlot3D.setLabelFont(labelFont);
		// 设置图例说明Legend上的文字
		chart.getLegend().setItemFont(labelFont);
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

	static class CustomBarRenderer3D extends BarRenderer3D {
		private static final long serialVersionUID = -3439250645727206023L;
		public Paint getItemPaint(int paramInt1, int paramInt2) {
			return new Color(200, 32, 32);
		}
	}
}
