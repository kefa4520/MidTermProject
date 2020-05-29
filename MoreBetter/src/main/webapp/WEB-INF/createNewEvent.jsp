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
			<input type="hidden" name="mentorId" value="${sessionScope.loggedInUser.id}"/> 
		    <h1>New Event Registration</h1>
		    <p>Please fill in this form to create a new event.</p>
		    <hr>
		    <label for="title"><b>Title</b></label>
		    <input type="text" placeholder="Enter Title" name="title" required>
		    
		    <label for="description"><b>Description</b></label>
		    <input type="text" placeholder="Enter a Description of the Event" name="description" required>
		    
		    <label for="location"><b>Event Location</b></label>
		    <input type="text" placeholder="Enter Event Location/Address" name="location" required>
		    
		    <label for="price"><b>Price</b></label>
		    <input type="text" placeholder="Enter an Admission Price" name="price">
		    
		    <label for="capacity"><b>Max Capacity</b></label>
		    <input type="number" placeholder="Enter the Maximum Attendee Capacity" name="maxCapacity">
		    
		    
		    <label for="category"><b>Choose a Category</b></label>
		  
		    <select id="category" name="cId" required> 
		    	<option type="number" value="1">Finance</option>
		    	<option type="number" value="2">Mental Health</option>
		    	<option type="number" value="3">Fitness</option>
		    </select><br><br>
		    
		    
		    <label for="date"><b>Date</b></label>
		    <input type="datetime-local" name="eventDate" required><br><br>

		    <hr>
		    <p>By creating an Event you agree to our <a href="https://www.youtube.com/watch?v=oHg5SJYRHA0" target="_blank">Terms & Privacy</a>.</p>
		    <button type="submit" class="registerbtn">Create Event</button>
		</form>
 	  </div>
</body>
</html>
