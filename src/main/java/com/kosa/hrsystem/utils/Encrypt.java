package com.kosa.hrsystem.utils;

import java.security.MessageDigest;
import java.security.SecureRandom;

public class Encrypt {
	
	public static String getSalt() {
		// 1. Random, byte 객체 생성
		SecureRandom r = new SecureRandom();
		byte[] salt = new byte[20];
		
		// 2. 난수 생성
		r.nextBytes(salt);
		
		// 3. byte to String (10진수의 문자열로 변경)
		StringBuffer sb = new StringBuffer();
		for(byte b : salt) {
			sb.append(String.format("%02x", b));
		};
		
		return sb.toString();
	}
	
	public static String getEncrypt(String pwd) {
		String result = "";
		try {
			// 1. SHA256 객체 생성
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			
			// 2. pwd와 salt를 합친 문자열에 SHA-256적용
			md.update((pwd).getBytes());
			byte[] pwdsalt = md.digest();
			
			StringBuffer sb = new StringBuffer();
			for(byte b : pwdsalt) {
				sb.append(String.format("%02x", b));
			}
			result = sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
//	public static void main(String[] args) {
//		Encrypt en = new Encrypt();
//		String pwd = "cceeun.tistory";
//		System.out.println("pwd : " + pwd);
//		
//		// Salt 생성
//		String salt = en.getSalt();
//		System.out.println("salt : " + salt);
//		
//		// 최종 pwd
//		String res = en.getEncrypt(pwd);
//	}
}
