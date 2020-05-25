<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>${category.name}</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
</head>
<body>
	<div class="jumbotron jumbotron-fluid">
	  <div class="container">
	    <h1 class="text-center" id="jumboTitle">${category.name} Articles</h1>
	    <p class="text-center">To Help Make Your Life Better</p>
	  </div>
	</div>

	
	<c:forEach var="article" items="${articles}">
	<div class="jumbotron jumbotron-fluid">
  		<div class="container">
		<a href="${article.reference}" target="_blank">
    		<h1 class="display-3">${article.title}</h1>
		</a>
    		<p class="lead">${article.contents}</p>
  		</div>
	</div>
	</c:forEach>
	<br>
	<div class="jumbotron jumbotron-fluid">
	  	<div class="container">
	  	<a href="getEvents.do?id=${category.id}">
	    <h1 class="text-center">Events</h1>
	    </a>
	    <p class="text-center">All ${category.name} related Events</p>
	  	</div>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<footer class="container-fluid text-center">
	  <p>Footer Text</p>
	</footer>
</body>
</html>