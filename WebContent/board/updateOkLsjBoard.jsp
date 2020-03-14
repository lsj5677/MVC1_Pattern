<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.mvc1.board.dao.LsjBoardDao" %>
<%@ page import="com.mvc1.board.dao.LsjBoardDaoImpl" %>
<%@ page import="com.mvc1.board.vo.LsjBoardVO" %>
<%@ page import="java.util.ArrayList" %> 

<%
	request.setCharacterEncoding("UTF-8");

	// 데이터 받아오기
	String chkInLno = request.getParameter("chkInLno");
	String lno = request.getParameter("lno");
	String lsubject = request.getParameter("lsubject");
	String lname = request.getParameter("lname");
	String lpw = request.getParameter("lpw");
	String lmemo = request.getParameter("lmemo");
	
	// data check
	System.out.println ("(log) updateOkLsjBoard.jsp data >>> "
							+ chkInLno + " : "
							+lno + " : "
						    +lsubject + " : "
						    +lname + " : "
						    +lpw + " : "
						    +lmemo);
	
	LsjBoardDao ldao = new LsjBoardDaoImpl();
	LsjBoardVO lbvo = new LsjBoardVO();
	
	
	lbvo.setLno(lno);
	lbvo.setLsubject(lsubject);
	lbvo.setLmemo(lmemo);
	
	int lCnt = ldao.updateLsjBoard(lbvo);
	
	if(lCnt==1){
%>
	<script>
		alert("글수정 완료");
		location.href="/mvc1Pattern/board/selectAllLsjBoard.jsp";
	</script>
<%
	}else{
%>
	<script>
		alert("글수정 실패");
	</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>updateOkLsjBoard</title>
	</head>
	<body>
	
	</body>
</html>