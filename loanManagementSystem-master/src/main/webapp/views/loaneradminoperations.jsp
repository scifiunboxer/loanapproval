<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Loaner Admin Operations</title>
</head>
<body>

    <!-- Display operation message if available -->
    <c:if test="${not empty operation}">
        <p>${operation}</p>
    </c:if>

    <!-- Display loaner details if updateloaner attribute exists -->
    <c:if test="${not empty updateloaner}">
        <h3>Loaner Details (Update):</h3>
        <p><strong>Loaner Name:</strong> ${updateloaner.loanername}</p>
        <p><strong>Loaner Email:</strong> ${updateloaner.loaneremail}</p>
        <p><strong>Loaner Number:</strong> ${updateloaner.loanernumber}</p>
        <p><strong>Loaner Age:</strong> ${updateloaner.loanerage}</p>
        <p><strong>Password:</strong> ${updateloaner.password}</p>
    </c:if>

    <!-- Display all loaners details if alloaners attribute exists -->
    <c:if test="${not empty alloaners}">
        <h3>All Loaners:</h3>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Number</th>
                    <th>Age</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="loaner" items="${alloaners}">
                    <tr>
                        <td>${loaner.loanerid}</td>
                        <td>${loaner.loanername}</td>
                        <td>${loaner.loaneremail}</td>
                        <td>${loaner.loanernumber}</td>
                        <td>${loaner.loanerage}</td>
                        <td>${loaner.password}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>

    <!-- Display deletion message if available -->
    <c:if test="${not empty deletemsg}">
        <p>${deletemsg}</p>
    </c:if>
    
    	
	<% String deletemsg = (String) request.getAttribute("deletemsg");
		if(deletemsg != null) {
	%>
	<p><%= deletemsg %></p>
	<%} %>
	
	<hr>
</body>
</html>
