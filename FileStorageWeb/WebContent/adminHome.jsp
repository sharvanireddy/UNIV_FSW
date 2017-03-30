<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="false"%>
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
	jQuery(document)
			.ready(
					function() {
						jQuery("#viewUsers").hide();
						jQuery("#home").show();
						jQuery("#filesViewer").hide();
						jQuery("#uploadFile").hide();
						jQuery("#uFiles").click(function(){
							jQuery("#viewUsers").hide();
							jQuery("#home").hide();
							jQuery("#filesViewer").hide();
							jQuery("#uploadFile").show();							
						});
						<c:if test="${error!=null}">
						alert("${error}");
						</c:if>
						<c:if test="${vu!=null}">
						jQuery("#viewUsers").show();
						jQuery("#home").hide();
						jQuery("#filesViewer").hide();
						jQuery("#uploadFile").hide();
						</c:if>
						<c:if test="${gf!=null}">
						jQuery("#viewUsers").hide();
						jQuery("#home").hide();
						jQuery("#filesViewer").show();
						jQuery("#uploadFile").hide();
						</c:if>
						<c:if test="${param.fsuccess!=null}">
						alert("${param.fsuccess}");
						jQuery("#viewUsers").hide();
						jQuery("#home").hide();
						jQuery("#filesViewer").hide();
						jQuery("#uploadFile").show();
						</c:if>
						<c:if test="${param.ferror!=null}">
						alert("${param.ferror}");
						jQuery("#viewUsers").hide();
						jQuery("#home").hide();
						jQuery("#filesViewer").hide();
						jQuery("#uploadFile").show();
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

#searchKey {
	font-family: Papyrus, fantasy;
	left: 75px;
	position: absolute;
	float: left;
}

#searchFile {
	position: absolute;
	float: top;
	top: 158px;
	left: 250px;
}

#display {
	position: absolute;
	float: top;
	top: 225px;
	left: 22.5%;
	right: 15px;
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
			<a href="./adminHome.jsp" style="text-decoration: none;" id="hClick">HOME</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="getUsers.do" style="text-decoration: none;" id="vUsers">View
				Users</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"
				style="text-decoration: none;" id="uFiles">Upload Files</a>&nbsp;&nbsp;&nbsp;&nbsp;<a
				href="getFiles.do" style="text-decoration: none;" id="viewFiles">View
				Files</a>
		</h4>
	</div>
	<div id="home" align="center">
		<h2 align="center" class="hTitle">Admin HomePage</h2>
	</div>
	<div id="display" align="center"></div>
	<div align="center" id="viewUsers">
		<h3 align="center" class="hTitle">VIEW&nbsp;&nbsp; USERS</h3>
		<br /> <br /> <br /> <br /> <br />
		<div align="center">
			<table border="1"
				style="position: absolute; float: top; top: 25%; right: 30%;">
				<c:if test="${users!=null }">
					<tr style="background-color: #4E4954;">
						<td>userName&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>emailID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>MobileNo&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</c:if>
				<c:forEach items="${users }" var="user">
					<tr>
						<td>${user.userName }</td>
						<td>${user.emailId }</td>
						<td>${user.mobile }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div align="center" id="uploadFile">
		<h3 align="center" class="hTitle">Upload&nbsp;&nbsp; FILES</h3>
		<br /> <br /> <br /> <br /> <br />
		<div align="center">
			<form action="upload.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>Upload A File :&nbsp;</td>
						<td><input type="file" multiple="multiple" name="files"
							required="required"></td>
						<td><input type="submit" value="upLOAD" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div align="center" id="filesViewer">
		<h3 align="center" class="hTitle">VIEW&nbsp;&nbsp; FILES</h3>
		<br /> <br /> <br /> <br /> <br />
		<div align="center">
			<table border="1"
				style="position: absolute; float: top; top: 25%; right: 30%;">
				<c:if test="${files!=null }">
					<tr style="background-color: #4E4954;">
						<td>File
							Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>Creation Time&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</c:if>
				<c:forEach items="${files }" var="file">
					<tr>
						<td>${file.fileName }</td>
						<td>${file.creationTime }</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="main"></div>
</body>
</html>