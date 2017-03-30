<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FSW</title>
<link rel="stylesheet" type="text/css" href="./css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="./css/jquery.notify.css" />
<link rel="stylesheet" type="text/css" href="./css/style.css" />
<script type="text/javascript" src="./js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="./js/jquery.min.js"></script>
<script type="text/javascript" src="./js/jquery-ui.js"></script>
<script type="text/javascript" src="./js/mjQuery.js"></script>
<script type="text/javascript" src="./js/jquery.notify.min.js"></script>
<script type="text/javascript">
	$.noConflict();
	jQuery(document).ready(function() {
		<c:if test="${success!=null}">
		alert("${success}");
		</c:if>
		<c:if test="${param.success!=null}">
		alert("${param.success}");
		</c:if>
		<c:if test="${error!=null}">
		alert("${error}");
		</c:if>
		<c:if test="${param.error!=null}">
		alert("${param.error}");
		</c:if>
	});
</script>
<style type="text/css">
td {
	font-family: "Lucida Console", "Lucida Sans Typewriter", monaco,
		"Bitstream Vera Sans Mono", monospace;
}

.hTitle {
	font-family: Papyrus, fantasy;
	left: 75px;
	position: absolute;
	float: left;
}

h3 a {
	position: absolute;
	float: top;
	top: 45%;
	right: 300px;
	text-decoration: none;
}
</style>
</head>
<body>
	<div id="header">
		<div align="center">
			<h3 align="center" id="hColor">FILE STORAGE WEB</h3>
		</div>
	</div>
	<h4 id="lLink">
		<a href="#" style="text-decoration: none;" id="lClick">LOGIN</a>
	</h4>
	<div id="rLink">
		<h4>
			<a href="#" style="text-decoration: none;" id="hClick">HOME</a>
		</h4>
	</div>
	<div id="home" align="center">
		<h2 align="center" class="hTitle">HomePage</h2>
	</div>
	<div id="login" align="center">
		<h2 align="center" class="hTitle">Login Page</h2>
		<br /> <br /> <br /> <br /> <br />
		<div align="center">
			<form action="login.do" method="post">
				<table>
					<tr>
						<td>Username &nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" name="userName" required="required" /></td>
					</tr>
					<tr>
						<td>Password&nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="password" name="password"
							required="required" /></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td></td>
						<td><input type="submit" value="logIN" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div id="rPage" align="center">
		<h2 align="center" class="hTitle">Registration Page</h2>
		<br /> <br /> <br /> <br /> <br />
		<div align="center">
			<form action="register.do" method="post">
				<table>
					<tr>
						<td>Username &nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" name="userName" required="required" /></td>
					</tr>
					<tr>
						<td>Password&nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="password" name="password"
							required="required" /></td>
					</tr>
					<tr>
						<td>EmailId&nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" name="emailId" required="required" /></td>
					</tr>
					<tr>
						<td>MobileNo&nbsp;:&nbsp;&nbsp;&nbsp;</td>
						<td><input type="text" name="mobile" required="required" /></td>
					</tr>
					<tr></tr>
					<tr></tr>
					<tr>
						<td></td>
						<td><input type="submit" value="regISTER" /></td>
						<td></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<h3 align="center">
		<a href="#" id="nUser">New User?</a>
	</h3>
	<div id="main"></div>
</body>
</html>