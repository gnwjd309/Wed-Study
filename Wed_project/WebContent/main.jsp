<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<!-- width=device-width : 반응형 웹 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/custom.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null)
			userID = (String) session.getAttribute("userID");
	%>
	<!-- 네비게이션  -->
	<nav class="navbar navbar-default">
 		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
    			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
    			aria-expaned="false">
    			<!-- 웹의 크기가 줄어들면 우측 상단의 메뉴 아이콘 생성 -->
    			<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
     			<span class="icon-bar"></span>
    		</button>
    		<a class="navbar-brand" href="main.jsp">JSP 게시판</a>
  		</div>
  		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   			<ul class="nav navbar-nav">
    			<li class="active"><a href="main.jsp">메인</a></li>
    			<li><a href="bbs.jsp">게시판</a></li>
   			</ul>
   			<%
   				if(userID == null){
   		   	%>
   		  		 	<ul class="nav navbar-nav navbar-right">
    					<li class="dropdown">
     						<a href="#" class="dropdown-toggle"
      							data-toggle="dropdown" role="button" aria-haspopup="true"
      							aria-expanded="false">접속하기<span class="caret"></span></a>
     						<ul class="dropdown-menu">
      							<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
      							<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
     						</ul>
    					</li>
   					</ul>
   		   	<%
   				}
   				
   				else {
   			%>
   					<ul class="nav navbar-nav navbar-right">
    					<li class="dropdown">
     						<a href="#" class="dropdown-toggle"
      							data-toggle="dropdown" role="button" aria-haspopup="true"
      							aria-expanded="false">회원 관리<span class="caret"></span></a>
     						<ul class="dropdown-menu">
      							<li><a href="logoutAction.jsp">로그아웃</a></li>
     						</ul>
    					</li>
   					</ul>
   			<%
   				}
   			%>
  		</div> 
 	</nav>
 	<div class="container">
 		<div class="jumbotron">
 			<div class="container">
 				<h1>웹 사이트 소개</h1>
 				<p> 안녕하세요. 지금 시간은 오후 7시 21분 입니다. 점심으로 빵을 먹었더니, 배가 고파서 아주 죽겠습니다. 얼른 이거 마무리 하고 집에 가서 밥 먹고 싶습니다. 살려주세요....
 				<a class="btn btn-primary btn-pull" href="https://hoojeong.dev/" role="button">자세히 알아보기</a></p>
 			</div>
 		</div>
 	</div>
 	<div class="container">
 		<div id="myCarousel" class="carousel slide" data-ride="carousel">
 			<ol class="carousel-indicators">
 				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
 				<li data-target="#myCarousel" data-slide-to="1"></li>
 				<li data-target="#myCarousel" data-slide-to="2"></li>
 			</ol>
 			<div class="carousel-inner">
 				<div class="item active">
 					<img src="images/1.jpg">
 				</div>
 				<div class="item">
 					<img src="images/2.jpg">
 				</div>
 				<div class="item">
 					<img src="images/3.jpg">
 				</div>
 			</div>
 			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
 				<span class="glyphicon glyphicon-chevron-left"></span>
 			</a>
 			<a class="right carousel-control" href="#myCarousel" data-slide="next">
 				<span class="glyphicon glyphicon-chevron-right"></span>
 			</a>
 		</div>
 	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
	<!-- 부트스트랩 JS  -->
	<script src="js/bootstrap.js"></script>
</body>
</html>