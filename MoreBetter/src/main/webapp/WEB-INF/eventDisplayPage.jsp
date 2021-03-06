<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatNumber value="${value}" type="currency" />
<fmt:formatNumber value="${value}" type="number" />
<!DOCTYPE html>
<html lang="en">
<head>
  <title>${event.title}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
</head>
<body class="eventbackground" id="eventblock">

	<c:choose>
	<c:when test="${sessionScope.loggedInUser.role == 'MENTOR'}">

		<div class="container-fluid" id="eventblockdiv">
		
		 <h1 class="text-center" id="jumboTitle">${category.name} Event:<br>"${event.title}"</h1>
		  <br>
		  <h1>${event.description}</h1>
		  <br>
			<h3>Location: ${event.location}</h3>
			<h3>Date: ${event.eventDate}</h3>
			<h3>Price: <fmt:formatNumber value="${event.price}" type="currency"/></h3>
			<h3>Max Capacity: ${event.maxCapacity}</h3>
			<h3>Date Created: ${event.created}</h3>
			
			
		<div class="container">
		  <h2>Update Event</h2>
		  <form action="updateEvent.do" method="POST">
		    <div class="form-group">
			<input type="hidden" name="id" value="${event.id}"/>
			<%-- <input type="hidden" name="event.category" value="${event.category}"/> --%>
		<%-- 	<input type="hidden" name="event.eventMentor" value="${event.eventMentor}"/> --%>
	<%-- 		<input type="hidden" name="title" value="${event.title}"/>
			<input type="hidden" name="description" value="${event.description}"/> --%>
			
			
		      <label for="title">Title:</label>
		      <input type="text" class="form-control" id="title" value="${event.title}" name="title" required>
		      <label for="description">Description:</label>
		      <input type="text" class="form-control" id="description" value="${event.description}" name="description" required>
		      <label for="location">Location:</label>
		      <input type="text" class="form-control" id="location" value="${event.location}" name="location" required>
		      <label for="price">Price:</label>
		      <input type="text" class="form-control" id="price" value="${event.price}" name="price">
		      <label for="capacity">Event Capacity:</label>
		      <input type="number" class="form-control" id="maxCapacity" value="${event.maxCapacity}" name="maxCapacity">
		    </div>
		    <div class="form-group">
		      <label for="category">Choose a Category:</label>
		      <select name="updatedCategoryId" id="updateEventForm">
		        <option value="1">Finance</option>
		        <option value="2">Mental Health</option>
		        <option value="3">Fitness</option>
		  	  </select>
		    </div>
			    <div class="form-group">
			      <label for="Date">Date:</label>
			      <input type="datetime-local" class="form-control" id="date" value="${event.eventDate}" name="eventDate" required>
			    </div>
			    <div style="text-align:center">
		    		<button type="submit" class="btn btn-success">Update ${event.title}</button>
		    	</div>
		  </form>
		  	<div style="text-align:center">
				<form action="deleteEvent.do" method="POST">
			        <input type="hidden" name="id" value="${event.id}"/> 
			        <button type="submit" class="btn btn-danger">Delete ${event.title} Event</button>
				</form>
			</div>
			<div style="text-align:center">
			<form action="addUserToEvent.do" method="POST">
		        <input type="hidden" name="uId" value="${sessionScope.loggedInUser.id}"/> 
		        <input type="hidden" name="eId" value="${event.id}"/> 
		        <button type="submit" class="btn btn-success">Add ${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</button>
			</form>
			</div>
		</div>
	  </div>
		
	
	<footer class="container-fluid text-center">
		<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
		<i class="fa fa-github" style="font-size:48px"></i>
		</a>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</c:when>
	<c:otherwise>
	<%-----------------Regular User Below Here-------------%>
		 <div class="container-fluid" id="eventblockdiv">
		
		 <h1 class="text-center" id="jumboTitle">${category.name} Event:<br>"${event.title}"</h1>
		  <br>
		  <h1>${event.description}</h1>
		  <br>
			<h3>Location: ${event.location}</h3>
			<h3>Date: ${event.eventDate}</h3>
			<h3>Price: <fmt:formatNumber value="${event.price}" type="currency"/></h3>
			<h3>Max Capacity: ${event.maxCapacity}</h3>
			<h3>Date Created: ${event.created}</h3>
			
			<c:choose>
			<c:when test="${sessionScope.loggedInUser != null}">
			<form action="addUserToEvent.do" method="POST">
		        <input type="hidden" name="uId" value="${sessionScope.loggedInUser.id}"/> 
		        <input type="hidden" name="eId" value="${event.id}"/> 
		        <button type="submit" class="btn btn-default">Add ${sessionScope.loggedInUser.firstName} ${sessionScope.loggedInUser.lastName}</button>
			</form>
	        </c:when>
	      </c:choose>
		</div>
	
	
	<footer class="container-fluid text-center">
		<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
		<i class="fa fa-github" style="font-size:48px"></i>
		</a>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	</c:otherwise>
	</c:choose>
</body>
</html>



