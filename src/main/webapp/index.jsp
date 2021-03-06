<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:url value="/resources/styles/main.css" var="urlCssMain" />
<spring:url value="/register/check" var="urlAjax" />

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<link href="${urlCssMain}" rel="stylesheet" />
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('input[type="text"]').keyup(function(){
			$.ajax({
				url: "${urlAjax}",
				data: "username="+$(this).val(),
				success:function(result){
					$('.info').text(result.message);
					if (result.ok == false){
						$('input[type="submit"]').attr("disabled",true);
					} else {
						$('input[type="submit"]').attr("disabled",false);
					}
				}
			});
		});
	});
	
</script>
</head>
<body>
	<c:url value="/register" var="registerUrl" />

	<h1>Registration form</h1>
	
	<form id="registerForm" action="${registerUrl}" method="post">
		<fieldset>
			<label>Username</label> <input type="text" name="username" />
			<span class="info"></span>
		</fieldset>
		<fieldset>
			<label>Password</label> <input type="password" name="password" />
		</fieldset>
		<input type="submit" value="Register" />
	</form>
</body>
</html>
