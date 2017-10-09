package com.jit.project.project.service;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.jit.project.bean.BasePojo;
import com.jit.project.daily.bean.DailyItem;
import com.jit.project.mission.Mission;

/**
 * 数据迁移工具
 * <p>
 * Title:Translater
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author daiyma
 * @date 2017年10月1日
 */
public class Translater {
	public static final Map<Long, Long> idmaps = new HashMap<Long, Long>(4096);
	
	public static<B extends BasePojo> void translate(List<B> src) {
		File sqlsFile = new File("E:/prj-sql.sql");
		FileWriter fw = null;
		if (!sqlsFile.exists()) {
			try {
				sqlsFile.createNewFile();
				fw = new FileWriter(sqlsFile, true);
				int i = 0;
				for (BasePojo p : src) {
					fw.write(p.toSql());
					fw.write("\r\n");
					System.out.println(++i);
				}
				System.out.println("over");
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (fw != null)
					try {
						fw.close();
					} catch (IOException e) {
						e.printStackTrace();
					}
			}
		}
	}
	protected static int translateMission(List<Mission> msn) {
		return 0;
	}
	
	public static int translateDailyItem(List<DailyItem> itms) {
		// TODO get project by old id,avoid duplicate
		return 0;
	}
}
