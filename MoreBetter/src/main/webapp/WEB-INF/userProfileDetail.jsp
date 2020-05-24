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
<title>Look at YOU!</title>

<a href="/" button type="button" class="btn btn-outline-primary">Home</a>
<br>
<br>
</head>
<body>
	<br>User ID : ${user.id}
	<br>
	<br>

	<form action="updateProfile.do" method="POST">

		User Name<br> <input type="text" name="username"
			value="${user.username}" /><br>
			
		Password<br> <input type="text" name="password"
			value="${user.password}" /><br>			
		
		First Name<br> <input type="text" name="firstName"
			value="${user.firstName}" /><br>
			
		Last Name<br> <input type="text" name="lastName"
			value="${user.lastName}" /><br>
			
		Email Address<br> <input type="text" name="email"
			value="${user.email}" /><br>
				
		Mentor Status<br> <input type="text" name="role"
			value="${user.role}" /><br>	
			
		Age><br> <input type="number" name="age"
			value="${user.age}" /><br>	
			
		Biography<br> <input type="text" name="biography"
			value="${user.biography}" /><br>	
				
		Photo<br> <input type="text" name="picture"
			value="${user.picture}" /><br>	
	
	</form>
	<br>
	<br>
	<form action="destroyProfile.do" method="POST">
		<strong><em>${user.name}</em></strong> <input type="hidden"
			 value="${user.id}" /> <input type="submit" button type="button" value="Delete Yourself"/>
	</form>
	<br>
	<br>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>