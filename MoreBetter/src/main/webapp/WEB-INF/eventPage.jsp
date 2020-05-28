<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>${category.name} Events</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
</head>
<body>

	<c:choose>
	<c:when test="${sessionScope.loggedInUser.role == 'MENTOR'}">
	
		    <c:choose>
		    <c:when test="${result == true}">
		    
			    <div class="alert alert-success" role="alert">
				    <h2 class="text-center">Success! The event has been deleted!</h2>
				</div>
		    	<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1 class="text-center" id="jumboTitle">${category.name} Event Page</h1>
			    <p class="text-center">Better yourself with these awesome local ${category.name} Events!</p>
			    <form action="viewAddEvent.do" method="GET">
			    	<input type="hidden" name="id" value="${sessionScope.loggedInUser.id}"/>
			    	<div style="text-align:center">
			    	<button type="submit" class="btn btn-success">Create New Event</button>
			    	</div>
			    </form>
			  </div>
			</div>
		
			<c:forEach var="event" items="${eventsByCategory}">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			  	<a href="individualEvent.do?id=${event.id}">
			    <h1 class="display-3">${event.title}</h1>
			    </a>
			    <p class="lead">${event.description}</p>
			  </div>
			 </div>
			  <br>
			</c:forEach>
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
				<footer class="container-fluid text-center">
				<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
				<i class="fa fa-github" style="font-size:48px"></i>
				</a>
			</footer>
		    </c:when>
		    <c:otherwise>
			<%--If an event was not deleted, display the list of events as normal below - eventually this needs to be refactored into its own jsp as an include \--%>
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1 class="text-center" id="jumboTitle">${category.name} Event Page</h1>
			    <p class="text-center">Better yourself with these awesome local ${category.name} Events!</p>
			    <form action="viewAddEvent.do" method="GET">
			    	<input type="hidden" name="id" value="${sessionScope.loggedInUser.id}"/>
			    	<button type="submit" class="btn btn-success">Create New Event</button>
			    </form>
			  </div>
			</div>
		
			<c:forEach var="event" items="${eventsByCategory}">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			  	<a href="individualEvent.do?id=${event.id}">
			    <h1 class="display-3">${event.title}</h1>
			    </a>
			    <p class="lead">${event.description}</p>
			  </div>
			 </div>
			  <br>
			</c:forEach>
		
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
			<footer class="container-fluid text-center">
				<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
				<i class="fa fa-github" style="font-size:48px"></i>
				</a>
			</footer>
			</c:otherwise>
			</c:choose>
	</c:when>
	<c:otherwise>
	<%-----IF THE USER IS NOT A MENTOR SEE THIS PAGE BELOW-----%>		
		    <c:choose>
		    <c:when test="${result == true}">
		    
			    <div class="alert alert-success" role="alert">
				    <h2 class="text-center">Success! The event has been deleted!</h2>
				</div>
		    	<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1 class="text-center" id="jumboTitle">${category.name} Event Page</h1>
			    <p class="text-center">Better yourself with these awesome local ${category.name} Events!</p>
			  </div>
			</div>
		
			<c:forEach var="event" items="${eventsByCategory}">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			  	<a href="individualEvent.do?id=${event.id}">
			    <h1 class="display-3">${event.title}</h1>
			    </a>
			    <p class="lead">${event.description}</p>
			  </div>
			 </div>
			  <br>
			</c:forEach>
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
				<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
				<footer class="container-fluid text-center">
				<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
				<i class="fa fa-github" style="font-size:48px"></i>
				</a>
			</footer>
		    </c:when>
		    <c:otherwise>
			<%--If an event was not deleted, display the list of events as normal below - eventually this needs to be refactored into its own jsp as an include \--%>
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			    <h1 class="text-center" id="jumboTitle">${category.name} Event Page</h1>
			    <p class="text-center">Better yourself with these awesome local ${category.name} Events!</p>
			  </div>
			</div>
		
			<c:forEach var="event" items="${eventsByCategory}">
			<div class="jumbotron jumbotron-fluid">
			  <div class="container">
			  	<a href="individualEvent.do?id=${event.id}">
			    <h1 class="display-3">${event.title}</h1>
			    </a>
			    <p class="lead">${event.description}</p>
			  </div>
			 </div>
			  <br>
			</c:forEach>
		
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
			<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
			<footer class="container-fluid text-center">
				<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
				<i class="fa fa-github" style="font-size:48px"></i>
				</a>
			</footer>
			</c:otherwise>
			</c:choose>
	</c:otherwise>
	</c:choose>
</body>
</html>