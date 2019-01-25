package com.DevelopPR.util;

import java.util.Random;

public class GenerateCertNumber {
	
	// 생성할 난수 자리수
	private int certNumLength = 6;
	
	public String executeGenerate() {
		Random random = new Random(System.currentTimeMillis());
		
		int range =(int)Math.pow(10, certNumLength);
		int trim = (int)Math.pow(10, certNumLength-1);
		int result = random.nextInt(range) + trim;
		
		if(result > range) {
			result = result - trim;
		}
		
		return String.valueOf(result);
	}

	public int getCertNumLength() {
		return certNumLength;
	}

	public void setCertNumLength(int certNumLength) {
		this.certNumLength = certNumLength;
	}
	

}
