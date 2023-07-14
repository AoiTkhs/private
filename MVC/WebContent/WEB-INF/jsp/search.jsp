<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- JSTLを使えるようにする -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>検索画面だよ</title>
<link rel="stylesheet" href="/multiMVC/css/style.css">
<script type="text/javascript" src="/multiMVC/js/script.js"></script>
</head>
<body>

	<form method="POST" action="/errorHandling/ControllerServlet">
	<input type="hidden" name="pageId" value="LAONE">
		<table>
			<tr>
				<th>NAME:</th>
				<td><input type="text" name="name" value="${param.name}" id="name" placeholder="NAMEを入力してください" ></td>
			</tr>
			<tr>
				<th>AGE:</th>
				<td><input type="text" name="age"  id="age" value="${param.age}" placeholder="AGEを入力してください"></td>
			</tr>
			<tr>
				<td colspan="2" >
					<input type="submit" value="検索" name="submit" id="searchButton" >
				</td>
			</tr>
		</table>
	</form>

	<c:forEach var="e" items="${list}" >
		ID:${e.id}　NAME:${e.name}　AGE:${e.age}
	<hr>
</c:forEach>

</body>
</html>