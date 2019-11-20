<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.OutputStream"%>   
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
 

<% 
  	String title =  "Olympus FIS Penetration Charts"; 
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 
<style type="text/css">
	#chart-container {
		width: 640px;
		height: auto;
	}

</style>
<title><%=title%></title>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.tablesorter/2.9.1/jquery.tablesorter.min.js"></script>
<script type="text/javascript" src="includes/js/tableFilter.js"></script>
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script type="text/javascript" src="includes/js/chartjs/Chart.js"></script>
<script type="text/javascript" src="includes/js/chartjs/Chart.min.js"></script>
<script type="text/javascript" src="includes/js/chartjs/chartjs-plugin-trendline.js"></script>
<!--    <script type="text/javascript" src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>     -->

<script type="text/javascript" src="includes/js/chartjs/getappdataENT.js"></script>
<script type="text/javascript" src="includes/js/chartjs/getappdataSE.js"></script>
<script type="text/javascript" src="includes/js/chartjs/getappdataURO.js"></script>
<script type="text/javascript" src="includes/js/chartjs/getappdataMP.js"></script>
<script type="text/javascript" src="includes/js/chartjs/getappdataENG.js"></script>
 

<style><%@include file="includes/css/header.css"%></style>
<style><%@include file="includes/css/menu.css"%></style>
 <link rel="stylesheet" href="includes/css/calendar.css" />
<link rel="stylesheet" href="includes/css/calendar.css" />
 


</head>
<body>
	<%@include  file="includes/header.html" %> 
 
<div id="chart-container">	

<% 
	//String bgc1= "bgcolor=\"#5DADE2\" style=\"font-family: sans-serif; color: white;\" ";
	//String bgc2= " bgcolor=\"#AEB6BF\"  ";

    String action = request.getParameter("actiontype");
	String hide = request.getParameter("hide");
	//out.println("<Center><h4> Hidden: " +   hide +  "</Center>"); 
	String canvas = "";
	String canvas2 = "";
	String label = "";
	if (action.equals("5")) {
	 	canvas = "mycanvasENT";
	 	label = "Surg Endo - ENT";
	} else if (action.equals("10")) {
	 	canvas = "mycanvasSE";
	 	label = "Surg Endo - SE";
	} else if (action.equals("15")) {
	 	canvas = "mycanvasURO";
	 	label = "Surg Endo - Uro/Gyn";
	} else if (action.equals("20")) {
	 	canvas = "mycanvasMP";
	 	label = "Surg Endo - G&R";
	} else if (action.equals("25")) {
		 canvas  = "mycanvasENG"; 
	 	label = "Energy";
	}

	//out.println("actiontype:" + action + "--" + "ActDesc:" + canvas + "--");
	
	out.println("<Center><h4> Report for ExtMatGrp: " +   label +  "</Center>");
	
	
%>
	 <canvas id="<%=canvas%>" > </canvas>

</div>
<BR>


 <%
 	canvas2 = "table";

//String sess_val = (String) request.getSession(false).getAttribute("jb");
//out.println("SV=:" + sess_val);

 /*
         Cookie cookie = null;
         Cookie[] cookies = null;
         
         // Get an array of Cookies associated with the this domain
         cookies = request.getCookies();
         
         if( cookies != null ) {
            out.println("<h2> Found Cookies Name and Value</h2>");
            
            for (int i = 0; i < cookies.length; i++) {
               cookie = cookies[i];
               out.print("Name : " + cookie.getName( ) + ",  ");
               out.print("Value: " + cookie.getValue( )+" <br/>");
            }
         } else {
            out.println("<h2>No cookies founds</h2>");
         }
 
      
   */   

 %>
 



</body>
</html>