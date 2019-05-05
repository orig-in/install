package com.github.origin.install;

import static com.github.origin.OriginHome.HOME;

import java.io.IOException;

import com.github.origin.OperatingSystem;

public class Install {

	public static void main(String[] args) throws InterruptedException, IOException {

		System.out.println("Installing orig.in to " + HOME.ORIGIN_HOME.getAbsolutePath());

		System.out.println(OperatingSystem.CURRENT + " detected.");
		switch (OperatingSystem.CURRENT) {
		case MAC:
			new MacInstaller().install();
			break;
		case LINUX:
			new LinuxInstaller().install();
			break;
		case WINDOWS:
				new WindowsInstaller().install();
				break;
		default:
			System.out.println("ERROR : operating system not yet supported.");
		}
	}

}
