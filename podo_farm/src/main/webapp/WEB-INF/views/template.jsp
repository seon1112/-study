<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
   #header, #footer{
      width: 100%;
      height: 20%;
      background-color: pink;
   }
   
   #content{
      width:100%;
      height: 60%;
   }
</style>
<title>Insert title here</title>
</head>
<body>
	<div id="header">
      <jsp:include page="header.jsp"/>
   </div>

   <div id="content">
      <jsp:include page="myProPage.jsp"/>
   </div>
   

</body>
</html>