<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>MoreBetter</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>
  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }

  </style>
  <jsp:include page="navbar.jsp"/>
</head>
<body>



<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox" style="height:60%">
      <div class="item active">
        <img src="style/images/wealth-management.jpg" alt="Image">
        <div class="carousel-caption">
          <h2>More Resources</h2>
          <p></p>
        </div>      
      </div>

      <div class="item" style="height:60%">
        <img src="style/images/self-personal-growth.jpg" alt="Image">
        <div class="carousel-caption">
          <h2>To Better Your Life</h2>
          <p></p>
        </div>      
      </div>

      <div class="item" style="height:60%">
        <img src="style/images/healthy-lifestyle.jpg" alt="Image">
        <div class="carousel-caption">
          <h2>To Better Your Life</h2>
          <p></p>
        </div>      
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
      <span class="sr-only">Next</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h1>Our Three Pillars of Self Growth</h1><br>
  <div class="row">
  
    <div class="col-sm-4">
  	 <h1>
     <a href=categoryPage.do?id=1>
     <img src="style/images/financial-market-logo.png" class="img-responsive" style="width:100%" alt="Finance">
     <br>
     Finance 
     </a>
     </h1>
    </div>
    
    <div class="col-sm-4">
      <h1>
      <a href=categoryPage.do?id=2> 
      <img src="style/images/ideas-logo.png" class="img-responsive" style="width:100%" alt="Mental Health">
      <br>
      Mental Health
      </a>
      </h1>
    </div>
    
    <div class="col-sm-4">
     <h1>
     <a href=categoryPage.do?id=3>
     <img src="style/images/exercise.jpg" class="img-responsive" style="width:100%" alt="Fitness" >
     <br>
     Fitness
     </a>
     </h1>
    </div>
    
    
  </div>
</div><br>

	<footer class="container-fluid text-center">
		<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
		<i class="fa fa-github" style="font-size:48px"></i>
		</a>
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>