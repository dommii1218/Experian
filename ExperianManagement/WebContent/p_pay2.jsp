<%@page import="sun.rmi.log.LogInputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="action.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%
int id = Integer.parseInt(request.getQueryString());
Connection con = Dbcon.getCon();
Statement st = con.createStatement();
int i = st.executeUpdate("update bill set status= 'Paid', pay_time = now() where id = " + id + "");

if (i != 0) {
	response.sendRedirect("patient_bill.jsp?msg=success");
} else {
	response.sendRedirect("patient_pay.jsp?msg=fail");
}
%>