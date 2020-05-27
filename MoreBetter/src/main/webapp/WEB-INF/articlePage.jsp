<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Article</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="style/style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <jsp:include page="navbar.jsp"/>
<style>
body {
  font-family: Arial, Helvetica, sans-serif;
  background-color: black;
}
* {
  box-sizing: border-box;
}
/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
}
/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
}
input[type=text]:focus, input[type=password]:focus {
  background-color: #ddd;
  outline: none;
}
/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.registerbtn:hover {
  opacity: 1;
}
/* Add a blue text color to links */
a {
  color: dodgerblue;
}
/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}
</style>
</head>
<body>
  <div class="container">
<form action="addArticle.do" method="POST">
    <h1>Add Article</h1>
    <p>Please fill in this form to add a new article.</p>
    <hr>
  <%-- <input type="hidden" name="id" value="${article.id}"/> --%>
   
    <label for="title"><b>Article Title</b></label>
    
    <input type="text" placeholder="Enter title" name="title" required>
    
    <label for="contents"><b>Brief Description of the Article</b></label>
    <input type="text" placeholder="Enter Article description here" name="contents" required>
    
    <label for="created"><b>Article Publish Date</b></label>
    <input type="datetime-local" placeholder="Enter Article Publication Date here" name="created" required>
    <br><br>
    <label for="reference"><b>Article Link/URL</b></label>
    <input type="text" placeholder="Enter Article Link/URL Here" name="reference" required>
    <br>
    <label for="category"><b>Choose Category</b></label>
          <select name="categoryId">
		        <option value="1">Finance</option>
		        <option value="2">Mental Health</option>
		        <option value="3">Fitness</option>
		  	  </select>
  
  <label for="author"><b></b></label>
    <input type="hidden" name="${sessionScope.loggedInUser.id}" required>
    
  
    <button type="submit" class="btn btn-success">Submit Article</button>
  
	</form>
 </div>
</body>
</html>
