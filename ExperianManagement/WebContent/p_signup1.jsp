<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%@ page import="action.Dbcon"%>

	<%
	String uname = request.getParameter("uname");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
    String gender = request.getParameter("gender");
    String age = request.getParameter("age");
    String mail = request.getParameter("mail");
    String phone = request.getParameter("phone");
    String desc = request.getParameter("desc");
    Connection con =  Dbcon.getCon();
    Statement st = con.createStatement();
    int i = st.executeUpdate("insert into patient(uname, pass, name, gender, age, mail, phone, description, time) values('"+uname+"','"+pass+"','"+name+"','"+gender+"','"+age+"','"+mail+"','"+phone+"','"+desc+"',now())");
    if (i != 0) {
       response.sendRedirect("patient_login.jsp?msg=Register success");
    } 
    else {
    	response.sendRedirect("patient_signup.jsp?msgr=Register fails");
    }
	%>