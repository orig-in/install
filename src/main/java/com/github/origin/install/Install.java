package com.github.origin.install;

import java.io.IOException;

import com.github.origin.OperatingSystem;


public class Install {
	
	public static void main(String[] args) throws InterruptedException, IOException {
		System.out.println("Installing orig.in");
		
		// detect java
		//check internet connection
		
		System.out.println(OperatingSystem.CURRENT + " detected.");
		switch (OperatingSystem.CURRENT) {
		case MAC:
			new MacInstaller().install();
			break;
		default:
			System.out.println("ERROR : operating system not yet supported.");
		}
	}

}
