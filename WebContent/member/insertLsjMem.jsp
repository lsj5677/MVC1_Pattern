<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- page import -->    
<%@ page import = "com.mvc1.member.dao.LsjMemberDao" %>
<%@ page import = "com.mvc1.member.dao.LsjMemberDaoImpl" %>
<%@ page import = "com.mvc1.member.vo.LsjMemberVO" %>

<%
	// encoding
	request.setCharacterEncoding("UTF-8");	
%>
<%
	// validation 후 데이터 request.getParameter로 데이터 받아오기
	// String lmem = chaebun
	String lid = request.getParameter("lid");
	String lpw = request.getParameter("lpw");
	String lname = request.getParameter("lname");
	String lgender = request.getParameter("lgender");
	String lbirth = request.getParameter("lbirth");
	String lemail = request.getParameter("lemail");
	String lhp = request.getParameter("lhp");
	String lpostno = request.getParameter("lpostno");
	String laddr = request.getParameter("laddr");
	// String ldeleteyn = 'Y'
	// String linsertdate = sysdate
	// String lupdatedate = sysdate
	
	// 부모 인터페이스 Dao 변수 선언 후 자식 클래스 Impl 인스턴스
	LsjMemberDao ldao = new LsjMemberDaoImpl();
	// VO 인스턴스
	LsjMemberVO lvo = new LsjMemberVO();
	
	// set으로 초기화 후에 데이터 담기
	lvo.setLid(lid);
	lvo.setLpw(lpw);
	lvo.setLname(lname);
	lvo.setLgender(lgender);
	lvo.setLbirth(lbirth);
	lvo.setLemail(lemail);
	lvo.setLhp(lhp);
	lvo.setLpostno(lpostno);
	lvo.setLaddr(laddr);
	
	// boolean 변수 bFlag에 insertLsjMem 호출 후 lvo 데이터 담아주기
	boolean bFlag = ldao.insertLsjMem(lvo);
	
	if(bFlag){
%>
	<script>
		alert("입력되었습니다.");
		location.href = "../index.html";
	</script>
<%
	}else{
%>
	<script>
		alert("실패!");
		location.href = "/mvc1Pattern/member/signUp.html";
	</script>
<%
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>InsertLsjMem</title>
	</head>
	<body>
	
	</body>
</html>