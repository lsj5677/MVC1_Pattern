<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- page import -->    
<%@ page import = "com.mvc1.member.dao.LsjMemberDao" %>
<%@ page import = "com.mvc1.member.dao.LsjMemberDaoImpl" %>
<%@ page import = "com.mvc1.member.vo.LsjMemberVO" %>
<%@ page import="java.util.ArrayList" %>

<%
	// encoding
	request.setCharacterEncoding("UTF-8");

	String lname = request.getParameter("lname");
	String lpw = request.getParameter("lpw");
	String lhp = request.getParameter("lhp");
	
	LsjMemberDao ldao = new LsjMemberDaoImpl();
	LsjMemberVO lvo = new LsjMemberVO();
	
	lvo.setLname(lname);
	lvo.setLpw(lpw);
	lvo.setLhp(lhp);
	
	boolean bFlag = ldao.updateLsjMem(lvo);
	ArrayList<LsjMemberVO> aList = ldao.searchLsjMem(lvo);
	
	if(bFlag){
%>
	<script>
		alert("업데이트 완료");
		location.href="searchLsjMem.jsp?lname="+"<%=lname%>";
	</script>
<%
	}else{
%>
	<script>
		alert("업데이트 실패");
		location.href="/mvc1Pattern/member/signUp.html"
	</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>updateLsjMem</title>
	</head>
	<body>

	</body>
</html>