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
<<<<<<< HEAD
	var message = '${msg}';
	var returnUrl = '${url}';
	alert(message);
	document.location.href= ${context}+returnUrl;
=======
alert("${msg}");
document.location.href= "${context}"+"${url}";
>>>>>>> c8a7e98a1ecd9e5db33a38df51d904fb79cae64e
</script>
</body>
</html>