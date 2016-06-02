package util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.jit.project.bean.Project;

public class DBUtil {
	public static Connection conn = null;
	public static PreparedStatement ps = null;

	public static void main(String[] args) {
		ExcelReader<Project> reader = new ExcelReader<Project>();
		if (conn == null) {
			connect();
		}
		try {
			List<Project>list=reader.readXlsx("E:/项目支持跟踪表.xlsx");
			System.out.println("记录数"+list.size());
			
			conn.setAutoCommit(false);
			for (Project p:list) {
				insert(Const.sql,p);
			}
			conn.commit();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			if(conn!=null){
				try {
					conn.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
		}
	}

	public static void insert(String sql, Project p) throws SQLException {
		try {
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, p.getPrjName());
			ps.setString(2, p.getIndustry());
			System.out.println(p.getPrudectVersion()+"vvvvvvvvvvvvvvvvv");
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
			ps.setDate(17, p.getLastResponse());
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

	public static void connect() {
		try {
			Class.forName(Const.DRIVER);
			conn = DriverManager.getConnection(Const.URL, Const.USERNAME, Const.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
