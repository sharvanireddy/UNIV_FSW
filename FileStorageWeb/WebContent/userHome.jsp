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
<script type="text/javascript" src="./js/jquery.notify.min.js"></script>
<script type="text/javascript">
	$.noConflict();
	jQuery(document).ready(function() {
		jQuery("#home").show();
		jQuery("#vFiles").hide();
		jQuery("#uProfile").hide();
		jQuery("#vFile").click(function(){
		jQuery("#home").hide();
		jQuery("#vFiles").show();
		jQuery("#uProfile").hide();			
		});
		jQuery("#hClick").click(function(){
		jQuery("#home").show();
		jQuery("#vFiles").hide();
		jQuery("#uProfile").hide();			
		});
		jQuery("#profile").click(function(){
		jQuery("#home").hide();
		jQuery("#vFiles").hide();
		jQuery("#uProfile").show();			
		});
		<c:if test="${success!=null}">
		alert("${success}");
		</c:if>
		<c:if test="${error!=null}">
		alert("${error}");
		</c:if>
		jQuery('#fdName').on('input',function(){
			jQuery.ajax({url: "getFileDetails.do?fileName="+jQuery("#fdName").val(), success: function(response){
		        $("#fileDetailsView").html(response);
		    }});
		});
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
	<h4 id="loLink">
		<a href="./logout.jsp" style="text-decoration: none;" id="lClick">LOGOUT</a>
	</h4>
	<div id="rLink">
		<h4>
			<a href="#" style="text-decoration: none;" id="hClick">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="#" style="text-decoration: none;" id="vFile">view files</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="#" style="text-decoration: none;" id="profile">update
				profile</a>
		</h4>
	</div>
	<div id="home" align="center">
		<h2 align="center" class="hTitle">Welcome ${authorizedUserName }</h2>
	</div>
	<div id="vFiles" align="center">
		<div align="center">
			<h3 align="center" class="hTitle">View Files</h3>
			<br /> <br /> <br /> <br /> <br />
			<div align="center">
				<p align="center">
					Enter Your File Name : <input type="text" name="fileName"
						id="fdName" placeholder="Enter Your File Name" />
				</p>
				<div id="fileDetailsView"></div>
			</div>
		</div>
	</div>
	<div id="uProfile" align="center">
		<div align="center">
			<h3 align="center" class="hTitle">Update Profile</h3>
			<br /> <br /> <br /> <br /> <br />
			<div align="center">
				<form action="updateUser.do" method="post">
					<table>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Username
								&nbsp;:&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" name="userName" readonly="readonly"
								value="${authorizedUserName}" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;Enter New Password&nbsp;:&nbsp;&nbsp;&nbsp;</td>
							<td><input type="password" name="password"
								required="required" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;EmailId&nbsp;:&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" name="emailId" required="required" /></td>
						</tr>
						<tr>
							<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;MobileNo&nbsp;:&nbsp;&nbsp;&nbsp;</td>
							<td><input type="text" name="mobile" required="required" /></td>
						</tr>
						<tr></tr>
						<tr></tr>
						<tr>
							<td></td>
							<td><input type="submit" value="update PROFILE" /></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<div id="main"></div>
</body>
</html>