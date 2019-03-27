package com.olympus.dashboard.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.NoSuchFileException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.olympus.dashboard.util.GetFileAttrs;

@RestController
public class WebController {

	@Autowired
	private AppService appService;
	public WebController() {
		// TODO Auto-generated constructor stub
	}
	/*************************************************************************************************************************************************************/

	@RequestMapping("/hello")
	public String testURI() {
		return "Testing URI";
	}

	
	/*************************************************************************************************************************************************************/
	// GET Request with parameters
		@RequestMapping("/getdate/{id}")
		public String returnLastModifyDate(@PathVariable String id) throws Exception {
			return appService.returnLastModifyDate(id);
		}
	
	/*************************************************************************************************************************************************************/
	// Pass a string parameter
	// public String returnLastModifyDate(@PathParam("fileName") String fileName)
	 /*
	@RequestMapping("/getdate")
	public String returnLastModifyDate() throws IOException {
		String date1 = null;
		//System.out.println("Param:"  + param);
		try {
			File file = new File("D:/tomcat-9.0.10/apache-tomcat-9.0.10/webapps/fisAssetServlet/dashsc/dashsc.html");
			
			//File file = new File("c:/temp/jb1.txt");
			date1 = GetFileAttrs.getFileDate(file);
			System.out.println("Date:" + date1);
			return date1;

		} catch (NoSuchFileException e) {
			System.out.println("Date not available." );
			return "Date not available.";
		}
	}
	*/
	/*************************************************************************************************************************************************************/

}
