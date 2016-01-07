package com.github.origin.install;

import java.io.InputStream;
import java.util.Scanner;

public class MacInstaller {

	public void install() {
		String read = read(getClass().getResourceAsStream("io.github.orig-in.plist"));
		read = read.replaceFirst("HOME", System.getProperty("user.home"));
		System.out.println(read);
	}
	static String read(InputStream is) {
	    Scanner s = new Scanner(is).useDelimiter("\\A");
	    return s.hasNext() ? s.next() : "";
	}
}
