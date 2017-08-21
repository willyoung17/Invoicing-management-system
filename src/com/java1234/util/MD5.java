package com.java1234.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import sun.misc.BASE64Encoder;

public class MD5 {
	
	private MD5(){}
	
	public static void main(String[] args) {
		String salt = getRandomStr(10);
		String password = getMD5Str("123456", salt);
		System.out.println(salt);
		System.out.println(password);
	}
	
	private static final char[] characters = {
			'a','b','c','d','e','f','g','h','i','j','k','l',
			'm','n','o','p','q','r','s','t','u','v','w','x',
			'y','z','~','!','@','#','$','%','^','*','&'};
	
	public static String getRandomStr(int length){
		StringBuilder builder = new StringBuilder();
		Random r = new Random();
		for(int i=0; i<length; i++){
			int index = r.nextInt(characters.length);
			builder.append(characters[index]);
		}
		return builder.toString();
	}
	
	public static String getMD5Str(String password, String salt){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] original = (password + salt).getBytes();
			byte[] data = md.digest(original);
			return new  BASE64Encoder().encode(data);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return null;
	}

}
