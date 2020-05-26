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

	<c:choose>
	<c:when test="${sessionScope.loggedInUser.role == 'MENTOR'}">

		<div class="container-fluid" id="eventblock">
		
		 <h1 class="text-center" id="jumboTitle">${category.name} Event:<br>"${event.title}"</h1>
		  <br>
		  <h1>${event.description}</h1>
		  <br>
			<h3>Location: ${event.location}</h3>
			<h3>Date: ${event.eventDate}</h3>
			<h3>Price: <fmt:formatNumber value="${event.price}" type="currency"/></h3>
			<h3>Date Created: ${event.created}</h3>
			
			
		<div class="container">
		  <h2>Update Event</h2>
		  <form action="updateEvent.do">
		    <div class="form-group">
		      <label for="location">Location:</label>
		      <input type="text" class="form-control" id="email" value="${event.location}" name="location">
		    </div>
		    <div class="form-group">
		      <label for="category">Choose a Category:</label>
		      <select name="categories" id="updateEventForm">
		        <option value="1">Finance</option>
		        <option value="2">Mental Health</option>
		        <option value="3">Fitness</option>
		  	  </select>
		    </div>
		    <div class="form-group">
		      <label for="Date">Date:</label>
		      <input type="text" class="form-control" id="date" value="${event.eventDate}" name="date">
		    </div>
		
		    <button type="submit" class="btn btn-default">Submit</button>
		  </form>
		</div>
			<div>
		<form action="updateEvent.do" method="POST">
	        <input type="hidden" value="${event.id}"/> 
	        <button type="submit" class="btn btn-default">Update ${event.title}</button>
		</form>
	</div>
		</div>
		<p>Enabled User<p>
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		<footer class="container-fluid text-center">
		 <p>Footer Text</p>
		</footer>
	</c:when>
	<c:otherwise>
	<%-----------------Regular User Below Here-------------%>
		 <div class="container-fluid" id="eventblock">
		
		 <h1 class="text-center" id="jumboTitle">${category.name} Event:<br>"${event.title}"</h1>
		  <br>
		  <h1>${event.description}</h1>
		  <br>
			<h3>Location: ${event.location}</h3>
			<h3>Date: ${event.eventDate}</h3>
			<h3>Price: <fmt:formatNumber value="${event.price}" type="currency"/></h3>
			<h3>Date Created: ${event.created}</h3>
			
			<form action="addUserToEvent.do" method="POST">
	        <input type="hidden" name="uId" value="${sessionScope.loggedInUser.id}"/> 
	        <input type="hidden" name="eId" value="${event.id}"/> 
	        <button type="submit" class="btn btn-default">Add ${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</button>
		</form>
		</div>
	
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		<footer class="container-fluid text-center">
		 <p>Footer Text</p>
		</footer>
	</c:otherwise>
	</c:choose>
</body>
</html>



