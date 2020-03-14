<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.mvc1.board.dao.LsjBoardDao" %>
<%@ page import="com.mvc1.board.dao.LsjBoardDaoImpl" %>
<%@ page import="com.mvc1.board.vo.LsjBoardVO" %>
<%@ page import="java.util.ArrayList" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>updateLsjBoard</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
			$(function(){
				$('#selectAllBtn').click(function(){
					alert("selectAll >>> ");
					$('#boardUpdate').attr('action','/mvc1Pattern/board/selectAllLsjBoard.jsp').submit();
				});
				$('#updateOkBtn').click(function(){
					alert("updateOk >>> ");
					$('#boardUpdate').attr('action','/mvc1Pattern/board/updateOkLsjBoard.jsp').submit();
				});
			});
		</script>
	</head>
	<body>
		<%
			request.setCharacterEncoding("UTF-8");
		
			String chkInLno = request.getParameter("chkInLno");
			
			LsjBoardDao ldao = new LsjBoardDaoImpl();
			LsjBoardVO lbvo = new LsjBoardVO();
			
			// 글번호 = 체크해서 넘어온 번호데이터 담아주기
			lbvo.setLno(chkInLno);
			
			ArrayList<LsjBoardVO> aList = ldao.selectLsjBoard(lbvo);
			
			int lCnt = aList.size();
			System.out.println("(log) updateLsjBoard.jsp aList.size() >>> " + lCnt);
		%>
		<form name="boardUpdate" id="boardUpdate" method="POST">
			<table class="table" border="1">
			<%
				if(lCnt>=1){
					for(int i=0; i<lCnt; i++){
						LsjBoardVO lvo = aList.get(i);
			%>
				<thead>
					<tr>
						<th colspan="2">게시글 수정하기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
					<td class="info_title">글번호</td>
					<td class="info_input">
						<input type="text" name="lno" id="lno" readonly value=<%=lvo.getLno() %>></td>
				</tr>
				<tr>
					<td class="info_title">제목</td>
					<td class="info_input"><input type="text" name="lsubject" id="lsubject" value=<%=lvo.getLsubject() %>></td>
				</tr>
				<tr>
					<td class="info_title">이름</td>
					<td class="info_input"><input type="text" name="lname" id="lname" value=<%=lvo.getLname() %>></td>
				</tr>
				<tr>
					<td class="info_title">내용</td>
					<td class="info_input">
						<textarea name="lmemo" id="lmemo" <%=lvo.getLmemo() %>></textarea>
					</td>
				</tr>
				<tr>
					<td class="info_title">비밀번호</td>
					<td class="info_input pw_box">
						<input type ="password" name="lpw" id="lpw">
						<input type ="button" id="lpwCheck" value="비밀번호 확인"">
					</td>
				</tr>
				</tbody>
			<%
					}// end of for
			%>
				<tr>
					<td colspan="2" class="info_button_group">
						<input type="button" value="글수정" class="btn" id="updateOkBtn">
						<input type="button" value="글목록" class="btn" id="selectAllBtn">
					</td>
				</tr>
			<%
				}else{
			%>
			<script>
				alert("수정할 데이터가 없습니다");
			</script>
			<%
				}
			%>
			</table>
		</form>
	</body>
</html>