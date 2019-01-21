<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Example</title>
</head>
<body>
<%
    out.println("The current date/time is " + new java.util.Date());
    this.test(out, "Hi, Mom!");
%>
<%!
    private void test(JspWriter out, String msg) throws java.io.IOException {
        out.println(msg);
    }
%>
</body>
</html>