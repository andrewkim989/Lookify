<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>${song.title}</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			padding-top: 40px;
			padding-left: 100px;
			padding-bottom: 30px;
			height: 640px;
		}
		h2 {
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
		<h2>Song Information</h2>
		<a href = "/dashboard">Dashboard</a>
		<br><br>
		<h5>Title: <c:out value = "${song.title}"/></h5>
		<br><br>
		<h5>Artist: <c:out value = "${song.artist}"/></h5>
		<br><br>
		<h5>Rating: <c:out value = "${song.rating}"/></h5>
		<br><br>
		<form action = "/songs/${song.id}/delete" method ="post">
			<input type = "hidden" name = "_method" value = "delete">
			<input type = "submit" value = "Delete">
		</form>
	</div>
</body>
</html>