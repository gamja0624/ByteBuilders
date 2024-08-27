<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="C" uri="http://java.sun.com/jsp/jstl/core"%>
<C:url var="resPath" value="/resources/" />
<C:url var="staticUrl" value="/resources/" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${resPath}css/bootstrap.min.css">
<link rel="stylesheet" href="${staticUrl}css/footer.css">
<style type="text/css">
  .about-site-content {
	width: 1100px;
    height: 760px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    margin: 50px auto;
  }
  
  h1 {
    margin: 50px 0 20px 0;
  	color: #4A4A4A;
  }
  
  h2 {
  	color: #333;
    margin: 40px 0 20px 0;
  }
  
  p {
  	line-height: 1.6;
  	color: #555;
  }
  
  .img-cover {
    background-color:#050505;
    width: 100%;
    height: 400px;
    
  }
  .landingimg {
    width: 100%;
    margin: 0 auto;
    height: 400px;
    
  }
</style>
</head>
<body>
  <%@ include file="../user/navbar/navbar.jsp"%>
  <div class="wrap">
    <div class="img-cover">
      <img class="landingimg" alt="" src="${staticUrl}img/plouzane.jpg">
    </div>
    <div class="about-site-content">
      <h1>내 마음의 연구소</h1>
      <h2>사이트 소개</h2>
      <p>“내 마음의 연구소(The Lab of My Mind)”는 이용자들이 자신의 일상 기록과 감정을 자유롭게
        표현할 수 있는 공간을 제공하여, 감정 관리와 자아 성찰을 도모하는 것을 목표로 합니다.</p>
      <div>
        <h4>구조화된 기록</h4> 
        <p>일기를 작성하는 데 대한 부담을 덜어주기 위해, 간편한 형식으로 일기를 기록할 수 있습니다.</p> <br>
        <h4>주제  추천</h4>  
        <p> 주제를 추천하여 생각을 자극하고, 일기 작성을 돕습니다.</p> <br>
        <h4>감정 관리 도구</h4> 
        <p> 감정을 쉽게 기록하고 관리할 수 있는 도구를 제공합니다. </p>
      </div>
      <div>
        <h2>이용 안내</h2>
        <p>회원가입 후, 언제든지 자유롭게 일기를 작성하고 자신의 감정을 기록할 수 있습니다.<br>
           당신의 생각과 감정을 함께 나누고, 보다 나은 자기 이해를 도모하세요.</p>
      </div>
    </div>
  </div>
  <!-- 작성자 : 최은지  -->
  <!-- footer  -->
  <%@ include file="../user/footer/footer.jsp"%>
</body>
</html>