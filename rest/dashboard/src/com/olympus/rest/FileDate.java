package com.olympus.rest;

/* http://localhost:8181/dashboard/fis/getdate */

import javax.ws.*;
import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;
import com.olympus.rest.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.NoSuchFileException;

//@Path("getdate/{fileName}")
@Path("getdate")
public class FileDate {

	@GET
	@Produces(MediaType.TEXT_HTML)
	 
	// Pass a string parameter
	//public String returnLastModifyDate(@PathParam("fileName") String fileName) throws IOException {
	
	public String returnLastModifyDate() throws IOException {
		String date1 = null;
	    
		try { 
		File file = new File("D:/tomcat-9.0.10/apache-tomcat-9.0.10/webapps/fisAssetServlet/dashboard.html");
	    date1 = com.olympus.rest.GetFileAttrs.getFileDate(file);
		return date1;	
		
		} catch (NoSuchFileException e) {
			
			return "Date not available.";
		}
	}
}
