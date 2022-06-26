<%@ page language = 'java' contentType = "text/html; charSet = ISO-8859-1" pageEncoding = "ISO-8859-1" %>
<%@ page import = "java.sql.*, java.util.*" %>

<%
        String userName = request.getParameter("uname");
        String password = request.getParameter("passw");

        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/users", "root", "");
            PreparedStatement ps = con.prepareStatement("select * from userdata where username = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                String check = rs.getString("password"); 
                out.println(check);
                if(check.equals(password))
                    out.println("Welcome Back..!"+ rs.getString("userName"));
                else
                    out.println("Invalid password..!");
            }
            else{
                out.println("Invalid User.....");
            }
        }
        catch(Exception e){
            System.out.print(e);
            e.printStackTrace();
        }
%>
