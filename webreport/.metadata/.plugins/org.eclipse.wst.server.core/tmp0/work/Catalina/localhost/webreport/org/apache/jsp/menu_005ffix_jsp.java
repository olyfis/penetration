/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.10
 * Generated at: 2019-01-08 20:32:36 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class menu_005ffix_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("/includes/header.html", Long.valueOf(1541092526235L));
    _jspx_dependants.put("/includes/css/menu.css", Long.valueOf(1541092087863L));
    _jspx_dependants.put("/includes/css/header.css", Long.valueOf(1546615914253L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
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
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=iso-8859-1\" />\r\n");
      out.write("<title>Olympus FIS Web Report Menu</title>\r\n");
      out.write("\r\n");
      out.write("<style>");
      out.write("* {box-sizing: border-box;}\r\n");
      out.write("\r\n");
      out.write(".btn{\r\n");
      out.write("  background:#4289f4;\r\n");
      out.write("  width:155px;\r\n");
      out.write("  padding-top:5px;\r\n");
      out.write("  padding-bottom:5px;\r\n");
      out.write("  color:white;\r\n");
      out.write("  border-radius:4px;\r\n");
      out.write("  border: #27ae60 1px solid;\r\n");
      out.write("  \r\n");
      out.write("  margin-top:20px;\r\n");
      out.write("  margin-bottom:20px;\r\n");
      out.write("  float:left;\r\n");
      out.write("  margin-left:16px;\r\n");
      out.write("  font-weight:800;\r\n");
      out.write("  font-size:0.8em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".btn3{\r\n");
      out.write("  background:#4289f4;\r\n");
      out.write("  width:50px;\r\n");
      out.write("  padding-top:5px;\r\n");
      out.write("  padding-bottom:5px;\r\n");
      out.write("  color:white;\r\n");
      out.write("  border-radius:4px;\r\n");
      out.write("  border: #27ae60 1px solid;\r\n");
      out.write("  \r\n");
      out.write("  margin-top:20px;\r\n");
      out.write("  margin-bottom:20px;\r\n");
      out.write("  \r\n");
      out.write("  margin-left:4px;\r\n");
      out.write("  font-weight:800;\r\n");
      out.write("  font-size:0.8em;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("body { \r\n");
      out.write("  margin: 0;\r\n");
      out.write("  font-family: Arial, Helvetica, sans-serif;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header {\r\n");
      out.write("  overflow: hidden;\r\n");
      out.write("  background-color: #f1f1f1;\r\n");
      out.write("  padding: 20px 10px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header a {\r\n");
      out.write("  float: left;\r\n");
      out.write("  color: black;\r\n");
      out.write("  text-align: center;\r\n");
      out.write("  padding: 12px;\r\n");
      out.write("  text-decoration: none;\r\n");
      out.write("  font-size: 18px; \r\n");
      out.write("  line-height: 10px;\r\n");
      out.write("  border-radius: 4px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header a.logo {\r\n");
      out.write("  font-size: 25px;\r\n");
      out.write("  font-weight: bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header a:hover {\r\n");
      out.write("  background-color: #ddd;\r\n");
      out.write("  color: black;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header a.active {\r\n");
      out.write("  background-color: dodgerblue;\r\n");
      out.write("  color: white;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write(".header-right {\r\n");
      out.write("  float: right;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("@media screen and (max-width: 500px) {\r\n");
      out.write("  .header a {\r\n");
      out.write("    float: none;\r\n");
      out.write("    display: block;\r\n");
      out.write("    text-align: left;\r\n");
      out.write("  }\r\n");
      out.write("  .header-right {\r\n");
      out.write("    float: none;\r\n");
      out.write("  }\r\n");
      out.write("}");
      out.write("</style>\r\n");
      out.write("<style>");
      out.write("th.theader {\r\n");
      out.write("\tbackground-color: #5DADE2;\r\n");
      out.write("\tborder-style : solid;\r\n");
      out.write("\tborder-width : 0px 1px 1px 0px;\r\n");
      out.write("\tfont-family: Tahoma, Verdana, Trebuchet MS, sans-serif;\r\n");
      out.write("\tfont-size: 11px;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("td.table_cell {\r\n");
      out.write("\tbackground-color: #cdc0b0;\r\n");
      out.write("\tborder-style : solid;\r\n");
      out.write("\tborder-width : 0px 1px 1px 0px;\r\n");
      out.write("\tfont-family: Tahoma, Verdana, Trebuchet MS, sans-serif;\r\n");
      out.write("\tfont-size: 11px;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("}\r\n");
      out.write("td.table_cell_div {\r\n");
      out.write("\tbackground-color: #cdc0b0;\r\n");
      out.write("\tborder-style : solid;\r\n");
      out.write("\tborder-width : 0px 1px 1px 0px;\r\n");
      out.write("\tfont-family: Tahoma, Verdana, Trebuchet MS, sans-serif;\r\n");
      out.write("\tfont-size: 11px;\r\n");
      out.write("\tfont-weight : bold;\r\n");
      out.write("\twidth=\"100px\"\r\n");
      out.write("}\r\n");
      out.write("td {\r\n");
      out.write("  font-size: 11px;\r\n");
      out.write("  font-weight: normal;\r\n");
      out.write("  margin-top: 5px;\r\n");
      out.write("}\r\n");
      out.write("table.a {\r\n");
      out.write("    table-layout: auto;  \r\n");
      out.write("}\r\n");
      out.write("th.b, td.b {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 20px;\r\n");
      out.write("    background-color: #5DADE2;\r\n");
      out.write("}\r\n");
      out.write("tr.b {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 20px;\r\n");
      out.write("    background-color: deepskyblue;\r\n");
      out.write("}\r\n");
      out.write("th, td {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 150px;\r\n");
      out.write("}\r\n");
      out.write("th.c, td.c {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 300px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("th.a, td.a {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 150px;\r\n");
      out.write("}\r\n");
      out.write("th.s, td.s {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 50px;\r\n");
      out.write("}\r\n");
      out.write("th.e, td.e {\r\n");
      out.write("    border: 1px solid black;\r\n");
      out.write("    width: 80px;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("/* Extra selectors needed to override the default styling */\r\n");
      out.write("table.tablesorter tbody tr.normal-row td {\r\n");
      out.write("  background: #D7DBDD;\r\n");
      out.write("  color: #000;\r\n");
      out.write("}\r\n");
      out.write("table.tablesorter tbody tr.alt-row td {\r\n");
      out.write("  background: #AEB6BF;\r\n");
      out.write("  color: #000;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write(".tablesorter-blue .header,\r\n");
      out.write(".tablesorter-blue .tablesorter-header {\r\n");
      out.write("\t/* black (unsorted) double arrow */\r\n");
      out.write("\tbackground-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==);\r\n");
      out.write("\t/* white (unsorted) double arrow */\r\n");
      out.write("\t/* background-image: url(data:image/gif;base64,R0lGODlhFQAJAIAAAP///////yH5BAEAAAEALAAAAAAVAAkAAAIXjI+AywnaYnhUMoqt3gZXPmVg94yJVQAAOw==); */\r\n");
      out.write("\t/* image */\r\n");
      out.write("\t/* background-image: url(images/black-unsorted.gif); */\r\n");
      out.write("\tbackground-repeat: no-repeat;\r\n");
      out.write("\tbackground-position: center right;\r\n");
      out.write("\tpadding: 4px 18px 4px 4px;\r\n");
      out.write("\twhite-space: normal;\r\n");
      out.write("\tcursor: pointer;\r\n");
      out.write("}\r\n");
      out.write(".tablesorter-blue .headerSortUp,\r\n");
      out.write(".tablesorter-blue .tablesorter-headerSortUp,\r\n");
      out.write(".tablesorter-blue .tablesorter-headerAsc {\r\n");
      out.write("\tbackground-color: #9fbfdf;\r\n");
      out.write("\t/* black asc arrow */\r\n");
      out.write("\tbackground-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7);\r\n");
      out.write("\t/* white asc arrow */\r\n");
      out.write("\t/* background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAAP///////yH5BAEAAAEALAAAAAAVAAQAAAINjI8Bya2wnINUMopZAQA7); */\r\n");
      out.write("\t/* image */\r\n");
      out.write("\t/* background-image: url(images/black-asc.gif); */\r\n");
      out.write("}\r\n");
      out.write(".tablesorter-blue .headerSortDown,\r\n");
      out.write(".tablesorter-blue .tablesorter-headerSortDown,\r\n");
      out.write(".tablesorter-blue .tablesorter-headerDesc {\r\n");
      out.write("\tbackground-color: #8cb3d9;\r\n");
      out.write("\t/* black desc arrow */\r\n");
      out.write("\tbackground-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAACMtMP///yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7);\r\n");
      out.write("\t/* white desc arrow */\r\n");
      out.write("\t/* background-image: url(data:image/gif;base64,R0lGODlhFQAEAIAAAP///////yH5BAEAAAEALAAAAAAVAAQAAAINjB+gC+jP2ptn0WskLQA7); */\r\n");
      out.write("\t/* image */\r\n");
      out.write("\t/* background-image: url(images/black-desc.gif); */\r\n");
      out.write("}\r\n");
      out.write(".tablesorter-blue thead .sorter-false {\r\n");
      out.write("\tbackground-image: none;\r\n");
      out.write("\tcursor: default;\r\n");
      out.write("\tpadding: 4px;\r\n");
      out.write("}\r\n");
      out.write("</style>\r\n");
      out.write(" <link rel=\"stylesheet\" href=\"includes/css/calendar.css\" />\r\n");
      out.write("\r\n");
      out.write("<!-- ********************************************************************************************************************************************************* -->\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("  \r\n");
      out.write(" ");
      out.write("<!--  ************************************************************************************************************************************************ -->\r\n");
      out.write("<div class=\"header\">\r\n");
      out.write("  <a href=\"http://cvyhj3a27:8181/webreport/menu.jsp\" class=\"logo\"><img src=\"includes/images/logo.jpg\"  height=\"50\" width=\"250\"></a>\r\n");
      out.write("  <div class=\"header-right\">\r\n");
      out.write("    <a class=\"active\" href=\"http://cvyhj3a27:8181/webreport/menu.jsp\">Home</a>\r\n");
      out.write("  </div>\r\n");
      out.write("</div>\r\n");
      out.write("<!--   \r\n");
      out.write("<div style=\"padding-left:20px\">\r\n");
      out.write("  <h3>FIS Report Landing Page</h3>\r\n");
      out.write("</div>\r\n");
      out.write("-->\r\n");
      out.write("<!--  ************************************************************************************************************************************************ -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<div style=\"padding-left:20px\">\r\n");
      out.write("  <h3>FIS Report Landing Page</h3>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<BR>\r\n");
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
