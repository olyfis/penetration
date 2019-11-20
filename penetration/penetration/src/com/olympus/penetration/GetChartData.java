package com.olympus.penetration;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.RoundingMode;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.text.DateFormatSymbols;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

	// usage: dRtn = roundDouble(pen, "UP", "0.00");
	public static double roundDouble(double value, String direction, String fmt) {
		
		DecimalFormat df = new DecimalFormat(fmt);
		double dVal = 0.0;
		
		if (direction.equals("DOWN")) {
			df.setRoundingMode(RoundingMode.DOWN);
		} else {
			df.setRoundingMode(RoundingMode.UP);
		}
		String dStr = df.format(value);
		dVal = Double.parseDouble(dStr);
		
		return(dVal);
	}
	
	/****************************************************************************************************************************************************/
	public static String yr2018 = "2018";
	public static String yr2019 = "2019";
	public static String yr2020 = "2020";
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
	
	
	/****************************************************************************************************************************************************/
	
	
	
	/****************************************************************************************************************************************************/
	 public static CsvData  loadCsvData(String line, LinkedHashMap  calOrderHash) {
		 CsvData csvObj = new CsvData();
		 String mth = "";
		 String yr = "";
		 int position;
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
		 } else if (items[1].equals("152P")) {
			 yr = yr2019;
		 } else if (items[1].equals("153P")) {
			 yr = yr2020;
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
		 csvObj.setYear(items[1]);
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
	 
		 position =  getPosnKey( m,  calOrderHash );
		//System.out.println("***^^^*** mth=" + m + "-- POSN: " + position);
		csvObj.setPosition(position);
		 return csvObj;
		 
		 
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
				if (s.contains("Penetration") || s.contains("Sum")) {
					continue;
				} 
				sb.append(s);
				strArr.add(k++, s);	 
			}
			br.close();

			//System.out.println("***^^^*** CSV=" + sb.toString());
			return strArr;
		}
/****************************************************************************************************************************************************/
		//public static ArrayList<String> getJSONOrder(  int startMth) throws IOException {
			
		public static LinkedHashMap  getJSONOrder(  int startMth) throws IOException {
		ArrayList<String> orderArr = new ArrayList<String>();
		 LinkedHashMap  lhm =  new LinkedHashMap (); 
		int j = startMth;
		boolean jReset = false;
		boolean oneReset = false;
		//System.out.println("** j=" + j);
		//System.out.println("** startMth=" + startMth);
		int posn = 0;
		int calMth = startMth;
		
 
		for(int k=0;  k <12; k++) {
			posn = k;	
			//System.out.println("********* posn=" +  posn  + " -- calMth=" + calMth);
			 lhm.put(calMth, posn);
			 
			if (calMth == 12 ) {
				calMth = 0;
			}
			calMth++;		
		}	
		return lhm;
		}
		
