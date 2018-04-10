package com.common;

import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.Scanner;


public class TexttoCSV {


	public static void main(String[] args) throws Exception {
	    final Path path = Paths.get("c:\\hwp\\", "", "");
	    final Path txt = path.resolve("linux1803.txt");
	    final Path csv = path.resolve("linux1803Convert.csv");
	    final Charset utf8 = Charset.forName("UTF-8");
	    try (
	            final Scanner scanner = new Scanner(Files.newBufferedReader(txt, utf8));
	            final PrintWriter pw = new PrintWriter(Files.newBufferedWriter(csv, utf8, StandardOpenOption.CREATE_NEW))) {
	        while (scanner.hasNextLine()) {
	             //System.out.println(scanner.findInLine("[1~100]"));
	        	pw.println(scanner.nextLine().replace('|', ','));
	        }
	    }
	}
		


}
