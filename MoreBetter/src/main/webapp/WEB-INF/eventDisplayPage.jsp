<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Look at YOU!</title>
<br>
<a href="/" button type="button" class="btn btn-outline-primary">Home</a>
<br>
<br>
</head>
<body>
	<br>User ID : ${user.id}
	<br>
	<br>page would display an event for user, but would be editable for a mentor (test readonly)(disabled)
(remove boarder from textfield   https://stackoverflow.com/questions/26033426/bootstrap-remove-form-field-border 

<input type="text" name="title"
			value="${category.name}" /><br>
			
	<form action="updateEvent.do" method="POST"> 

		Event Title<br> <input type="text" name="title" readonly="true"
			value="${event.title}" /><br><br>
			
		Speaker<br> <input type="text" name="mentorId" readonly="true"
			value="${event.mentorId}" /><br>		
			
		When<br> <input type="text" name="date" readonly="true"
			value="${event.eventDate}" /><br>			
		
		Price<br> <input type="text" name="price" readonly="true"
			value="${event.price}" /><br>
			
		Description<br> <input type="text" name="description" readonly="true"
			value="${event.description}" /><br>      // CSS to make field larger<textarea name="message" style="width:200px; height:600px;">bla bla bla</textarea>
			
	
	
	</form>

	<form action="eventEnroll" method="POST">
		<strong><em>${user.name}</em></strong> <input type="hidden"
			 value="${user.id}" /> <input type="submit" button type="button" value="sign up"/>
	</form>


</body>
</html>



</body>
</html>