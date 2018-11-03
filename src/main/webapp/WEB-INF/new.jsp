<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Add Song</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			padding-left: 35px;
			padding-top: 30px;
			height: 640px;
			background-color: lightgrey;
		}
		h1 {
			display: inline-block;
		}
		a {
			display: inline-block;
			font-size: 25px;
			margin-left: 500px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Add a New Song</h1>
		<a href = "/dashboard">Dashboard</a>
		<form:form action = "/songs/new/process" method = "post" modelAttribute = "lookify">
			<p>
				<form:errors path = "title"/>
				<br>
				<form:label path = "title">Title</form:label>
				<form:input path = "title"/>
			</p>
			<p>
				<form:errors path = "artist"/>
				<br>
				<form:label path = "artist">Artist</form:label>
				<form:input path = "artist"/>
			</p>
			<p>
				<form:errors path = "rating"/>
				<br>
				<form:label path = "rating">Rating</form:label>
				<form:input type = "number"  path = "rating"/>
			</p>    
			<input type = "submit" value = "Add Song"/>
		</form:form>
	</div>
</body>
</html>