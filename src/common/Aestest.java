package common;

import java.io.IOException;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;


public class Aestest {
	private static String KEY = "~zjrk_HC.654321!";

	public static String encode(final String password) {
		try {
			byte[] raw = KEY.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
			byte[] encrypted = cipher.doFinal(password.getBytes());
			return byte2hex(encrypted).toLowerCase();
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
    }
	
	public static String decrypt(String password) {
		try {
			String key = "~zjrk_HC.654321!";
			byte[] raw = key.getBytes("ASCII");
			SecretKeySpec skeySpec = new SecretKeySpec(raw, "AES");
			Cipher cipher = Cipher.getInstance("AES");
			cipher.init(Cipher.DECRYPT_MODE, skeySpec);
			byte[] encrypted = hex2byte(password);
			try {
				byte[] original = cipher.doFinal(encrypted);
				String originalString = new String(original);
				return originalString;
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		} catch (Exception ex) {
			throw new RuntimeException(ex);
		}
	}
	
	public static byte[] hex2byte(String strhex) {
		if (strhex == null) {
			return null;
		}
		int l = strhex.length();
		if (l % 2 == 1) {
			return null;
		}
		byte[] b = new byte[l / 2];
		for (int i = 0; i != l / 2; i++) {
			b[i] = (byte) Integer.parseInt(strhex.substring(i * 2, i * 2 + 2),16);
		}
		return b;
	}
	
	private static String byte2hex(byte[] b) {
		String hs = "";
		String stmp = "";
		for (int n = 0; n < b.length; n++) {
			stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
			if (stmp.length() == 1) {
				hs = hs + "0" + stmp;
			} else {
				hs = hs + stmp;
			}
		}
		return hs.toUpperCase();
	}
	
	
	public static void main(String[] args) throws IOException {
		String encodeResult = encode("username=hskz3&password=123456");
		System.out.println(encodeResult.length());
		System.out.println(encodeResult);
		
		String decryptResult = decrypt("c02f580bf5e59af2d1addb34a39fe757701308a65582d0c0c148ad781c096d0f32319c770d88f2abf6f1fbf9e1e11413");
		System.out.println(decryptResult);
		System.out.println(decryptResult.substring(decryptResult.indexOf("username=")+9,decryptResult.indexOf("&")));//
		System.out.println(decryptResult.substring(decryptResult.indexOf("password=")+9,decryptResult.length()));//
//		System.out.println("3d3460fb7ba078b16e3075285cfeb0451c95c63fe902fb3d87ba8c7059ed3cdb95ee00a41de35aacd99fa0450efcd225af38eac1ae04caa5fd87bc6b73cb8fd7".length());
//		String url = decrypt("3d3460fb7ba078b16e3075285cfeb0451c95c63fe902fb3d87ba8c7059ed3cdb95ee00a41de35aacd99fa0450efcd225af38eac1ae04caa5fd87bc6b73cb8fd7",KEY);
//		System.out.println(url);
//		System.out.println("3edc133f69cba1942952527174c55b19".length());
//		String p = decrypt("3edc133f69cba1942952527174c55b19","~zjrk_HC.654321");
//		System.out.println(p);
		
	}
}
