<%@page import="sun.rmi.log.LogInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%
String uname = request.getParameter("uname");
String pass = request.getParameter("pass");

Connection con = Dbcon.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(" select * from patient where uname='"+uname+"'");
if(rs.next()){
    if(rs.getString("uname").equals(uname)&&(rs.getString("pass").equals(pass)))
    {
    session.setAttribute("uname", uname);
    response.sendRedirect("patient_home.jsp?msg=success");
    }
    else{
response.sendRedirect("patient_login.jsp?msg=fail");
}
       }
else{
response.sendRedirect("patient_login.jsp?msg=fail");
}

%>