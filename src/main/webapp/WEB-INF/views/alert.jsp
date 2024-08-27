<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core" %>
<C:url var="context" value="/" />
<!-- 작성자 : 양한재 -->
<!-- 경고창 띄우고, 리다이렉트 시키는 용도입니다. -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	var message = '${msg}';
	var returnUrl = '${url}';
	alert(message);
	document.location.href= ${context}+returnUrl;
</script>
</body>
</html>