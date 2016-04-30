package project.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.mysql.jdbc.PreparedStatement;

public class Db {
	public static void main(String[] args) throws Exception {
		Connection conn = null;
		String sql;
		// MySQL的JDBC URL编写方式：jdbc:mysql://主机名称：连接端口/数据库的名称?参数=值
		// 避免中文乱码要指定useUnicode和characterEncoding
		// 执行数据库操作之前要在数据库管理系统上创建一个数据库，名字自己定，
		// 下面语句之前就要先创建javademo数据库
		String url = "jdbc:mysql://localhost:3306/test?"
				+ "user=root&password=&useUnicode=true&characterEncoding=UTF8";

		try {
			// 之所以要使用下面这条语句，是因为要使用MySQL的驱动，所以我们要把它驱动起来，
			// 可以通过Class.forName把它加载进去，也可以通过初始化来驱动起来，下面三种形式都可以
			Class.forName("com.mysql.jdbc.Driver");// 动态加载mysql驱动
			// or:
			// com.mysql.jdbc.Driver driver = new com.mysql.jdbc.Driver();
			// or：
			// new com.mysql.jdbc.Driver();

			System.out.println("成功加载MySQL驱动程序");
			// 一个Connection代表一个数据库连接
			conn = DriverManager.getConnection(url);
			// Statement里面带有很多方法，比如executeUpdate可以实现插入，更新和删除等
			sql = "INSERT INTO t_project VALUES ({id}, {name}, 'army', '1.0', 'gw server', 'xiaoyu', '2016-4-20', 'unstart', 'xiaoyu', '111', '2016-4-20', 1, 'xiaoyu', '111', '111', '111', '111', '2016-4-20')";
			java.sql.Statement stmt = conn.createStatement();
//			conn.setAutoCommit(false);
			for (int i = 0; i < 1000; i++) {
//				System.out.println(sql.replace("{id}", i + "").replace("{name}", "'prj_" + i + "'"));
				stmt.execute(sql.replace("{id}", i + "").replace("{name}", "'prj_" + i + "'"));
			}
//			conn.commit();
		} catch (SQLException e) {
			System.out.println("MySQL操作错误");
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			conn.close();
		}
	}
}
