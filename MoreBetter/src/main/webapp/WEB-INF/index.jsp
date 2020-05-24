<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>More Better</title>
<link rel="stylesheet" href="style/styles.css">
</head>
<body>

<form action="getCategory.do" method="GET">
    <input type="hidden" name="id" value="1"/><br>
     <input type="submit" value="Finance"/>
</form>

<form action="articlePage.do" method="GET">
    <input type="hidden" name="id" value="1"/><br>
     <input type="submit" value="Mental Health"/>
</form>

<form action="articlePage.do" method="GET">
    <input type="hidden" name="id" value="1"/><br>
     <input type="submit" value="Fitness"/>
</form>

</body>
</html>