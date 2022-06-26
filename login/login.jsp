<%@ page language="java" contentType="text/html" charSet="ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page import="java.sql.* , java.util.* "%>
<% 
    String uname=request.getParameter("username");
    String pass=request.getParameter("password");

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users","root","");
        PreparedStatement ps = con.prepareStatement("select * from userdata where username = ? ");
        ps.setString(1,username);
        ResultSet rs=ps.executeQuery();

        if( rs.next()){
            String check=rs.getString("password");
            out.println(check);
            if(check.equals(pass))
                out.println("Login successful" + rs.getString("username"));
            else
                out.println("Invalid password");
        }
        else
            out.println("Invalid user");
    }
    catch(Exception e){
        System.out.println(e);
        e.printStackTrace();
    }
%>