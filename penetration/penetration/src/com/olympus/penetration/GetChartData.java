package com.olympus.penetration;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormatSymbols;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.olympus.olyutil.Olyutil;

//Run: http://localhost:8181/penetration/getchart?cType=ENT
@WebServlet("/getchart")
public class GetChartData extends HttpServlet {
	/****************************************************************************************************************************************************/
	public static String yr2018 = "2018";
	public static String[] shortMonths = new DateFormatSymbols().getShortMonths();
	
	public static ArrayList<String> customSplitSpecific(String s) {
	    ArrayList<String> words = new ArrayList<String>();
	    boolean notInsideComma = true;
	    String mt = "null";
	    int start =0, end=0;
	    for(int i=0; i<s.length()-1; i++) {
	    	if ( s.charAt(i)==',' &&  s.charAt(i+1)==',' ) {
	    		words.add(mt);
	    	}
	        if(s.charAt(i)==',' && notInsideComma)
	        {
	            words.add(s.substring(start,i));
	            start = i+1;                
	        }   
	        else if(s.charAt(i)=='"')
	        notInsideComma=!notInsideComma;
	    }
	    words.add(s.substring(start));
	    return words;
	}  
	/****************************************************************************************************************************************************/
	public static boolean isNullStr(String str) {
	
	if (str == null  ||  str.equals("null") ||  str.equals("") )  {	
		return true;
	}
	return false;
	}
	
	/****************************************************************************************************************************************************/
	public static ArrayList<String> getCsvData(List<CsvData> data,  String csvFile) throws IOException {
		FileReader fr = null;
		String newLine = "";
		String[] newItems;
		String s = new String();
		StringBuffer sb = new StringBuffer();
		ArrayList<String> strArr = new ArrayList<String>();
		fr = new FileReader(new File(csvFile));
		
		// be sure to not have line starting with "--" or "/*" or any other non
		// alphabetical character
		BufferedReader br = new BufferedReader(fr);
		int k = 0;

		while ((s = br.readLine()) != null) {	
			CsvData csvDataObj = new CsvData();
			if (s.contains("Penetration")) {
				continue;
			}
			System.out.println("***^^^*** S=" + s.toString());
			csvDataObj = loadCsvData(s); // load data to Array of CsvData classes
			sb.append(s);
			strArr.add(k++, s);
			data.add(csvDataObj);
		}
		br.close();

		//System.out.println("***^^^*** CSV=" + sb.toString());
		return strArr;
	}
	/****************************************************************************************************************************************************/
	// Sort for Sliding window
	
	public static ArrayList<String> getCsvDataSort(List<CsvData> data,  String csvFile) throws IOException {
		FileReader fr = null;
		String newLine = "";
		String[] newItems;
		String s = new String();
		StringBuffer sb = new StringBuffer();
		ArrayList<String> strArr = new ArrayList<String>();
		fr = new FileReader(new File(csvFile));
		
		// be sure to not have line starting with "--" or "/*" or any other non
		// alphabetical character
		BufferedReader br = new BufferedReader(fr);
		int k = 0;

		while ((s = br.readLine()) != null) {	
			CsvData csvDataObj = new CsvData();
			if (s.contains("Penetration")) {
				continue;
			}
			//System.out.println("***^^^*** S=" + s.toString());
			csvDataObj = loadCsvData(s); // load data to Array of CsvData classes
			sb.append(s);
			strArr.add(k++, s);
			data.add(csvDataObj);
		}
		br.close();

		//System.out.println("***^^^*** CSV=" + sb.toString());
		return strArr;
	}
	
	
	/****************************************************************************************************************************************************/
	 public static CsvData  loadCsvData(String line) {
		 CsvData csvObj = new CsvData();
		 String mth = "";
		 String yr = "";
		 //String[] items = line.split(",");
		 //ArrayList<String> items = null;   
		// System.out.println("***^^^*** LINE=" + line);
		 //items = customSplitSpecific(line);
		 
		  String[] items = line.split(";");
		  int i = 0;
		 // for (String str : items) { // iterating ArrayList
				//System.out.println("*********** ITEMS[" + i++ + "]="  + str + "---");
		 //} 
		 
		 
		 int m = Integer.parseInt(items[0]);	
 
		 mth = shortMonths[m-1];
		 if (items[1].equals("151P")) {
			 yr = yr2018;
		 }
		 
		double fSales = 0.0;
		double eSales = 0.0;
		double pct = 0.0;
		
		if (! isNullStr(items[3]) ) {
			fSales = Double.valueOf(items[3]);
		}
		if (! isNullStr(items[4]) ) {
			eSales = Double.valueOf(items[4]);
		}

		 csvObj.setMonth(mth);
		 csvObj.setYear(yr);
		 csvObj.setExtMatGrp(items[2]);
		 csvObj.setFisSales(fSales);
		 csvObj.setEligSales(eSales);
		 //System.out.println("SZ=" + items.size());
		 if (items.length > 5) {
			 if(items[5] != null && ! items[5].isEmpty()) { 
				 if (! isNullStr(items[5]) ) {
						pct = Double.valueOf(items[5])  * 100;	
					}
				 	csvObj.setPenPercent(pct);
			 }
		 }
		 return csvObj;
	 }
	
