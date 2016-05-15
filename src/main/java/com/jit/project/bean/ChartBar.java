package com.jit.project.bean;

public class ChartBar implements IChartBean {
	private String engineer;
	private int data;

	public ChartBar(String name, int data) {
		super();
		this.engineer = name;
		this.data = data;
	}

	public int getData() {
		return data;
	}

	public void setData(int data) {
		this.data = data;
	}

	public String getEngineer() {
		return engineer;
	}

	public void setEngineer(String engineer) {
		this.engineer = engineer;
	}

}
