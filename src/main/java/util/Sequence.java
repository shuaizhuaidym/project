package util;

import java.security.InvalidParameterException;
import java.util.List;

import org.nutz.el.opt.RunMethod;
/**
 * Snowflake and working on open sourcing the next version based on Twitter-server
 * @author yanming_dai
 * @date 2017年9月25日
 */
public class Sequence implements RunMethod{
	private static long twepoch = 1288834974657L;
	private long workerId;
	private long datacenterId;
	private long sequence = 0L;

	private static long workerIdBits = 5L;
	private static long datacenterIdBits = 5L;
	private static Long maxWorkerId = -1L ^ (-1L << (int) workerIdBits);
	private static long maxDatacenterId = -1L ^ (-1L << (int) datacenterIdBits);
	private static long sequenceBits = 12L;

	private long workerIdShift = sequenceBits;
	private long datacenterIdShift = sequenceBits + workerIdBits;
	private long timestampLeftShift = sequenceBits + workerIdBits + datacenterIdBits;
	private long sequenceMask = -1L ^ (-1L << (int) sequenceBits);

	private long lastTimestamp = -1L;
	private static Object syncRoot = new Object();

	static Sequence instane;

	public static Sequence getInstance() {
		if (instane == null) {
			instane = new Sequence(1, 1);
		}
		return instane;
	}

	private Sequence(long workerId, long datacenterId) {
		
		// sanity check for workerId
		if (workerId > maxWorkerId || workerId < 0) {
			throw new InvalidParameterException(String.format(
					"worker Id can't be greater than %d or less than 0", maxWorkerId));
		}
		if (datacenterId > maxDatacenterId || datacenterId < 0) {
			throw new InvalidParameterException(String.format(
					"datacenter Id can't be greater than %d or less than 0", maxDatacenterId));
		}
		this.workerId = workerId;
		this.datacenterId = datacenterId;
	}

	public long nextId() {
		synchronized (syncRoot) {
			long timestamp = timeGen();

			if (timestamp < lastTimestamp) {
				throw new RuntimeException(String.format(
						"Clock moved backwards.Refusing to generate id for %d milliseconds", lastTimestamp
								- timestamp));
			}

			if (lastTimestamp == timestamp) {
				sequence = (sequence + 1) & sequenceMask;
				if (sequence == 0) {
					timestamp = tilNextMillis(lastTimestamp);
				}
			} else {
				sequence = 0L;
			}

			lastTimestamp = timestamp;

			return ((timestamp - twepoch) << (int) timestampLeftShift)
					| (datacenterId << (int) datacenterIdShift) | (workerId << (int) workerIdShift)
					| sequence;
		}
	}

	protected long tilNextMillis(long lastTimestamp) {
		long timestamp = timeGen();
		while (timestamp <= lastTimestamp) {
			timestamp = timeGen();
		}
		return timestamp;
	}

	protected long timeGen() {
		return System.currentTimeMillis();
	}

	@Override
	public Object run(List<Object> fetchParam) {
		long id=getInstance().nextId();
		System.out.println(id);
		return id;
	}

	@Override
	public String fetchSelf() {
		return "seq";
	}
}
