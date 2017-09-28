package util;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

public class TestSequence {
	@Test
	public void testNextId() {
		Sequence instance = Sequence.getInstance();
		List<Long> ids = new ArrayList<Long>();
		for (int i = 0; i++ < 10;) {
			Long k = instance.nextId();
			ids.add(k);
			org.junit.Assert.assertTrue(ids.contains(k));
			System.out.println(k);
		}
		Long id = instance.nextId();
		org.junit.Assert.assertFalse(ids.contains(id));
		System.out.println(Long.MAX_VALUE);
	}
}
