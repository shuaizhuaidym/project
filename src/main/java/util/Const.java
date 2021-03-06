package util;

public class Const {
	public static final String DRIVER = "com.mysql.jdbc.Driver";
	public static final String DB_NAME = "project";
	public static final String USERNAME = "root";
	public static final String PASSWORD = "admin";
	public static final String IP = "127.0.0.1";
	public static final String PORT = "3306";
	public static final String URL = "jdbc:mysql://" + IP + ":" + PORT + "/" + DB_NAME;
	public static final String sql = "INSERT INTO `t_project`"
			+ "(`prj_name`,`industry`,`product_version`,`issue_type`,`describtion`,`submit_date`,`status`,`engineer`,`engineer_tel`,"
			+ "`finish_date`,`labor_costs`,`reporter`,`contact`,`process`,`improvement`,`comments`,`last_response`,`operator_ip`) "
			+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	public static final String[] headers = new String[] { "项目名称", "行业", "问题类型", "产品版本", "问题描述", "提交日期", "状态", "工程师", "工程", "联系方式",
			"结束日期", "处理过程", "人力成本" };
	public static final String title = "项目支持跟踪表";
}
