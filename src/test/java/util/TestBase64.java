package util;

import java.io.UnsupportedEncodingException;

import org.apache.tomcat.util.codec.binary.Base64;

public class TestBase64 {
	public static void main(String[] args) throws UnsupportedEncodingException {
		byte[] dn = Base64.decodeBase64("Q049sLLIq7Gjw9y53MDt1LEsTz1qaXQsQz1jbg==");
		System.out.println(new String(dn, "GB2312"));
	}
}
