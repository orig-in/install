package com.github.origin;

import static java.lang.System.getProperty;

import java.io.File;

public enum OriginHome {
	HOME;
	public final  File ORIGIN_HOME = detectHome();
	public final  File ORIGIN_JAR = new File(ORIGIN_HOME, "origin.jar");
	public final  File RELAUNCH_JAR = new File(ORIGIN_HOME, "relaunch.jar");
	public final  File ORIGIN_UPGRADE_JAR = new File(ORIGIN_HOME, "origin-upgrade.jar");
	public final  File LOG_TXT = new File(ORIGIN_HOME, "log.txt");
	
	
	private  File detectHome() {
		String envVar = System.getProperty("ORIGIN_HOME");
		if(envVar == null)  envVar = System.getenv("ORIGIN_HOME");
		return envVar == null ? new File(getProperty("user.home"), ".orig.in") : new File(envVar);
	}
}
