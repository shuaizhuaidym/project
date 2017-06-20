package project.db;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;
/**
 * QC数据库测试类，已经测试通过，准备用户QC数据同步
 * @author yanming_dai
 * @date 2017年6月20日
 */
public class SQLServer {
	/**
	 * 获取连接
	 * 
	 * @return
	 */
	public static Connection getConnectionSqlServer() {
		String driverName = "com.microsoft.sqlserver.jdbc.SQLServerDriver"; // 加载JDBC驱动
		String dbURL = "jdbc:sqlserver://172.16.5.30:1433; DatabaseName=gateway30_3018_db"; // 连接服务器和数据库test
		String userName = "sa"; // 默认用户名
		String userPwd = "111111"; // 密码
		Connection dbConn = null;
		try {
			Class.forName(driverName).newInstance();
		} catch (Exception ex) {
			System.out.println("驱动加载失败");
			ex.printStackTrace();
		}
		try {
			dbConn = DriverManager.getConnection(dbURL, userName, userPwd);
			System.out.println("成功连接数据库！");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dbConn;
	}

	public static void main(String[] args) {
		Connection conn = SQLServer.getConnectionSqlServer();
		// SQLServer.listTables(conn);
		SQLServer.fetchBug(conn);

	}

	/**
	 * 查询BUG
	 * 
	 * @param conn
	 */
	public static void fetchBug(Connection conn) {
		String use = "use gateway30_3018_db";
		String sql = "select * from td.BUG";
		PreparedStatement pre;
		PreparedStatement state;
		try {
			pre = conn.prepareStatement(use);
			pre.execute();

			state = conn.prepareStatement(sql);

			ResultSet rs = state.executeQuery();

			List<String> cols = new LinkedList<String>();
			List<Integer> types = new LinkedList<Integer>();
			ResultSetMetaData meta = rs.getMetaData();
			for (int i = 1; i <= meta.getColumnCount(); i++) {
				System.out.println(meta.getColumnName(i) + "\ttype:-" + meta.getColumnType(i));
				cols.add(meta.getColumnName(i));
				types.add(meta.getColumnType(i));
			}
			StringBuilder row = null;
			while (rs.next()) {// 判断是否还有下一个数据
				row = new StringBuilder();
				for (int col = 0; col < cols.size(); col++) {
					row.append(getVal(rs, cols.get(col), types.get(col)));
				}
				System.out.println(row.toString());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
	}

	/**
	 * 获取不同类型属性值
	 * @param rs
	 * @param name
	 * @param type
	 * @return
	 * @throws SQLException
	 */
	private static String getVal(ResultSet rs, String name, Integer type) throws SQLException {
		switch (type) {
		case -4:
			return rs.getInt(name) + "";
			// break;
		case -12:
		case -1:
			return rs.getString(name);
		case -151:
			return rs.getDate(name) + "";
		default:
			return "";
		}

	}

	/**
	 * 查询所有表名称
	 * 
	 * @param conn
	 */
	public static void listTables(Connection conn) {
		DatabaseMetaData meta;
		try {
			meta = conn.getMetaData();
			ResultSet rs = meta.getTables(null, null, "%", null);
			while (rs.next()) {
				System.out.println(rs.getString(3));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void close(Connection conn) {
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	enum dd {

	}
}
