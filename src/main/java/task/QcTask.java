package task;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import util.DBUtil;
/**
 * QC数据同步任务
 * @author yanming_dai
 * @date 2017年7月3日
 */
public class QcTask {

	public void executeFixedRate() {
		ScheduledExecutorService executor = Executors.newScheduledThreadPool(1);
		// 2分钟同步一次数据
		executor.scheduleAtFixedRate(new QcSynchronizer(), 300, 300, TimeUnit.SECONDS);
	}

	class QcSynchronizer implements Runnable {
		@Override
		public void run() {
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss SSS");
			try {
				DBUtil.importBUG();
			} catch (Exception e) {
				e.printStackTrace();
			}
			System.out.println("QC synchronize task complete at" + fmt.format(new Date()) + ".");
		}
	}

}
