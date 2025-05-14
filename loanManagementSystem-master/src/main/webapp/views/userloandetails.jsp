<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.amar.model.Student" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>User Loan Details</title>
    <style>
        * {
            box-sizing: border-box; /* Make all elements include padding and border in their total width and height */
            margin: 0;
            padding: 0;
        }

        html {
            font-family: Arial, sans-serif;
            line-height: 1.6;
        }

        body {
            background-color: #f9f9f9;
            color: #333;
            padding: 50px;
            margin-top: 70px; /* Space for fixed header */
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
            margin-left:-50px;
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
            max-width: 600px;
            margin: 0 auto;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #007BFF;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="email"],
        select,
        input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #007BFF;
            outline: none;
        }

        button {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #218838;
        }

        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            header {
                flex-direction: column;
                align-items: flex-start;
            }

            nav ul {
                flex-direction: column;
                align-items: flex-start;
                gap: 10px;
            }
        }
    </style>
</head>
<body>
    <% 
        Student student = (Student) request.getAttribute("loggedInStudent");
        String email = "";
        String fullname = "";
        if (student != null) {
            email = student.getEmail();
            fullname = student.getFullname();
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

    <div class="content">
        <h1>User Loan Details</h1>
        <!-- <form action="saveuserdetail" method="POST" enctype="multipart/form-data"> -->
         <form action="submittemp" method="POST" enctype="multipart/form-data">
            <label>Fullname:</label>
            <input type="text" id="fullname" name="fullname" placeholder="fullname" value="devi9" required/>

            <label>Loan Type:</label>
            <select name="loanType" required>
                <option value="personalloans">Personal Loans</option>
                <option value="homeloans">Home Loans</option>
                <option value="agricultureloans">Agriculture Loans</option>
                <option value="educationloans">Education Loans</option>
            </select>

            <label>Email:</label>
            <input type="text" id="email" name="email" placeholder="email" value="devi@gmail.com" required/>

            <label>Phone Number:</label>
            <input type="text" id="phonenumber" name="phoneNumber" placeholder="phonenumber" required/>

            <label>Documents For Loan (Image):</label>
            <input type="file" id="document" name="document" required/>

            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>