	/****************************************************************************************************************************************************/
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		List<CsvData> data = new ArrayList<CsvData>();
		ArrayList<String> strArr = new ArrayList<String>();
		String csvFile = "C:\\Java_Dev\\props\\penetration\\penetration.txt";
		PrintWriter out = res.getWriter();
		JSONArray jsonArr = new JSONArray();
		double sales = 0.0;
		double pen = 0.0;
		//JSONObject obj = new JSONObject();
		String cType = "cType";
		String cTypeValue = req.getParameter(cType);
		String 	typeDesc = "";
		//out.write("Hello World");
		strArr = getCsvData(data, csvFile);
		
		
		
		
		
		//Olyutil.printStrArray(strArr, "ArrayData: ");
	 
			//System.out.println("\n --- cType=" + cType + "-- Value=" + cTypeValue + "--" );
			if (cTypeValue.matches("ENT")) { // Shipped by Status
				 //System.out.println("^^^^^^^ cTypeValue=" + cTypeValue);
				typeDesc = "Surg Endo - ENT";
			} else if (cTypeValue.matches("SE")) {
				typeDesc = "Surg Endo - SE";	
			} else if (cTypeValue.matches("URO")) {
				typeDesc = "Surg Endo - Uro/Gyn";	
			} else if (cTypeValue.matches("MP")) {
				typeDesc = "G&R - MP";	
			} else if (cTypeValue.matches("ENG")) {
				typeDesc = "Energy";	
			}
		
		// printName(xData);
		// displayJsonArray(jsonArr);
		// System.out.println(jsonArr.toString());
			
			 
			for(int i = 0 ; i < data.size() ; i++) { 
				if (data.get(i).getExtMatGrp().equals(typeDesc)) {
					JSONObject obj = new JSONObject();
				 
					//System.out.println("********************************************************************************************");
					//System.out.println("Month:" + data.get(i).getMonth() ); 
					//System.out.println("Year:" + data.get(i).getYear() ); 
					//System.out.println("FisSales:" + data.get(i).getFisSales()); 
					//System.out.println("EligSales:" + data.get(i).getEligSales() ); 
					//System.out.println("******* Pen:" + data.get(i).getPenPercent() ); 	
					 
					obj.put("month", data.get(i).getMonth());
					
					 sales =  data.get(i).getEligSales();
					//sales = sales.replaceAll("\"", "");
					//sales = sales.replaceAll("\\$", "");
					//sales = sales.replaceAll(",", "");
					
					
					//System.out.println("EligSales:" + sales); 	
					//obj.put("sales", data.get(i).getEligSales());
					obj.put("sales", sales);
					pen = data.get(i).getPenPercent();
					//pen = pen.replaceAll("%", "");
					obj.put("pen", pen);
					jsonArr.put(obj);	
				}
			}
			//System.out.println("*** SM " + shortMonths[04]);
			//System.out.println("LEN=" + jsonArr.length());
			for(int k = 0 ; k < jsonArr.length() ; k++) { 
				if  (k == 0 ) {
					out.write("[");
				}				
				if  (k == (jsonArr.length() -1) ) {
					out.write(jsonArr.getJSONObject(k).toString());			
				} else {
					out.write(jsonArr.getJSONObject(k).toString() + ",");	
				}
				//System.out.println("k=" + k + "Val:" + jsonArr.getJSONObject(k).toString() );		
			}
			//String dispatchJSP = "/resultstest.jsp";
			out.write("]");
			
			req.getSession().setAttribute("jb", "jb");
			//req.getSession().setAttribute("jsonArr", jsonArr);
			req.getSession().setAttribute("strArr", strArr);
			//req.getRequestDispatcher(dispatchJSP).forward(req, res);
			// System.out.println("Exit Servlet " + this.getServletName() + " in doGet() ");
			
			// Set cookie
			Cookie cookie = new Cookie("jb","jb");
			cookie.setMaxAge(60*60*1);
			res.addCookie(cookie);
			
			
	}
}