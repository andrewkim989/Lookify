<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Search Songs</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			padding: 25px;
			height: 650px;
		}
		#top {
			font-size: 22px;
			margin-left: 180px;
		}
		#top a {
			margin-left: 70px;
			display: inline-block;
		}
		#search {
			display: inline-block;
			margin-left: 200px;
		}
		table {
			border: 1px solid black;
			border-collapse: collapse;
			margin: 20px;
			margin-left: 200px; 
			margin-bottom: 30px;
		}
		th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 200px;
			background-color: turquoise;
			font-size: 18px;
		}
		tr td {
			border: 1px solid black;
			border-collapse: collapse;
			padding: 10px;
			background-color: rgb(237, 241, 248);
			font-size: 18px;
		}
	</style>
</head>

<body>
	<div id = "wrapper">
		<div id = "top">
			<a href = "/dashboard">Dashboard</a>
			<div id = "search">
				<form action = "/search/artist" method = "post">
					<input type = "text" name = "artist">
					<input type = "submit" value = "New Search">
				</form>
			</div>
		</div>
		<table>
		    <thead>
		        <tr>
		            <th>Title</th>
		            <th>Rating</th>
		            <th>Actions</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${songs}" var = "song">
		        <tr>
		            <td><a href = "/songs/${song.id}"><c:out value = "${song.title}"/></a></td>
		            <td><c:out value = "${song.rating}"/></td>
		            <td><form action = "/songs/${song.id}/delete" method ="post">
					    <input type = "hidden" name = "_method" value = "delete">
					    <input type = "submit" value = "Delete">
					</form></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
	</body>
</html>
