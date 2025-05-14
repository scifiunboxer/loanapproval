<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMS Home</title>
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
<body style="font-family: Arial, sans-serif; background-color: #f4f4f4; text-align: center; padding: 50px;">
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
    <h2 style="color: #333; font-size: 24px; margin-bottom: 20px;">Loan Management System</h2>

    <a type="button" href="signup" style="display: inline-block; padding: 10px 20px; margin: 10px; background-color: #007BFF; color: white; text-decoration: none; border-radius: 5px; font-size: 16px;">Sign Up</a><br/>

    <a type="button" href="login" style="display: inline-block; padding: 10px 20px; margin: 10px; background-color: #28a745; color: white; text-decoration: none; border-radius: 5px; font-size: 16px;">Login</a>

</body>
</html>
