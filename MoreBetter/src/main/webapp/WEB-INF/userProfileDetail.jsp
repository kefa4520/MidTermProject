<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<title>Update Profile</title>
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
		.saveProfileChangesbtn {
		  background-color: #4CAF50;
		  color: white;
		  padding: 16px 20px;
		  margin: 8px 0;
		  border: none;
		  cursor: pointer;
		  width: 100%;
		  opacity: 0.9;
		}
		.saveProfileChangesbtn:hover {
		  opacity: 1;
		}
		/* Set a style for the submit button */
		.deletebtn {
		  background-color: red;
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
		<form action="updateProfile.do" method="POST">
	    	<h1>Update Your Profile</h1>
	    	<p>Update your profile here.</p>
	     	<p>Fields with a * are required.</p>
	    	<hr>
		    <input type="hidden" name="enabled" value="true">
		    <input type="hidden" name="id" value="${user.id}">
		    <label for= "Username" ><b>Username</b></label> 
		    <input type="text"placeholder="enter username"  name="username" 	value="${user.username}" required><br>
		    <label for= "Password" ><b>Password</b></label> 
		    <input type="text"placeholder="enter Password"  name="password" 	value="${user.password}" required><br>
		    <label for= "firstName" ><b>First Name</b></label> 
		    <input type="text"placeholder="enter firstName"  name="firstName" 	value="${user.firstName}" required><br>
		    <label for= "lastName" ><b>Last Name</b></label> 
		    <input type="text"placeholder="enter last name"  name="lastName" 	value="${user.lastName}" required><br>
		    <label for= "email" ><b>Email Address</b></label> 
		    <input type="text"placeholder="enter email"  name="email" 	value="${user.email}" required><br>
	      <%-- <label for= "role" ><b>Applying to be a Mentor?</b></label> 
	    <input type="text"placeholder="yes or no"  name="role" 	value="${user.role}" required><br>
	     --%>
	    	<label for="role"><b>Applying to be a Mentor?</b></label>
	     	<select id="role" name="role" required> 
	    		<option value="${user.role}">keep original status</option>
	    		<option value="STANDARD">no</option>
	    		<option value="APPLICANT">yes</option>
	    	</select><br><br>
	      	<label for= "age" ><b>Age</b></label> 
	    	<input type="text"placeholder="enter age"  name="age" 	value="${user.age}" ><br>
	      	<label for= "biography" ><b>Tell us about yourself</b></label> 
	    	<input type="text"placeholder="enter biography"  name="biography" 	value="${user.biography}" ><br>
	      	<label for="picture"><b>insert a picture</b></label>
	    	<input type="text" placeholder="insert photo URL here" name="picture" value="${user.picture}" ><br>
	    	<p>By creating an account you agree to our <a href="https://www.youtube.com/watch?v=oHg5SJYRHA0" target="_blank">Terms & Privacy</a>.</p>
	    	<button type="submit" class="saveProfileChangesbtn">Save Profile Changes for ${user.username}</button>
		</form>
	</div>
	<div>
		<form action="destroyProfile.do" method="POST">
	        <input type="hidden" name="id" value="${user.id}"/> 
	        <button type="submit" class="deletebtn">Disable ${user.username}</button>
		</form>
	</div>
</body>
</html>