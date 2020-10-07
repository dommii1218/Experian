<%@page import="sun.rmi.log.LogInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%
	String duname = (String) session.getAttribute("doctorme");
String dname = null;
String dep = null;
String pname = null;
Connection con = Dbcon.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from doctor where uname='" + duname + "'");
if (rs.next()) {
	dname = rs.getString("name");
	dep = rs.getString("dep");
}

String puname = request.getParameter("puname");
String status = request.getParameter("status");
Statement st2 = con.createStatement();
st2.executeUpdate("update patient set status = '" + status + "' where uname='" + puname + "'");
ResultSet rs2 = st2.executeQuery("select * from patient where uname='" + puname + "'");
if (rs2.next()) {
	pname = rs2.getString("name");
}
double bill = Double.parseDouble(request.getParameter("bill"));

String desc = request.getParameter("description");
Statement st3 = con.createStatement();
int i = st3.executeUpdate(
		"insert into bill(puname, pname, duname, dname, dep, bill, description, time) values('" + puname + "','" + pname
		+ "','" + duname + "','" + dname + "','" + dep + "','" + bill + "','" + desc + "',now())");
if (i != 0) {
	response.sendRedirect("doctor_actions.jsp?msg=success");
} else {
	response.sendRedirect("doctor_diagnosis.jsp?msg=fail");
}
%>