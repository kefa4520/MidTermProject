<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatNumber value="${value}" type="currency" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>${event.title}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
</head>
<body class="eventbackground">

<div class="container-fluid" id="eventblock">

 <h1 class="text-center" id="jumboTitle">${category.name} Event:<br>"${event.title}"</h1>
  <br>
  <h1>${event.description}</h1>
  <br>
	<h3>Location: ${event.location}</h3>
	<h3>Date: ${event.eventDate}</h3>
	<h3>Price: <fmt:formatNumber value="${event.price}" type="currency"/></h3>
	<h3>Date Created: ${event.created}</h3>
	
</div>

<%-- <br>User ID : ${user.id}
	<br>
	<br>page would display an event for user, but would be editable for a mentor (test readonly)(disabled)
(remove boarder from textfield   https://stackoverflow.com/questions/26033426/bootstrap-remove-form-field-border  --%>

<%-- <input type="text" name="title"
			value="${category.name}" /><br> --%>
			
<%-- 	<form action="fixme" method="POST"> 

		Event Title<br> <input type="text" name="title" readonly="true"
			value="${event.title}" /><br><br>
			
		Speaker<br> <input type="text" name="mentorId" readonly="true"
			value="${event.mentorId}" /><br>		
			
		When<br> <input type="text" name="date" readonly="true"
			value="${event.eventDate}" /><br>			
		
		Price<br> <input type="text" name="price" readonly="true"
			value="${event.price}" /><br>
			
		Description<br> <input type="text" name="description" readonly="true"
			value="${event.description}" /><br>      // CSS to make field larger<textarea name="message" style="width:200px; height:600px;">bla bla bla</textarea>
			
	
	
	</form> --%>

<%-- 	<form action="eventEnroll" method="POST">
		<strong><em>${user.name}</em></strong> <input type="hidden"
			 value="${user.id}" /> <input type="submit" button type="button" value="sign up"/>
	</form> --%>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<footer class="container-fluid text-center">
	 <p>Footer Text</p>
	</footer>
</body>
</html>



