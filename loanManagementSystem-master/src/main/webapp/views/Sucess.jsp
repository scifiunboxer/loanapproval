<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Loan Approval System</title>
    <style>
        /* General Styles */
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            font-family: Arial, sans-serif;
            background-color: #E7E8D1; /* Softer background */
            color: #333;
        }

        main {
            flex: 1;
        }

        /* Header Styles */
        header {
            background-color: #476C7C; /* Deepened bank color */
            color: white;
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
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

        /* Auth Buttons */
        .auth-buttons button {
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            background-color: #FFF2D7;
            color: #004a99;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .auth-buttons button:hover {
            background-color: #F98866;
            transform: scale(1.1);
            color: white;
        }
        
        .auth-buttons button a{
        	text-decoration: none;
        	color: #004a99
        }

        /* Hero Section */
        .hero {
            height: 73vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            background-color: #E7E8D1;
            color: white;
            padding: 20px;
            gap: 15px;
        }

        .hero button {
            padding: 15px 25px;
            font-size: 18px;
            background-color: #e3867d;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.3s ease, box-shadow 0.3s ease;
        }

        .hero button:hover {
            background-color: #004a99;
            transform: scale(1.05);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        .hero button a {
            color: white;
            text-decoration: none;
        }

        /* Footer Styles */
        footer {
            background-color: #476C7C;
            color: white;
            padding: 20px;
            text-align: center;
        }

        footer .footera {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 15px;
        }

        footer a {
            color: white;
            text-decoration: none;
            transition: color 0.3s ease;
        }

        footer a:hover {
            color: #e3867d;
        }

        /* Responsive Styles */
        @media (max-width: 768px) {
            header {
                flex-direction: column;
                align-items: center;
                text-align: center;
            }

            nav ul {
                flex-direction: column;
                align-items: center;
                gap: 10px;
            }

            .hero {
                padding: 40px 20px;
            }

            footer .footera {
                flex-direction: column;
                gap: 10px;
            }
        }

        @media (max-width: 480px) {
            header .logo {
                font-size: 20px;
            }

            .hero h1 {
                font-size: 24px;
            }

            .hero button {
                font-size: 16px;
                padding: 12px 20px;
            }
        }
    </style>
</head>
<body>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div style="color: red">
        <%= request.getAttribute("errorMessage") %>
    </div>
<% } %>

    <header>
        <div class="logo">Bank Logo</div>
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
        <div class="auth-buttons">
           <% String username = (String) session.getAttribute("username"); %>
            <button><%= username != null ? username : "User" %></button>
            <button><a href="userlogout">logout</a></button>
        </div>
    </header>

    <main>
        <section class="hero">
            <h1 style="color: black">Welcome to Loan Approval System</h1>
            <button><a href="loantypes">Get Started</a></button>
            
        </section>
    </main>

    <footer>
        <div class="footera">
            <a href="#">Privacy Policy</a>
            <a href="#">Terms and Conditions</a>
            <a href="#">Sitemap</a>
            <a href="#">Facebook</a>
            <a href="#">Twitter</a>
            <a href="#">LinkedIn</a>
        </div>
    </footer>

</body>
</html>