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
  <jsp:include page="navbar.jsp"/>
</head>
<body>
<div class="container bg-overlay">
    <div class="row text-center">
    <br>
        <h1><strong>Welcome ${user.firstName} ${user.lastName}.</strong></h1>
        <br>
        <img src="${user.picture}" class="img-responsive, img-circle" alt="user picture"width="340" height="400">
        <br><br><br>
          <a href="home.do">
        <button type="button" class="btn btn-black btn-lg">Lets Be Better Together</button>
        </a>
      <!--   <br><br>
            <h1>Lets Be Better Together</h1> -->
    </div>
     <br><br>
</div>
 </body>
