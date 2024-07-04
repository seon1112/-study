<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
	<th>a_nick</th>
	<th>a_no</th>
</tr>
<c:forEach var="c" items="${list }">
	<td>${c.a_nick }</td>
	<td>${c.a_no }</td>
</c:forEach>
</table>
</body>
</html>