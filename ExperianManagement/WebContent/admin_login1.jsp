<%
String aname = request.getParameter("aname");
String apass = request.getParameter("apass");

    if(aname.equalsIgnoreCase("admin") &&(apass.equalsIgnoreCase("admin")))
               {
    
    response.sendRedirect("admin_home.jsp?msg=success");
    }
    else{
response.sendRedirect("admin_login.jsp?msg=fail");
}

%>