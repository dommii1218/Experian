<%@page import="action.Dbcon"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>



<%

    try {

        String uname = request.getQueryString();
        String sql = "update doctor set authorize = 'Authorized' where uname='" + uname + "'";

        Connection con = Dbcon.getCon();
        Statement st = con.createStatement();
        int i = st.executeUpdate(sql);
        if (i != 0) {
            response.sendRedirect("doctor_manage.jsp?msg=approved");
        } else {
            response.sendRedirect("doctor_manage.jsp?msg=fail");
        }
    } catch (Exception e) {
        e.printStackTrace();;
    }


%>