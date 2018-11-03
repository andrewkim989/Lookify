<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Top Ten Songs</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<style>
		#wrapper {
			background-color: lightgrey;
			padding: 25px;
		}
		#top {
			font-size: 22px;
			margin-left: 250px;
		}
		h1 {
			margin-left: 100px;
			display: inline-block;
		}
		#top a {
			margin-left: 50px;
			display: inline-block;
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
			color: white;
			padding: 5px;
			padding-left: 10px;
			padding-right: 200px;
			background-color: blue;
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
			<h1>Top Ten Songs in the List</h1>
			<a href = "/dashboard">Dashboard</a>
		</div>
		<table>
		    <thead>
		        <tr>
		            <th>Rating</th>
		            <th>Title</th>
		            <th>Artist</th>
		        </tr>
		    </thead>
		    <tbody>
		        <c:forEach items = "${lookify}" var = "l">
		        <tr>
		        	<td><c:out value = "${l.rating}"/></td>
		            <td><a href = "/songs/${l.id}"><c:out value = "${l.title}"/></a></td>
		            <td><c:out value = "${l.artist}"/></td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>