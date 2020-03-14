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
		<title>selectAllLsjMem</title>
	</head>
	<body>
		<%
			System.out.println("(log) selectAllLsjMem jsp >>> ");
			
			// 부모 인터페이스 Dao 변수 선언 후 자식 클래스 Impl 인스턴스
			LsjMemberDao ldao = new LsjMemberDaoImpl();
			
			// 변수 aList에 selectLsjMem() 담기
			ArrayList<LsjMemberVO> aList = ldao.selectLsjMem();
			System.out.println("(log) selectAllLsjMem aList >>> " + aList);
			System.out.println("(log) selectAllLsjMem aList.size() >>> " + aList.size());
			
			// aList.size()가 0이면 no data, 아니면 전체 출력
			if(aList.size()==0 ){
		%>	 
		<!-- noData -->
		<div id="noData">
			<!-- h2 -->
			<h2>NO DATA</h2>
			<!-- //h2 -->
		</div>
		<!-- //noData -->
		<%
			}else{
		%>
		<!-- selectAllLsjMem -->
		<table class="table" border="1">
			
			<tr>
				<th colspan="13">회원정보</th>
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
			</tr>
			<%
				// for문으로 데이터 뽑기
				for(int i=0; i<aList.size(); i++){
					// VO 인스턴스 후 index 하나씩 뽑기
					LsjMemberVO lvo = aList.get(i);
			%>
			<tr>
				<td class="info_con"><%=lvo.getLmem() %></td>
				<td class="info_con"><%=lvo.getLid() %></td>
				<td class="info_con"><%=lvo.getLpw() %></td>
				<td class="info_con"><%=lvo.getLname() %></td>
				<td class="info_con"><%=lvo.getLgender() %></td>
				<td class="info_con"><%=lvo.getLbirth() %></td>
				<td class="info_con"><%=lvo.getLemail() %></td>
				<td class="info_con"><%=lvo.getLhp() %></td>
				<td class="info_con"><%=lvo.getLpostno() %></td>
				<td class="info_con"><%=lvo.getLaddr() %></td>
			</tr>
			<%
				}// end of for
			} // enf of if
			%>
		</table>
		<!-- //selectAllLsjMem -->
	</body>
</html>