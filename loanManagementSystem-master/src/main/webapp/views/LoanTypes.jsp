<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Bank Loan Approval System</title>
    <style>
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

        /* Features Section */
        .features {
            padding: 60px 20px; /* Increased padding for a spacious feel */
            text-align: center;
            background-color: #E7E8D1; /* Light gray background for contrast */
        }

        .features h2 {
            margin-bottom: 40px; /* Increased bottom margin for separation */
            font-size: 32px; /* Larger font size */
            color: #F98866; /* Primary color for the heading */
            text-transform: uppercase; /* Uppercase text for emphasis */
        }

        .product {
            display: inline-block;
            width: 220px; /* Width of each product card */
            margin: 20px;
            padding: 15px;
            border: 1px solid #e1e1e1; /* Border for the product card */
            border-radius: 10px; /* Rounded corners */
            background-color: white; /* Background color for product card */
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Soft shadow for depth */
            transition: transform 0.3s ease, box-shadow 0.3s ease; /* Smooth transitions */
        }

        .product:hover {
            transform: translateY(-5px); /* Lift effect on hover */
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); /* Darker shadow on hover */
            cursor: pointer; /* Pointer cursor on hover */
        }

        .product h3 {
            margin-top: 0; /* No margin on top */
            color: #763626; /* Heading color */
            font-size: 24px; /* Font size for product title */
            transition: color 0.3s ease; /* Transition for color change */
        }

        .product p {
            color: black; /* Gray color for description */
            font-size: 16px; /* Font size for description */
            margin: 13px 0; /* Margin for spacing */
        }

        .product button {
            padding: 10px 20px; /* Button padding */
            font-size: 16px; /* Button font size */
            background-color: #E3867D; /* Button background color */
            color: black; /* Button text color */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            cursor: pointer; /* Pointer cursor */
            transition: background-color 0.3s ease, transform 0.3s ease; /* Smooth transitions */
        }
        
        .product button a{
        	text-decoration: none;
        	color: white;
        }
        .product button a:hover{
        	text-decoration: none;
        	color: black;
        }

        .product button:hover {
            background-color: #FFF2D7; /* Button hover color */
            transform: translateY(-2px); /* Lift effect on button hover */
            color: black;
        }
    </style>
</head>
<body>
    <main>
        <header>
            <div class="logo">[Bank Logo]</div>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Loan Products</a></li>
                    <li><a href="#">Loan Application</a></li>
                    <li><a href="#">Document Upload</a></li>
                    <li><a href="#">FAQs</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </nav>
            <div class="auth-buttons">
                <% String username = (String) session.getAttribute("username"); %>
                <button><%= username != null ? username : "User" %></button>
                <button><a href="userlogout">logout</a></button>
                
            </div>
        </header>
        
        <section class="features">
            <h2>Our Loan Products</h2>
            <div class="product">
                <h3>Personal Loans</h3>
                <p>Get quick personal loans for any need.</p>
                <button><a href="userdetailsform">Apply Now</a></button>
            </div>
            <div class="product">
                <h3>Home Loans</h3>
                <p>Affordable home loans to make your dream come true.</p>
                <button><a href="userdetailsform">Apply Now</a></button>
            </div>
            <div class="product">
                <h3>Agriculture Loans</h3>
                <p>Make your land more peacefull.</p>
                <button><a href="userdetailsform">Apply Now</a></button>
            </div>
            <div class="product">
                <h3>Education Loans</h3>
                <p>Secure your future with our education loans.</p>
                <button><a href="userdetailsform">Apply Now</a></button>
            </div>
        </section>
    </main>
</body>
</html>
