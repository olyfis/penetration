<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
 <%@ page import="java.util.ArrayList"%>
 <%@ page import="java.net.InetAddress"%>
  <link rel="stylesheet" href="includes/css/calendar.css" />
    <script type="text/javascript" src="includes/scripts/pureJSCalendar.js"></script>
    
 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <title>Insert title here</title>

 </head>
 <body>
 <!--  
<jsp:include page="/sfquery" flush="true" />
<c:out value="${strArrID}"></c:out>
 
  <c:forEach items="${strArrID}" var="id">
            ${id.id} <br />
        </c:forEach>
 -->
 <%
 String at = request.getParameter("atype");
 ArrayList<String> list = new ArrayList<String>();
    	//out.println("atype=" + at);

    String hostname = InetAddress.getLocalHost().getHostName();
    
    	if (at != null) {

    		if (at.equals("15")) { // NBVa report

    			//out.println("<b>ID:</b> <input type=\"text\" id=\"id\" value=101-0014274-005 />");
    			out.println("<b>ID:</b> <input type=\"text\"  name=\"id\"  value=\"XXX-XXXXXXX-XXX\" />");

    		} else if (at.equals("35")) { // asset report
    			out.println("<b>Date:</b> <input type=\"text\"  name=\"id\"  value=\"XXX-XXXXXXX-XXX\" />");
    		}  else if (at.equals("40")) { // 
    			out.print("<b>Lead ID:</b>");
    			out.print( "<tr> <td>");
    			out.print("<tr> <td class=\"table_heading\"></td> " );
    			list = (ArrayList<String>) session.getAttribute("strArrID");
    			out.print("<select name=\"leadID\" >" );
    			out.print("<option value=\"0\">Select Lead</option>" );
    			System.out.println("******** arrSize=" + list.size()); 			
    			if (! list.isEmpty()) {
	    			for(int i = 0; i < list.size(); i++) {  
	    				out.print("<option value=" + list.get(i)   +  ">" +list.get(i)  +  "</option>" );
	    			}
    			}			
    			out.print("</select></tr> </table></td> </tr>   </table> ");
    			out.println("<input type=\"hidden\"  name=\"getID\"  value=\"40\" />");
    			
    		} else if (at.equals("75") || at.equals("30")  || at.equals("25") ) { // 70 -> Rapport Booking Summary -- 30 -> Rapport Booking --  25 -> infolease
    	 
    			out.println("<b>Start Date:</b> <input name=\"startDate\" id=\"date2\" type=\"text\" value=\"Click for Calendar\" onclick=\"pureJSCalendar.open('yyyy-MM-dd', 20, 30, 1, '2018-5-5', '2019-8-20', 'date2', 20)\"   />" );
    			out.println("<b>End Date:</b> <input name=\"endDate\" id=\"date3\" type=\"text\" value=\"Click for Calendar\" onclick=\"pureJSCalendar.open('yyyy-MM-dd', 20, 30, 1, '2018-5-5', '2019-8-20', 'date3', 20)\"   />" );
				if (at.equals("75")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"RPS\" />" );
				} else if (at.equals("30")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"RPB\" />" );
				} else if (at.equals("25")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"ILB\" />" );	
				}	
    					
    		} else if (at.equals("10") || at.equals("60")  || at.equals("70")   || at.equals("80")  || at.equals("85")    ) {
    			out.println("Click Run");
    			if (at.equals("10")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"EVGR\" />" );
				} else if (at.equals("60")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"LSHP\" />" );
				} else if (at.equals("70")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"CCAN\" />" );	
				} else if (at.equals("80")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"SNAP\" />" );	
				} else if (at.equals("85")) {
					out.println("<input name=\"mType\"  type=\"hidden\" value=\"UTIL\" />" );	
				}		
    			
    		}
    	    else {
    			out.println("Click Run");
    		}
    	}
    	//out.println( "<input type=\"text\" id=\"id\" value="   + session.getAttribute("atype") + "/>");
    	//out.println( "<input type=\"text\" id=\"id\" value="   + id + "/>");
    %>
 </body>
 </html>