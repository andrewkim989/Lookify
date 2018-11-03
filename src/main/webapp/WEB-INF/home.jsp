<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Lookify Home</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	
	<style>
		#wrapper {
			background-color: lightgrey;
			padding: 25px;
		}
		#top {
			font-size: 22px;
			margin-left: 120px;
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
			margin-left: 150px; 
			margin-bottom: 30px;
		}
		th {
			text-align: left;
			border: 1px solid black;
			border-collapse: collapse;
			padding: 5px;
			padding-left: 10px;
			padding-right: 170px;
			background-color: lightgreen;
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
			<a href = "/songs/new">Add New</a>
			<a href = "/search/topTen">Top Songs</a>
			<div id = "search">
				<form action = "/search/artist" method = "post">
					<input type = "text" name = "artist">
					<input type = "submit" value = "Search Artist">
				</form>
			</div>
		</div>
		<table>
		    <thead>
		        <tr>
		            <th>Title</th>
		            <th>Artist</th>
		            <th>Rating</th>
		            <th>Action</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${lookify}" var = "l">
		        <tr>
		            <td><a href = "/songs/${l.id}"><c:out value = "${l.title}"/></a></td>
		            <td><c:out value = "${l.artist}"/></td>
		            <td><c:out value = "${l.rating}"/></td>
		            <td><form action = "/songs/${l.id}/delete" method ="post">
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