/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.10
 * Generated at: 2018-12-13 13:48:07 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.net.InetAddress;

public final class results_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("java.net.InetAddress");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("    \r\n");
      out.write("\r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"ISO-8859-1\">\r\n");
      out.write("<title>Results</title>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<h4>Results Page</h4>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String at = request.getParameter("actiontype");
	String at2 = request.getParameter("getID");
    String hostname = InetAddress.getLocalHost().getHostName();

	out.println("atype=" + at);

	if (at != null) {

		if (at.equals("10")) {
			//String redirectURL = "http://cvyhj3a27:8181/evergreen/egreen";
			//String redirectURL = "http://" + hostname  + ":8181/webreport/evergreen";
			String mType = request.getParameter("mType");
			String excel = request.getParameter("EGEXL");
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilreport?mType=" + mType + "&excel=" + excel;
			response.sendRedirect(redirectURL);

		} else if (at.equals("15")) {
			String id = request.getParameter("id");
			//out.println("ID:" + id + "--");
			String redirectURL = "http://" + hostname  + ":8181/webreport/nbva?id=" + id;
			response.sendRedirect(redirectURL);

		} else if (at.equals("5")) {
			String hostname2 = "cvyhj3a27";
			String redirectURL = "http://" + hostname2  + ":8181/fisAssetServlet/dashboard.html";
			response.sendRedirect(redirectURL);
			
		} else if (at.equals("26")) {
			String date = request.getParameter("date");
			 System.out.println("******************* DATE=" + date );
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilbook?date=" + date;
			response.sendRedirect(redirectURL);
			
		} else if (at.equals("30") || at.equals("75")  || at.equals("25")   ) {
			String startDate = request.getParameter("startDate");
			String endDate = request.getParameter("endDate");
			String mType = request.getParameter("mType");
			
			String redirectURL = "http://" + hostname  + ":8181/webreport/book?startDate=" + startDate + "&endDate=" + endDate + "&mType=" + mType;
			response.sendRedirect(redirectURL);
			
		} else if (at.equals("35")) {
			String id = request.getParameter("id");
			out.println("ID:" + id + "--");
			String hostname2 = "cvyhj3a27";
			String redirectURL = "http://" + hostname2  + ":8181/fisAssetServlet/readxml?appID=" + id;
			response.sendRedirect(redirectURL);
			
		} else if (at.equals("40")) {
			String id = request.getParameter("leadID");
			out.println("leadID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			if (at2.equals("40")) {
				String redirectURL = "http://" + hostname  + ":8181/webreport/getlead?leadID=" + id ;
				response.sendRedirect(redirectURL);
			} else {
				String redirectURL = "http://" + hostname  + ":8181/webreport/sfquery" ;				
				response.sendRedirect(redirectURL);
			}	
		} else if (at.equals("50")) {
			String id = request.getParameter("leadID");
			out.println("leadID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			//String redirectURL = "http://" + hostname  + ":8181/webreport/gettoken?appID=" + id;
			String redirectURL = "http://" + hostname  + ":8181/webreport/getlead?leadID=" + id ;
			response.sendRedirect(redirectURL);	
		} else if (at.equals("45")) {
			String id = request.getParameter("id");
			//out.println("ID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			String redirectURL = "http://" + hostname  + ":8181/webreport/gettoken";
			response.sendRedirect(redirectURL);		
		} else if (at.equals("60")) {
			//String id = request.getParameter("id");
			//out.println("ID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			//String redirectURL = "http://" + hostname  + ":8181/webreport/lastship";
			String mType = request.getParameter("mType");
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilreport?mType=" + mType;
			
			response.sendRedirect(redirectURL);	
		} else if (at.equals("70")) {
			//String id = request.getParameter("id");
			//out.println("ID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			//String redirectURL = "http://" + hostname  + ":8181/webreport/ccaninfo";
			
			String mType = request.getParameter("mType");
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilreport?mType=" + mType;
			response.sendRedirect(redirectURL);	
		} else if (at.equals("85")) {
		 
			//out.println("ID:" + id + "--");
			//String hostname2 = "cvyhj3a27";
			
			//String redirectURL = "http://" + hostname  + ":8181/webreport/utilization" ;
			String mType = request.getParameter("mType");
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilreport?mType=" + mType;
			
			
			response.sendRedirect(redirectURL);	
		} else if ((at.equals("80")) || (at.equals("90")) || (at.equals("95")) ) {
			//String redirectURL = "http://" + hostname  + ":8181/webreport/snapshot";
			String mType = request.getParameter("mType");
			String redirectURL = "http://" + hostname  + ":8181/webreport/ilreport?mType=" + mType;
			response.sendRedirect(redirectURL);	
		} 
	}

      out.write("\r\n");
      out.write(" \r\n");
      out.write(" \r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
