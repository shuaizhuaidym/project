package user;

import org.apache.shiro.crypto.hash.Sha256Hash;

public class TestUser {
	public static void main(String[] args) {
		String _pass = new Sha256Hash("123456", "001").toHex();
		System.out.println(_pass);
	}
}
