<%@ page language = "java" contentType = "text/html; charset = ISO-8859-1" pageEncoding = "ISO-8859-1"%>
<%@ page import = "java.sql.*, java.util.*" %>

<%
    String userName = request.getParameter("username");
    String email = request.getParameter("email");
    String mobileNo = request.getParameter("mobileno");
    String password = request.getParameter("password");

    try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root","");
            Statement st = con.createStatement();
            int up = st.executeUpdate("insert into userdata(username, email, mobileno, password) values ('"+userName+"', '"+email+"', '"+mobileNo+"', '"+password+"')");
            out.println("Data is successfully inserted.......");
    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }
    finally{
        out.close();
    }

%>