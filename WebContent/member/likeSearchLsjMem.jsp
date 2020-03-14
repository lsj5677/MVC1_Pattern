<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- page import -->    
<%@ page import = "com.mvc1.member.dao.LsjMemberDao" %>
<%@ page import = "com.mvc1.member.dao.LsjMemberDaoImpl" %>
<%@ page import = "com.mvc1.member.vo.LsjMemberVO" %>
<%@ page import="java.util.ArrayList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>likeSearchLsjMem</title>
	</head>
	<body>
		<%
			//encoding
			request.setCharacterEncoding("UTF-8");
			
			// name 값 받아오기
			String lname = request.getParameter("lname");
			System.out.println("(log) lname >>> " + lname);
			
			// Dao 변수 선언 후 Impl 인스턴스
			LsjMemberDao ldao = new LsjMemberDaoImpl();
			// VO 변수 선언 후 인스턴스
			LsjMemberVO lvo = new LsjMemberVO();
			
			// set으로 초기화 후 받은 데이터 넣기
			lvo.setLname(lname);
			System.out.println("(log) lvo >>> " + lvo);
			
			ArrayList<LsjMemberVO> aList = ldao.likeSearchLsjMem(lvo);
			if(aList.size()==0){
		%>
		<script>
			alert("조회 실패");
			location.href="/mvc1Pattern/signUp.html";
		</script>
		<%
			}else{
		%>
		<table class="table" border="1">
			<tr>
				<td colspan="13" class="table_title">회원정보</td>
			</tr>
			<tr>
				<td class="info_title">회원번호</td>
				<td class="info_title">아이디</td>
				<td class="info_title">비밀번호</td>
				<td class="info_title">이름</td>
				<td class="info_title">성별</td>
				<td class="info_title">생년월일</td>
				<td class="info_title">이메일</td>
				<td class="info_title">핸드폰</td>
				<td class="info_title">우편번호</td>
				<td class="info_title">주소</td>
				<td class="info_title">등록일</td>
				<td class="info_title">수정일</td>
			</tr>
			<%
				// for문으로 데이터뽑기
				for(int i=0; i<aList.size(); i++){
					
					// ValueObject instance 후 aList에서 index하나씩 뽑기
					LsjMemberVO lvo_ = aList.get(i);
			
			%>
			<!-- java get이용해서 내용 담아주기 -->
			<tr>
				<td class="info_con"><%=lvo_.getLmem() %></td>
				<td class="info_con"><%=lvo_.getLid() %></td>
				<td class="info_con"><%=lvo_.getLpw() %></td>
				<td class="info_con"><%=lvo_.getLname() %></td>
				<td class="info_con"><%=lvo_.getLgender() %></td>
				<td class="info_con"><%=lvo_.getLbirth() %></td>
				<td class="info_con"><%=lvo_.getLemail() %></td>
				<td class="info_con"><%=lvo_.getLhp() %></td>
				<td class="info_con"><%=lvo_.getLpostno() %></td>
				<td class="info_con"><%=lvo_.getLaddr() %></td>
				<td class="info_con"><%=lvo_.getLinsertdate() %></td>
				<td class="info_con"><%=lvo_.getLupdatedate() %></td>
			</tr>
			<%
					}// end of for
				}// end of if
			%>
		</table>	
	</body>
</html>