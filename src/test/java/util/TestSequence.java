package util;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestSequence {
	@Test
	public void testNextId() {
		Sequence instance = Sequence.getInstance();
		List<Long> ids = new ArrayList<Long>();
		for (int i = 0; i++ < 1000;) {
			Long k = instance.nextId();
			Long t = k % 999999999;
			System.out.println(k + ":" + t);
			
			org.junit.Assert.assertFalse(ids.contains(t));
			ids.add(t);
			org.junit.Assert.assertTrue(ids.contains(t));
		}
		Long id = instance.nextId();
		org.junit.Assert.assertFalse(ids.contains(id));
		System.out.println(Long.MAX_VALUE % 999999999);
	}
}
