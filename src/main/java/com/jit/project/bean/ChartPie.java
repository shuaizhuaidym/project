package com.jit.project.bean;
/**
 * 饼图查询实体
 * @author daiyma
 *
 */
public class ChartPie implements IChartBean {
	
	private String category;
	
	private int data;

	public ChartPie(String category, int data) {
		super();
		this.category = category;
		this.data = data;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

}
