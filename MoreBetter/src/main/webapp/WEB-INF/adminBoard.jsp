<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Admin Board</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">
  
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
</head>
<body>

<div class="container-fluid">
  <h2>ADMIN BOARD</h2>
         
         
  <table class="table table-hover">
    <thead>
      <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Current Status</th>
        <th>Enable</th>
        <th>Disable</th>
      </tr>
    </thead>
    <tbody>
         <c:forEach var="user" items="${users}">
    
   
      <tr>
   
        <td>${user.id}</td>
        <td>${user.username}</td>
        
        <td>
        
        <c:choose>
        <c:when test="${user.enabled == true}">
       <label for="status"><b>enabled</b></label>
          </c:when>
         
          <c:otherwise>
          <label for="status"><b>disabled</b></label>
          </c:otherwise>
          
          </c:choose>	
     
        </td>
      
        <td>
        <form action="activateUser.do" method="POST">
            <input type="hidden" name="uId" value="${user.id}"/>
         <button type="submit">Enable</button>
         
        </form>
        </td>
        
        <td>
        <form action="deactivateUser.do" method="POST">
         <input type="hidden" name="uId" value="${user.id}"/>
        
         <button type="submit">Disable</button>
        </form>
        </td>
        
      
      </tr>
      
      
      
  </c:forEach>
    </tbody>
  </table>
  
</div>


	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	<footer class="container-fluid text-center">
		<a href="https://github.com/rwasek/MidTermProject" style="color:black" target="_blank"/>
		<i class="fa fa-github" style="font-size:48px"></i>
		</a>
	</footer>
</body>
</html>
