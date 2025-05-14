<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<style>
html {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
}

body {
    margin: 0;
    padding: 50px;
    background-color: #f9f9f9;
    color: #333;
}

header {
    background-color: #476C7C;
    color: white;
    padding: 15px 20px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: fixed;
    top: 0;
    width: 100%;
    z-index: 1000;
    margin-left: -52px;
}

header .logo {
    font-size: 24px;
    font-weight: bold;
}

nav ul {
    display: flex;
    gap: 20px;
    list-style: none;
    padding: 0;
    margin: 0;
}

nav ul li a {    
    color: white;
    text-decoration: none;
    transition: color 0.3s ease;
}

nav ul li a:hover {
    color: #E2725B;
}

.content {
    margin-top: 80px; /* Adjust margin to avoid overlapping with fixed header */
}
</style>
</head>
<body style="font-family: Arial, sans-serif; background-color: #f9f9f9; color: #333; padding: 50px;">

<% 
    String message = (String) request.getAttribute("message");
    if(message != null) {
%>
<p style="color: red; font-weight: bold;"><%=message%></p>
<%
    }
%>

 <header>
        <div class="logo">Bank</div>
        <nav>
            <ul>
                <li><a href="success">Home</a></li>
                <li><a href="success">Loan Products</a></li>
                <li><a href="success">Loan Application</a></li>
                <li><a href="success">Document Upload</a></li>
                <li><a href="success">FAQs</a></li>
                <li><a href="success">Contact Us</a></li>
            </ul>
        </nav>
    </header>

<h1 style="text-align: center; color: #007BFF; font-size: 32px; margin-bottom: 30px;">Signup</h1>

<form action="signup" method="POST" style="max-width: 450px; margin: 0 auto; background-color: #fff; padding: 20px; border-radius: 10px; box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);">
    <label for="fullname" style="display: block; font-size: 18px; margin-bottom: 5px;">Fullname:</label>
    <input type="text" id="fullname" name="fullname" placeholder="Enter your fullname" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; cursor: pointer;" required/>
    
    <label for="username" style="display: block; font-size: 18px; margin-bottom: 5px;">Username:</label>
    <input type="text" id="username" name="username" placeholder="Enter your username" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; cursor: pointer;" required/>
    
    <label for="email" style="display: block; font-size: 18px; margin-bottom: 5px;">Email:</label>
    <input type="email" id="email" name="email" placeholder="Enter your email" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; cursor: pointer;" required/>
    
    <label for="password" style="display: block; font-size: 18px; margin-bottom: 5px;">Password:</label>
    <input type="text" id="password" name="password" placeholder="Enter your password" style="width: 100%; padding: 10px; margin-bottom: 20px; border-radius: 5px; border: 1px solid #ccc; cursor: pointer;" required/>
    
    <button type="submit" style="width: 100%; padding: 10px; background-color: #28a745; color: white; border: none; border-radius: 5px; font-size: 18px; cursor: pointer;">Sign Up</button>
</form>

</body>
</html>
