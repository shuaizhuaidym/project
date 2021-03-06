package util;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

/**
 * QC数据库数据同步
 * 
 * @author yanming_dai
 * @date 2017年6月20日
 */
public class SQLServer {
	static Logger logger = LogManager.getLogger(SQLServer.class);
	static final String default_modify_date="2015-01-01 00:00:00";
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
		Connection conn = null;
		try {
			Class.forName(driverName).newInstance();
		} catch (Exception ex) {
			System.out.println("驱动加载失败");
			ex.printStackTrace();
		}
		try {
			conn = DriverManager.getConnection(dbURL, userName, userPwd);
			logger.info("成功连接QC数据库！");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conn;
	}

	public static void main(String[] args) {
		Connection conn = SQLServer.getConnectionSqlServer();
		// SQLServer.listTables(conn);
		List<String[]> bgs = SQLServer.fetchBug(conn, false, false, "2017-06-20 12:20:23");
		System.out.println(bgs);
	}

	/**
	 * 查询QC数据库
	 * 
	 * @return
	 */
	public static List<String[]> queryQC(String timeStamp) {
		Connection conn = SQLServer.getConnectionSqlServer();
		return SQLServer.fetchBug(conn, false, false, timeStamp);
	}

	/**
	 * 查询BUG
	 * 
	 * @param conn
	 */
	protected static List<String[]> fetchBug(Connection conn, boolean fullCol, boolean debug,
			String timeStamp) {
		String sql = "select * from td.BUG where BG_STATUS in('新建','打开','重新打开') and (DATEDIFF([SECOND], bg_last_modify,'"
				+ timeStamp + "')<0 )";
		PreparedStatement preparedStatement;
		List<String[]> columns = new LinkedList<String[]>();
		try {
			logger.info(sql);
			preparedStatement = conn.prepareStatement(sql);

			ResultSet rs = preparedStatement.executeQuery();

			List<String> cols = new LinkedList<String>();
			List<Integer> types = new LinkedList<Integer>();
			ResultSetMetaData meta = rs.getMetaData();
			for (int i = 1; i <= meta.getColumnCount(); i++) {
				// System.out.println(meta.getColumnName(i) + "\ttype:-" +
				cols.add(meta.getColumnName(i));
				types.add(meta.getColumnType(i));
			}
			StringBuilder row = null;
			while (rs.next()) {// 判断是否还有下一个数据
				row = new StringBuilder();
				String[] column = new String[9];
				if (fullCol) {
					for (int col = 0; col < cols.size(); col++) {
						row.append(getVal(rs, cols.get(col), types.get(col)));
					}
				} else {
					column[0] = getVal(rs, "BG_BUG_ID", -4);
					column[1] = getVal(rs, "BG_STATUS", -12);
					column[2] = getVal(rs, "BG_RESPONSIBLE", -12);
					column[3] = getVal(rs, "BG_SUMMARY", -12);
					column[4] = getVal(rs, "BG_DESCRIPTION", -1);
					column[5] = getVal(rs, "BG_DETECTED_BY", -12);
					column[6] = getVal(rs, "BG_DETECTION_DATE", -151);
					column[7] = getVal(rs, "BG_DETECTION_VERSION", -12);
					column[8] = getVal(rs, "BG_LAST_MODIFY", -151);
					
					row.append(getVal(rs, "BG_BUG_ID", -4)).append(":");
					row.append(getVal(rs, "BG_STATUS", -12)).append(":");
					row.append(getVal(rs, "BG_RESPONSIBLE", -12)).append(":");
					row.append(getVal(rs, "BG_SUMMARY", -12)).append(":");
					row.append(getVal(rs, "BG_DESCRIPTION", -1)).append(":");
					row.append(getVal(rs, "BG_DETECTED_BY", -12)).append(":");
					row.append(getVal(rs, "BG_DETECTION_DATE", -151)).append(":");
					row.append(getVal(rs, "BG_DETECTION_VERSION", -12)).append(":");
					row.append(getVal(rs, "BG_LAST_MODIFY", -151));
				}
				columns.add(column);
				if (debug) {
					System.out.println(row.toString());
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(conn);
		}
		return columns;
	}

	/**
	 * 获取不同类型属性值
	 * 
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
			return filterChar(rs.getString(name));
		case -151:
			Timestamp dt = rs.getTimestamp(name);
			return dt == null ? default_modify_date : dt.toString();
		default:
			return "";
		}
	}

	private static String filterChar(String src) {
		if (src == null || (src.indexOf("'") < 0 && src.indexOf("\"") < 0 && src.indexOf("`") < 0)) {
			return src;
		}
		String normal = src.replace("'", "").replace("\"", "").replace("`", "");
		return normal;
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
}
