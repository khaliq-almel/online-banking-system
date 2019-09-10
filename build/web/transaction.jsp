<%-- 
    Document   : transaction
    Created on : 20-Apr-2019, 5:25:30 PM
    Author     : KHALIQ
--%>

<%@page import="com.banking.Connect"%>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tranaction history</title>
    </head>
    <body>
        <div style="background-color: #990000">
        <h1 style='color:#ffff00'>Transaction History</h1>
        <hr>
        </div>
        
        <div style='background-color:#ffcccc'>
            <br><h2 style='color:#990000'>Sent</h2>
            <div>
            
            <% 
                try
                {
                    Connect connect =new Connect("root","R00tP@55w0rd","banking");
                    String uname=(String)session.getAttribute("uname");
                    System.out.println(uname);
                    String profile_q="select * from transactions where from_t ='"+uname+"';";
                    ResultSet rs=connect.execute_query(profile_q);
                    out.println("<h3> FROM | TO | AMOUNT | DATETIME</h3><br>");
                    while(rs.next())
                    {
                        out.println("<h5> "+ rs.getString("from_t") + "-----"+ rs.getString("to_t")+ "----- " + rs.getInt("amount") + "----- " + rs.getString("time_t")+ "</h5>");
                    }
                    
                    
                    
                }
                catch(SQLException e)
                {
                  System.out.println(e.getMessage());
                }
                
            %>
            
        </div>
            
            <hr>
        </div>
            
            
            
            <div style='background-color:#ccffcc'>
                <br><h2 style='color:#990000'>Recieved</h2>
            <div>
            
            <% 
                try
                {
                    Connect connect =new Connect("root","R00tP@55w0rd","banking");
                    String uname=(String)session.getAttribute("uname");
                    System.out.println(uname);
                    String profile_q="select * from transactions where to_t ='"+uname+"';";
                    ResultSet rs=connect.execute_query(profile_q);
                    out.println("<h3> FROM | TO | AMOUNT | DATETIME</h3><br>");
                    while(rs.next())
                    {
                        out.println("<h5> "+ rs.getString("from_t") + "----- "+ rs.getString("to_t")+ "----- " + rs.getInt("amount") + "-----" + rs.getString("time_t")+ "</h5>");
                    }
                    
                    
                    
                }
                catch(SQLException e)
                {
                  System.out.println(e.getMessage());
                }
                
            %>
            
        </div>
            </div>
            <hr>
            <hr>
            
        
            
            <div>
            <footer>
                <br>
                <a href="gmail.com" ><img src="gmail.png" width="30" height="30"></a>Email
                <a href="youtube.com" ><img src="youtube.png" width="30" height="30"></a>YouTube
                <a href="twitter.com" ><img src="twitter.png" width="30" height="30"></a>twitter
                <a href="instagram.com" ><img src="instagram.png" width="30" height="30"></a>instagram
                <a href="facebook.com" ><img src="facebook.png" width="30" height="30"></a>facebook
            </footer>
        </div> 
            
            
            
            
        
        
        
        
        
        
        
        
        
        
        
        
        
    </body>
</html>
