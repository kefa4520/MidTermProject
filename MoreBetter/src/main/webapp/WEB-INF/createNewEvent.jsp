<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Create Profile</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}
* {
  box-sizing: border-box;
}
/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}
/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.registerbtn:hover {
  opacity: 1;
}
/* Add a blue text color to links */
a {
  color: dodgerblue;
}
/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
<form action="addEvent.do" method="POST">
    <h1>New Event Registration</h1>
    <p>Please fill in this form to create a new event.</p>
    <hr>
    <label for="title"><b>Title</b></label>
    <input type="text" placeholder="Enter Title" name="email" required>
    
    <label for="username"><b>Create a User Name</b></label>
    <input type="text" placeholder="Enter Username" name="username" required>
    <label for="password"><b>Password</b></label>
    <input type="text" placeholder="Enter Password" name="password" required>
    
    <label for="firstName"><b>First Name</b></label>
    <input type="text" placeholder="Enter your first name" name="firstName" required>
    
     <label for="lastName"><b>Last Name</b></label>
    <input type="text" placeholder="Enter your last name" name="lastName" required>
    
    
     <label for="role"><b>Applying to be a Mentor?</b></label>
  
     <select id="role" name="role" required> 
    	<option value="STANDARD">no</option>
    	<option value="APPLICANT">yes</option>
    </select><br><br>
    
    
     <label for="age"><b>Age</b></label>
    <input type="number" placeholder="Enter your age" name="age" ><br><br>
    
     <label for="biography"><b>Tell Us About Yourself</b></label>
    <input type="text" placeholder="fun facts, experiences, what you're looking for..." name="biography" >
    
     <label for="picture"><b>insert a picture</b></label>
    <input type="text" placeholder="insert photo URL here" name="picture" >
    
    
    <input type="hidden" name="enabled" value="true">
    
    
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
    <button type="submit" class="registerbtn">Register</button>
  
  <div class="container signin">
    <p>Already have an account? <a href="#">Sign in</a>.</p>
  </div>
	</form>
 </div>
</body>
</html>
