<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- page import -->    
<%@ page import = "com.mvc1.member.dao.LsjMemberDao" %>
<%@ page import = "com.mvc1.member.dao.LsjMemberDaoImpl" %>
<%@ page import = "com.mvc1.member.vo.LsjMemberVO" %>
<%@ page import="java.util.ArrayList" %>

<%
	//encoding
	request.setCharacterEncoding("UTF-8");
%>
<%
	String lname = request.getParameter("lname");
	
	LsjMemberDao ldao = new LsjMemberDaoImpl();
	LsjMemberVO lvo = new LsjMemberVO();
	
	lvo.setLname(lname);
	
	boolean bFlag = ldao.deleteLsjMem(lvo);
	
	if(bFlag){
%>
	<script>
		alert("삭제 되었습니다.");
		location.href="/mvc1Pattern/member/selectAllLsjMem.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("삭제 실패!");
		location.href="/mvc1pattern/member/index.html";
	</script>
<%
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>deleteLsjMem</title>
	</head>
	<body>

	</body>
</html>