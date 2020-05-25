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
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="style/images/self-improvement.jpg" alt="Image">
        <div class="carousel-caption">
          <h2>More Resources</h2>
          <p></p>
        </div>      
      </div>

      <div class="item">
        <img src="style/images/personal-growth.jpg" alt="Image">
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
      <span class="sr-only">Next</span>
    </a>
</div>
  
<div class="container text-center">    
  <h3>Our Three Pillars of Self Growth</h3><br>
  <div class="row">
  
    <div class="col-sm-4">
  	 
     <a href=categoryPage.do?id=1>
     <img src="style/images/financelogo.png" class="img-responsive" style="width:100%" alt="Finance">
     </a>
     <h1>Finance</h1>
    </div>
    
    
    <div class="col-sm-4">
     <a href=categoryPage.do?id=2>
     <img src="style/images/mentalhealthlogo.png" class="img-responsive" style="width:100%" alt="Mental Health">
     </a>
     <h1>Mental Health</h1>    
    </div>
    
    <div class="col-sm-4">
      <a href=categoryPage.do?id=3> 
      <img src="style/images/fitnesslogo.jpg" class="img-responsive" style="width:100%" alt="Fitness">
      </a>
      <h1>Fitness</h1>    
    </div>
    
  </div>
</div><br>

<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</body>
</html>