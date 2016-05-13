package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.jit.project.bean.Project;

public class DBUtil {
	public static void insert(String sql, Project project) throws SQLException {
		Connection conn = null;
		PreparedStatement ps = null;
		try {
			Class.forName(Const.DRIVER);
			conn = DriverManager.getConnection(Const.URL, Const.USERNAME, Const.PASSWORD);
			ps = conn.prepareStatement(sql);
			ps.setString(1, project.getPrjName());
			ps.setString(4, String.valueOf(project.getLaborCosts()));
			boolean flag = ps.execute();
			if (!flag) {
				System.out.println("Save data : No. = " + project.getPrjID() + " succeed!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}


}
