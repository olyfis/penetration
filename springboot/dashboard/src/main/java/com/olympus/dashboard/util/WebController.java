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

	/*************************************************************************************************************************************************************/
	public WebController() {
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
}