/****************************************************************************************************************************************************/
		public static int getPosnKey(int mth, LinkedHashMap calOrderHash )  {

		int posn = 0;
		
		// Get a set of the entries
		Set set = calOrderHash.entrySet();
		// Get an iterator
		Iterator i = set.iterator();

		// Display elements
		while (i.hasNext()) {
			Map.Entry me = (Map.Entry) i.next();
			if (mth == (int) me.getKey() ) {
				//System.out.println("MTH=" + mth + "-- " + me.getKey() + ": " + me.getValue());
				posn =  (int) me.getValue();
				return posn;
			}	 
		}
		//System.out.println();
		return posn;
	}
		/****************************************************************************************************************************************************/

		
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		LinkedHashMap  calOrderHash = null;
		List<CsvData> data = new ArrayList<CsvData>();
		ArrayList<String> strArr = new ArrayList<String>();
		String csvFile = "C:\\Java_Dev\\props\\penetration\\penetration.txt";
		PrintWriter out = res.getWriter();
		JSONArray jsonArr = new JSONArray();
		double sales = 0.0;
		double pen = 0.0;
		// JSONObject obj = new JSONObject();
		String cType = "cType";
		String cTypeValue = req.getParameter(cType);
		String typeDesc = "";
		// out.write("Hello World");
		
		
		SimpleDateFormat format = new SimpleDateFormat("MM");
		String currMonth = format.format(new Date());
		int mth = Integer.parseInt(currMonth);
		//System.out.println("************ MONTH " + currMonth + "--  " + currMonth + "--");
		
		
	    //System.out.println("************ MONTH "+currMonth.format(date).toUpperCase()); 
		strArr = getCsvDataSort(data, csvFile);
		
	
		calOrderHash =  getJSONOrder(mth);
		

		for (String str : strArr) { // iterating ArrayList
			//System.out.println("*********** str=" + str + "---");
			CsvData csvDataObj = new CsvData();
			csvDataObj = loadCsvData(str, calOrderHash); // load data to Array of CsvData classes
			data.add(csvDataObj);
		}

		// Olyutil.printStrArray(strArr, "ArrayData: ");

		// System.out.println("\n --- cType=" + cType + "-- Value=" + cTypeValue + "--"
		// );
		if (cTypeValue.matches("ENT")) { // Shipped by Status
			// System.out.println("^^^^^^^ cTypeValue=" + cTypeValue);
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

		for (int i = 0; i < data.size(); i++) {
			if (data.get(i).getExtMatGrp().equals(typeDesc)) {
				JSONObject obj = new JSONObject();

				// System.out.println("********************************************************************************************");
				//System.out.println("Month:" + data.get(i).getMonth() + " ******* POSN:" + data.get(i).getPosition() );
				// System.out.println("Year:" + data.get(i).getYear() );
				// System.out.println("FisSales:" + data.get(i).getFisSales());
				// System.out.println("EligSales:" + data.get(i).getEligSales() );
				// System.out.println("******* Pen:" + data.get(i).getPenPercent() );
				String mthYr = data.get(i).getMonth() + "_" + data.get(i).getYear() ;
				
				//obj.put("month", data.get(i).getMonth());
				
				obj.put("month", mthYr);
				sales = data.get(i).getEligSales();
				// sales = sales.replaceAll("\"", "");
				// sales = sales.replaceAll("\\$", "");
				// sales = sales.replaceAll(",", "");

				// System.out.println("EligSales:" + sales);
				// obj.put("sales", data.get(i).getEligSales());
				obj.put("sales", roundDouble(sales, "UP", "0.00"));
				pen = data.get(i).getPenPercent();
				// pen = pen.replaceAll("%", "");
				 
				
				obj.put("pen", roundDouble(pen, "UP", "0.00"));
				obj.put("posn", data.get(i).getPosition() );
				jsonArr.put(data.get(i).getPosition(), obj);
			}
		}
		 //System.out.println("*** SM " + shortMonths[04]);
		  //System.out.println("LEN=" + jsonArr.length());
		for (int k = 0; k < jsonArr.length(); k++) {
			 
			if (k == 0) {
				out.write("[");
			}
			if (k == (jsonArr.length() - 1)) {
				out.write(jsonArr.getJSONObject(k).toString());
			} else {
				out.write(jsonArr.getJSONObject(k).toString() + ",");
			}
			// System.out.println("k=" + k + "Val:" + jsonArr.getJSONObject(k).toString() );
		}
		// String dispatchJSP = "/resultstest.jsp";
		out.write("]");

		req.getSession().setAttribute("jb", "jb");
		// req.getSession().setAttribute("jsonArr", jsonArr);
		req.getSession().setAttribute("strArr", strArr);
		// req.getRequestDispatcher(dispatchJSP).forward(req, res);
		// System.out.println("Exit Servlet " + this.getServletName() + " in doGet() ");

		// Set cookie
		Cookie cookie = new Cookie("jb", "jb");
		cookie.setMaxAge(60 * 60 * 1);
		res.addCookie(cookie);

	}
}