<%@ page language="java" contentType="text/html ; charSet=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import = "java.sql.* , java.util.* " %>
<% 
    String un=request.getParameter("uname");
    String em=request.getParameter("email");
    String mn=request.getParameter("mobileno");
    String pw=request.getParameter("passw");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","");
        Statement st = con.createStatement();
        int up = st.executeUpdate("insert into userdata(username,email,mobileno,password) values('"+un+"','"+em+"','"+mn+"','"+pw+"') ");
        out.println("Inserted");
    }
    catch(Exception e){
        System.out.print(e);
        e.printStackTrace();
    }
    finally{
        out.close();
    }
%>
