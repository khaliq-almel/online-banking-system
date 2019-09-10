<%-- 
    Document   : welcome
    Created on : 18-Apr-2019, 3:06:26 PM
    Author     : KHALIQ
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>welcome</title>
        <link rel="stylesheet" type="text/css" href="welcome.css">
    </head>
    <body>
        <%
            response.setHeader("Cache-Control","no-cache , no-store, must-revalidate");
            if(session.getAttribute("uname")== null)
            {
                response.sendRedirect("index.html");
            }
        %>
        
        <div class="loginbox">
            <img src="rvce.jpg" class="avatar">
        <h1>Welcome to RV Online Banking</h1> 
        <form action="about.jsp">
            <input type="submit" value="About Us"><br>
        </form>
        <form action="profile.jsp">
            <input type="submit" value="Profile"><br>
        </form>
        <form action="transfer.jsp">
            <input type="submit" value="Send Money"><br>
        </form>
        <form action="transaction.jsp">
            <input type="submit" value="Transaction History"><br>
        </form>
        <form action="educationloan.jsp">
            <input type="submit" value="Education Loan"><br>
        </form>
        <form action="homeloan.jsp">
            <input type="submit" value="Home Loan"><br>
        </form>
        <form action="LogOut">
            <input type="submit" value="LogOut"><br>
        </form>
        </div>
        
        
        
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br>
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
