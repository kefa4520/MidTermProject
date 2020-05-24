<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
	<link rel="stylesheet" type="text/css" href="style/style.css">
<title>All about YOU!</title>
</head>
<body>
<a href="/" button type="button" class="btn btn-outline-primary">Home</a>
<br>
<h2> Tell us about yourself!</h2>
<br>
Fields with * are mandatory (incorrect)
<br>
	<form action="userCreateProfile.do" method="POST">
	
	Create a User Name:
	<input type="text" name="username" >
	
	Enter a Password:
	<input type="text" name="password" >
	
	Your First Name:
	<input type="text" name="firstName"> 
	
	Your Last Name:
	<input type="text" name="lastName"> 
	Your Email Address:
	<input type="text" name="email" >
	
	i think this is fucked the fuck up...
	<br> Are you applying to be a mentor?:
	<select type="text" name="free"  placeholder="unspecified">
						<option value="Yes">Yes</option>
						<option value="No">No</option>
					</select><br>
	<br> Age:
	<input type="number" name="age">
	
	Tell us About yourself:
	<input type="text" name="biography" >
	
	<br><br> Insert a Photo:
	<input type="text" name="picture"> 
<br>
	<input type="submit" value="reCreate Yourself" />
</form>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>