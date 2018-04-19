package com.dev.develop;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Enumeration;
import java.util.Properties;
import java.util.Scanner;
import org.apache.commons.configuration.PropertiesConfiguration;
public class PropertyFile_Reader {

	String result = "";
	

	public String getPropsFile() throws IOException {
		FileOutputStream output = null;
		FileInputStream inputStream =null;
		try {
			Properties prop = new Properties();
			//inputStream = FileInputStream("C:/sample.properties");
			  inputStream=new FileInputStream("E:\\config.properties");   
			
			
			Properties p = new Properties();
			p.load(inputStream);
			System.out.println("---------------------------------");
			System.out.printf("%5s %22s", "Key", "Value");
			System.out.println();
			System.out.println("----------------------------------");
			System.out.println();
			Enumeration<?> e = p.propertyNames();
			while (e.hasMoreElements()) {
				String key = (String) e.nextElement();
				String value = p.getProperty(key);
				System.out.println(key + "                " + value);
			}
			inputStream.close();
			
			System.out.println("======================");
			System.out.println("Enter the Key ");
			Scanner sc = new Scanner(System.in);
			String test = sc.nextLine();
			System.out.println("Enter the value ");
			String value = sc.nextLine();
			output =  new FileOutputStream("E:\\config.properties");
			p.setProperty(test, value);
			p.store(output, "saddssa");
			output.close();
			
			
		} catch (Exception e) {
			System.out.println("Exception: " + e);
		} finally {
			inputStream.close();
		}
		return result;

	}
}
