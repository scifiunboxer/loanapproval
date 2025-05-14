<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>DeleteLoaner</title>
</head>
<body>
<h1>DeleteLoaner</h1>
	
	<form action="deleteloaner" method="POST">
		
		<label>LoanerEmail: </label>
		<input type="text" id="loaneremail" name="loaneremail" placeholder="loaneremail" style="cursor: pointer" required/><br/><br/>
		
		<button type="submit" style="cursor: pointer">DeleteLoaner</button>
	</form>
	
	<% String deletemsg = (String) request.getAttribute("deletemsg");
		if(deletemsg != null) {
	%>
	<p><%= deletemsg %></p>
	<%} %>
	
	
	
	<hr>	
</body>
</html>