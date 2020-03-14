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
	String lid = request.getParameter("lid");
	String lpw = request.getParameter("lpw");
	System.out.println("(log) lid >>> " + lid);
	System.out.println("(log) lpw >>> " + lpw);
	
	// instance
	LsjMemberDao ldao = new LsjMemberDaoImpl();
	LsjMemberVO lvo = new LsjMemberVO();
	
	// setting (data null이면 안됨)
	lvo.setLid(lid);
	lvo.setLpw(lpw);
	
	// ArrayList에 로그인함수 invoke
	ArrayList<LsjMemberVO> aList = ldao.loginLsjMem(lvo);
	System.out.println(" aList >>> " + aList.size());
	
	if(aList.size()==1){
%>
	<script>
		alert("로그인 성공");
		location.href="/mvc1Pattern/board/selectAllLsjBoard.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("로그인 실패");
		location.href="../index.html";
	</script>
<%
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>loginLsjMem</title>
	</head>
	<body>

	</body>
</html>