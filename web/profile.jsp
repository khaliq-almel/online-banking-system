<%-- 
    Document   : profile
    Created on : 20-Apr-2019, 5:24:03 PM
    Author     : KHALIQ
--%>

<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.banking.Connect"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="profile.css">
    </head>
    <body>
    
       
       
        <div class="loginbox">
            <img src="profile.png" class="avatar">
            <h1> P R O F I L E</h1>
            <% 
                try
                {
                    Connect connect =new Connect("root","R00tP@55w0rd","banking");
                    String uname=(String)session.getAttribute("uname");
                    System.out.println(uname);
                    String profile_q="select * from customer_data where uname='"+uname+"';";
                    ResultSet rs=connect.execute_query(profile_q);
                    rs.next();
                    
                    out.println("<p><h1>Balance</h1></p><h1 Style='color:red'>"+ rs.getInt("balance")+"</h1><h3>");
                    out.println("Account Number : "+rs.getInt("acc_no")+"<br>");
                    out.println("Name : " + rs.getString("fname") + " " + rs.getString("lname")+"<br>");
                    out.println("EmilId : "+rs.getString("email")+"<br>");
                    out.println("DOB : "+rs.getInt("dob")+"<br>");
                    out.println("Contact : "+rs.getInt("ph_no")+"<br>");
                    out.println("City : "+rs.getString("city")+"<br></h3>");
                    
                    out.println("<hr>");
                    out.println("<h2 style='color:#009933'>Card Details</h2><h3>");
                    out.println("Card Number -------:"+rs.getInt("card")+"<br>");
                    out.println("Expiry Date -------:"+rs.getInt("exp")+"<br></h3><hr>");
                    
                    
                }
                catch(SQLException e)
                {
                  System.out.println(e.getMessage());
                }
                
            %>
            
            
        </div>
             <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
            <div>
                <center>
            <footer>
                <br>
                <a href="gmail.com" ><img src="gmail.png" width="30" height="30"></a>Email
                <a href="youtube.com" ><img src="youtube.png" width="30" height="30"></a>YouTube
                <a href="twitter.com" ><img src="twitter.png" width="30" height="30"></a>twitter
                <a href="instagram.com" ><img src="instagram.png" width="30" height="30"></a>instagram
                <a href="facebook.com" ><img src="facebook.png" width="30" height="30"></a>facebook
            </footer>
                    </center>
        </div>
            
    </body>
</html>
