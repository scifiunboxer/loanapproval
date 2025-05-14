<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UpdateLoaner</title>
</head>
<body>
	<h1>UpdateLoaner</h1>
	
	<form action="updateloaner" method="POST">
		<label>Loaner Name: </label>
        <input type="text" id="loanername" name="loanername" placeholder="Loaner Name" style="cursor: pointer" required/><br/><br/>
        
        <label>Loaner Email: </label>
        <input type="email" id="loaneremail" name="loaneremail" placeholder="Loaner Email" style="cursor: pointer" required/><br/><br/>
        
        <label>Loaner Number: </label>
        <input type="number" id="loanernumber" name="loanernumber" placeholder="Loaner Number" style="cursor: pointer" required/><br/><br/>
        
        <label>Loaner Age: </label>
        <input type="number" id="loanerage" name="loanerage" placeholder="Loaner Age" style="cursor: pointer" required/><br/><br/>
        
        <label>Password: </label>
        <input type="password" id="password" name="password" placeholder="Password" style="cursor: pointer" required/><br/><br/>
		
		<button type="submit" style="cursor: pointer">UpdateLoaner</button>
	</form>
</body>
</html>