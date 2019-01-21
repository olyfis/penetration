 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.io.OutputStream"%>   
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="javax.servlet.*"%>
<% 
  	String title =  "JSP Title Here"; 
	ArrayList<String> list = new ArrayList<String>();
	ArrayList<String> tokens = new ArrayList<String>();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=title%></title>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<style><%@include file="includes/css/reports.css"%></style>
<style><%@include file="includes/css/table.css"%></style>
<style><%@include file="includes/css/header.css"%></style>



</head>





<%!  

String formUrl = null;
/*************************************************************************************************************************************************************/
public ArrayList<String> readHeader(String filePath) throws IOException {
	
	ArrayList<String> strArr = new ArrayList<String>();
	
	
	String header = null;
	BufferedReader reader = null;
	StringBuilder sb = null;
	String line = null;
	try {
	 	reader = new BufferedReader(new FileReader(filePath));
    	 sb = new StringBuilder();
    
	} catch (FileNotFoundException fex) {
		fex.printStackTrace();	
	}
	try { 
	    while((line = reader.readLine())!= null){
	    	strArr.add(line);
	    }	   
		reader.close();
	
	} catch (IOException ioe) {
		ioe.printStackTrace();
	}
	
	return strArr;	
}

/*************************************************************************************************************************************************************/
public void displayTreeMap( JspWriter out2, TreeMap treeMap  ) throws IOException {
	 
	/* Display content using Iterator*/
    Set set = treeMap.entrySet();
	Iterator iterator = set.iterator();
	int z = 1;
	while (iterator.hasNext()) {
		Map.Entry mentry = (Map.Entry) iterator.next();
		//System.out.println("K= " + mentry.getKey() + " & Value is: " + mentry.getValue());
		out2.println("key is: " + mentry.getKey() + " & Value is: ");
		out2.println(mentry.getValue() + "<br>");
	}	
}

/*************************************************************************************************************************************************************/
public String  buildHeader( JspWriter out2, TreeMap treeMap  ) throws IOException {
	
	String px = "";
	/* Display content using Iterator*/
    Set set = treeMap.entrySet();
	Iterator iterator = set.iterator();
	String thead = "";
	while (iterator.hasNext()) {
		Map.Entry mentry = (Map.Entry) iterator.next();
		
		px = (String) mentry.getValue();
		
		px = "b2";
		//thead += "<th class=\" "  +  px  + "\" >" + mentry.getKey() + " </th>";
		
		thead += "<th class=\"b3\" >" + mentry.getKey() + " </th>";
		 
	}
	//out2.println("<tr class=\"b2\"  bgcolor=\"#5DADE2\" >"    +   thead  );
	//out2.println("<tr >"    +   thead  );
	return thead;
}

/*************************************************************************************************************************************************************/
public String  buildCells( JspWriter out2, ArrayList<String> dataArr  ) throws IOException {
	String cells = "";
	
	return cells;
}


%>
<body>


<div style="padding-left:20px">
<h3><%=title%></h3>
<%
	String filePath = "C:\\Java_Dev\\props\\headers\\header.txt";
	ArrayList<String> headerArr = readHeader(filePath);
	ArrayList<String> pixels = new ArrayList<String>();
	
	
	
	
	
	ArrayList<String> list2 = new ArrayList<String>();
	//list = (ArrayList<String>) session.getAttribute("strArr");
	list2.add("xx");
	
	out.println("listSize=" + list2.size());
	if (list2.size() > 0) {
		HashMap<String, String> hmap = new HashMap<String, String>();
		for (int k = 0; k < headerArr.size(); k++) {
			//out.println("K=" + headerArr.get(k) + " V=" + pixels.get(k) + "<BR>");	
			//hmap.put(headerArr.get(k), pixels.get(k));
			hmap.put(headerArr.get(k), "10");
		}
		TreeMap<String, String> treeMap = new TreeMap<String, String>(hmap);
		//displayTreeMap(out, treeMap);
		/**********************************************************************************************************************************************************/
		// Output Table 
		out.println("<table class=\"tablesorter\" border=1>"); // Create Table 
		String header = buildHeader(out, treeMap); // build header from file
		out.println(header);
		buildCells(out, list); // build data cells from file
		//out.println("<tr><td>Item 1</td>");
		out.println("<tr>");

		out.println("<td>Item 2</td>");
		out.println("<td>Item N</td>");

		out.println("</tr></table>"); // Close Table

		// End Output Table
		/**********************************************************************************************************************************************************/
	} else {
		out.println("No Asset data to display." + "<br>");

	}

	/*
	
	*/
%>

</div>



</body>
</html>