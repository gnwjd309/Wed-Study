<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="user.User"%>
<%@ page import="user.UserDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link rel="stylesheet" href="../../css/bootstrap.css">
<link rel="stylesheet" href="../../css/custom.css">
<title>jsp 게시판 웹사이트</title>
</head>
<body>
 	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int pageNumber = 1; //기본 페이지 넘버

		// 페이지 넘버 값이 있을 때
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
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
    		<a class="navbar-brand" href="../main.jsp">JSP 게시판</a>
  		</div>
  		<div class="collapse navbar-collapse" id="#bs-example-navbar-collapse-1">
   			<ul class="nav navbar-nav">
    			<li class="active"><a href="admin.jsp">회원 관리</a></li>
    			<li><a href="post_manage.jsp">게시판 관리</a></li>
   			</ul>
   			<ul class="nav navbar-nav navbar-right">
    			<li class="dropdown">
     				<a href="#" class="dropdown-toggle"
      					data-toggle="dropdown" role="button" aria-haspopup="true"
      					aria-expanded="false">계정 관리<span class="caret"></span></a>
     				<ul class="dropdown-menu">
      					<li><a href="../user/logoutAction.jsp">로그아웃</a></li>
     				</ul>
    			</li>
   			</ul>
  		</div> 
 	</nav>
 	<!-- 회원 관리 -->
	<div class="container">
		<div class="row">
			<!-- 게시글의 홀수번째, 짝수번째 색을 다르게 함 -->
			<table class="table table-striped"
				style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr> <!-- <tr> : 테이블의 한 행 -->
						<th style="background-color: #eeeeee; text-align: center;">No</th>
						<th style="background-color: #eeeeee; text-align: center;">아이디</th>
						<th style="background-color: #eeeeee; text-align: center;">비밀번호</th>
						<th style="background-color: #eeeeee; text-align: center;">이름</th>
						<th style="background-color: #eeeeee; text-align: center;">성별</th>
						<th style="background-color: #eeeeee; text-align: center;">이메일</th>
					</tr>
				</thead>
				<tbody>
					<%
						UserDAO userDAO = new UserDAO();
						ArrayList<User> list = userDAO.getList(pageNumber);
						for (int i = 0; i < list.size()-1; i++) {
							
					%>
							<tr>
								<td><%=list.get(i).getUserNo()%></td>
								<td><%=list.get(i).getUserID()%></td>
								<td><%=list.get(i).getUserPassword()%></td>
								<td><%=list.get(i).getUserName()%></td>
								<td><%=list.get(i).getUserGender()%></td>
								<td><%=list.get(i).getUserEmail()%></td>
							</tr>
					<%
						}
					%>
				</tbody>
			</table>		
			<!-- 페이지 넘기기 -->
			<%
				if (pageNumber != 1) {
			%>
					<a href="admin.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
			<%
				}
				if (userDAO.nextPage(pageNumber)) {
			%>
					<a href="admin.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
			<%
				}
			%>	
		</div>
	</div>
	<!-- 애니매이션 담당 JQUERY -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<!-- 부트스트랩 JS  -->
	<script src="../../js/bootstrap.js"></script>
</body>
</html>