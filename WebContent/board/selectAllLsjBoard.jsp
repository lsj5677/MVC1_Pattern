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
		<title>selectAllLsjBoard</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
		<script>
			$(function(){
				$('#insertBtn').click(function(){
					alert("insert >>> ");
					$('#boardSelectAll').attr('action','/mvc1Pattern/board/boardWrite.html').submit();
				});
				$('#selectAllBtn').click(function(){
					alert("selectAll >>> ");
					$('#boardSelectAll').attr('action','/mvc1Pattern/board/selectAllLsjBoard.jsp').submit();
				});
				$('#updateBtn').click(function(){
					alert("update >>> ");
					$('#boardSelectAll').attr('action','/mvc1Pattern/board/updateLsjBoard.jsp').submit();
				});
				$('#deleteBtn').click(function(){
					alert("delete >>> ");
					$('#boardSelectAll').attr('action','/mvc1Pattern/board/deleteLsjBoard.jsp').submit();
				});
			});
		</script>
	</head>
	<body>
		<%
			LsjBoardDao ldao = new LsjBoardDaoImpl();
			ArrayList<LsjBoardVO> aList = ldao.selectAllLsjBoard();
			
			int lCnt = aList.size();
			System.out.println("(log) selectAllLsjBoard.jsp aList.size >>> " + lCnt);
		%>
		<!-- form -->
		<form name="boardSelectAll" id="boardSelectAll" method="POST">
			<!-- table -->
			<table class="table" border="1">
				<!-- thead -->
				<thead>
					<tr>
						<th colspan="10">게시판</th>
					</tr>
					<tr>
						<td class="info_title">
							<input type="checkbox" name="chkAll" id="chkAll">
						</td>
						<td class="info_title">글번호</td>
						<td class="info_title">제목</td>
						<td class="info_title">이름</td>
						<td class="info_title">비밀번호</td>
						<td class="info_title">내용</td>
						<td class="info_title">입력일</td>
					</tr>
				</thead>
				<!-- //thead -->
				
				<%
					for(int i=0; i<lCnt; i++){
						LsjBoardVO lbvo = (LsjBoardVO)aList.get(i);
				%>
				<!-- tbody -->
				<tbody>
					<tr>
						<td class="info_con">
							<input type="checkbox" name="chkInLno" id="chkInLno" value=<%= lbvo.getLno() %>  
							onclick="checkOnly(this)">
						</td>
						<td class="info_con"><%=lbvo.getLno() %></td>
						<td class="info_con"><%=lbvo.getLsubject() %></td>
						<td class="info_con"><%=lbvo.getLname() %></td>
						<td class="info_con"><%=lbvo.getLpw() %></td>
						<td class="info_con"><%=lbvo.getLmemo() %></td>
						<td class="info_con"><%=lbvo.getLinsertdate() %></td>		
					</tr>
				<%
					}
				%>
					<tr>
						<td colspan="10" class="info_button_group">																				
							<input type="button" value="글쓰기" class="btn" id="insertBtn" />
							<input type="button" value="글목록" class="btn" id="selectAllBtn" />
							<input type="button" value="글수정" class="btn" id="updateBtn" />
							<input type="button" value="글삭제" class="btn" id="deleteBtn" />			
						</td>
					</tr>
				</tbody>
				<!-- //tbody -->
			</table>
			<!-- //table -->
		</form>
		<!-- //form -->
	</body>
</html>