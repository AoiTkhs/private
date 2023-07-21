<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>登録画像一覧</title>
</head>
<body>
	<!-- ループして全部の画像を表示する -->
	<c:forEach var="e" items="${imageDataListString}" >
		 <%-- 画像表示 --%>
	    <img src="data:image/jpeg;base64,${e}" alt="Image">
	</c:forEach>
</body>
</html>