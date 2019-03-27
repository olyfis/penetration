package com.olympus.dashboard.ctrl;

import java.io.File;
import java.io.IOException;
import java.nio.file.NoSuchFileException;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.olympus.dashboard.util.GetFileAttrs;

@RestController
public class WebController {

	public WebController() {
		// TODO Auto-generated constructor stub
	}
	/*************************************************************************************************************************************************************/

	@RequestMapping("/hello")
	public String testURI() {
		return "Testing URI";
	}

	/*************************************************************************************************************************************************************/
	// Pass a string parameter
	// public String returnLastModifyDate(@PathParam("fileName") String fileName)
	// throws IOException {
	@RequestMapping("/getdate")
	public String returnLastModifyDate() throws IOException {
		String date1 = null;

		try {
			File file = new File("D:/tomcat-9.0.10/apache-tomcat-9.0.10/webapps/fisAssetServlet/dashsc/dashsc.html");
			
			//File file = new File("c:/temp/jb1.txt");
			date1 = GetFileAttrs.getFileDate(file);
			return date1;

		} catch (NoSuchFileException e) {

			return "Date not available.";
		}
	}
	/*************************************************************************************************************************************************************/

}
