package com.github.origin.install;

import java.io.File;
import java.io.IOException;

import com.github.origin.OperatingSystem;


public class Install {
	
	public final static File ORIGIN_HOME = detectHome();
	public final static File ORIGIN_JAR = new File(ORIGIN_HOME, "origin.jar");
	
	public static void main(String[] args) throws InterruptedException, IOException {
		
		System.out.println("Installing orig.in to "+ORIGIN_HOME.getAbsolutePath() );
		new File(ORIGIN_HOME, "origin-upgrade.jar").renameTo(ORIGIN_JAR);
		
		// detect java
		//check internet connection
		
		System.out.println(OperatingSystem.CURRENT + " detected.");
		switch (OperatingSystem.CURRENT) {
		case MAC:
			new MacInstaller().install();
			break;
		case LINUX:
			new LinuxInstaller().install();
			break;
		default:
			System.out.println("ERROR : operating system not yet supported.");
		}
	}

	private static File detectHome() {
		String tmp = System.getenv("ORIGIN_HOME");
		if(tmp == null) tmp = System.getProperty("user.home");
		return new File(tmp, ".orig.in");
	}

}
