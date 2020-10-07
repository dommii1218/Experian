<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="action.Dbcon"%>

	<%
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String dep = request.getParameter("dep");
    try {
    Connection con =  Dbcon.getCon();
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into doctor(uname, pass, name, gender, mail, phone, dep, time) values('"+uname+"','"+pass+"','"+name+"','"+gender+"','"+mail+"','"+phone+"','"+dep+"',now())");
    if (i != 0) {

       response.sendRedirect("doctor_login.jsp?msg=Register success");

        
    } else {
       response.sendRedirect("doctor_signup.jsp?msgr=Register fails");
    }
    }
    catch(Exception ex) {} 
	%>