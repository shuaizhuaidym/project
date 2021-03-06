package util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

import util.SQLServer;

import com.jit.project.project.bean.Project;

public class DBUtil {
	static Logger logger = LogManager.getLogger(DBUtil.class);
	
	public static Connection conn = null;
	public static PreparedStatement ps = null;

	static String sqlTimestamp = "SELECT MAX(bg_last_modify) BG_LAST_MODIFY FROM T_BUG;";
	static PreparedStatement psTimestamp = null;
	
	public static void main(String[] args) {
		// importBUG();
		if (conn == null) {
			connect();
		}
//		String stamp = getLastmodify();
//		System.out.println(stamp);
		importBUG();
	}

	/**
	 *导入QC BUG数据
	 */
	public static void importBUG() {
		if (conn == null) {
			connect();
		}
		String stamp = getLastmodify();
		logger.info("The last modify date is:" + stamp);
		
		List<String[]> bugs = SQLServer.queryQC(stamp);
		logger.info("Total get bugs:" + bugs.size());

		StringBuilder sql = new StringBuilder("INSERT INTO `t_bug` (");
		sql.append("`BG_BUG_ID`,");
		sql.append("`BG_STATUS`,");
		sql.append("`BG_RESPONSIBLE`,");
		sql.append("`BG_PROJECT`,");
		sql.append("`BG_SUBJECT`,");
		sql.append("`BG_SUMMARY`,");
		sql.append("`BG_DESCRIPTION`,");
		sql.append("`BG_DEV_COMMENTS`,");
		sql.append("`BG_REPRODUCIBLE`,");
		sql.append("`BG_SEVERITY`,");
		sql.append("`BG_PRIORITY`,");
		sql.append("`BG_DETECTED_BY`,");
		sql.append("`BG_DETECTION_DATE`,");
		sql.append("`BG_DETECTION_VERSION`,");
		sql.append("`BG_PRODUCT`,");
		sql.append("`BG_MODULE`,");
		sql.append("`BG_LAST_MODIFY`");
		sql.append(")");
		sql.append("VALUES");
		sql.append("(");
		sql.append("%s,");// id
		sql.append("'%s',");// status
		sql.append("'%s',");// responsebility
		sql.append("'TECH',");// project
		sql.append("'DEV',");// subject
		sql.append("'%s',");// sumarry
		sql.append("'%s',");//
		sql.append("'dev-commonts',");
		sql.append("'1',");
		sql.append("'serity',");
		sql.append("'priority',");
		sql.append("'%s',");// tester
		sql.append("'%s',");// testdate
		sql.append("'%s',");// version
		sql.append("'Phoenix',");
		sql.append("'Client',");
		sql.append("'%s'");
		sql.append(");");
		try {
			int i = 0;
			for (String[] b : bugs) {
				String bql = String.format(sql.toString(), b[0], b[1], b[2], b[3], b[4], b[5], b[6], b[7],
						b[8]);
//				logger.info(bql);
				++i;
				System.out.print(".");
				if (i % 128 == 0) {
					System.out.println();
				}
				ps = conn.prepareStatement(bql);
				ps.execute();
			}
			logger.info("Tocal " + i + " bugs Imported");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	/**
	 * 历史数据迁移
	 */
	public static void importExcel() {
		ExcelReader<Project> reader = new ExcelReader<Project>();
		if (conn == null) {
			connect();
		}
		try {
			List<Project> list = reader.readXlsx("E:/项目支持跟踪表.xlsx");
			System.out.println("记录数" + list.size());

			conn.setAutoCommit(false);
			for (Project p : list) {
				insert(Const.sql, p);
			}
			conn.commit();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}

	/**
	 * 插入本地数据库
	 * @param sql
	 * @param p
	 * @throws SQLException
	 */
	public static void insert(String sql, Project p) throws SQLException {
		try {
			ps = conn.prepareStatement(sql);

			ps.setString(1, p.getPrjName());
			ps.setString(2, p.getIndustry());
			
			System.out.println(p.getPrudectVersion() + "");
			
			ps.setString(3, p.getPrudectVersion());
			ps.setString(4, p.getIssueType());
			ps.setString(5, p.getDescribtion());

			ps.setDate(6, p.getSubmitDate());
			ps.setString(7, p.getStatus());
			ps.setString(8, p.getEngineer());
			ps.setString(9, p.getEngineerTel());
			ps.setDate(10, p.getFinishDate());

			ps.setFloat(11, p.getLaborCosts());
			ps.setString(12, p.getReporter());
			ps.setString(13, p.getContact());
			ps.setString(14, p.getProcess());
			ps.setString(15, p.getImprovement());

			ps.setString(16, p.getComments());
			ps.setDate(17, p.getUpdateTime());
			ps.setString(18, p.getOperatorIP());

			boolean flag = ps.execute();
			if (!flag) {
				System.out.println("Save data : No. = " + p.getPrjID() + " succeed!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ps.close();
		}
	}
	
	/**
	 * 获取最后更新时间
	 * @return
	 */
	static String getLastmodify() {
		java.sql.Timestamp time = new Timestamp(System.currentTimeMillis());
		if (psTimestamp == null) {
			try {
				psTimestamp = conn.prepareStatement(sqlTimestamp);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			ResultSet rs = psTimestamp.executeQuery();
			rs.next();
			time = rs.getTimestamp("BG_LAST_MODIFY");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return time.toString();
	}

	/**
	 * 获取连接
	 */
	public static void connect() {
		try {
			Class.forName(Const.DRIVER);
			conn = DriverManager.getConnection(Const.URL, Const.USERNAME, Const.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
