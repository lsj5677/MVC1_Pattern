package com.mvc1.board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mvc1.board.sql.LsjBoardQueryMap;
import com.mvc1.board.vo.LsjBoardVO;
import com.mvc1.common.utils.LsjChaebun;
import com.mvc1.common.utils.LsjConnProperty;

public class LsjBoardDaoImpl implements LsjBoardDao {

	@Override
	public int insertLsjBoard(LsjBoardVO lbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) LsjBoardDaoImpl.insertLsjBoard >>>");
		
		// validation
		String lno = LsjChaebun.boardChaebun();
		String lsubject = lbvo.getLsubject();
		String lname = lbvo.getLname();
		String lpw = lbvo.getLpw();
		String lmemo = lbvo.getLmemo();
		String ldeleteyn = lbvo.getLdeleteyn();
		
		// data check
		System.out.println("(log) lno >>> " + lno);
		System.out.println("(log) lsubject >>> " + lsubject);
		System.out.println("(log) lname >>> " + lname);
		System.out.println("(log) lpw >>> " + lpw);
		System.out.println("(log) lmemo >>> " + lmemo);
		
		// 초기화
		Connection conn = null;
		PreparedStatement pstmt = null;
		int lCnt = 0;
		
		// logic
		try{
			// 연결
			conn = LsjConnProperty.getConnection();
			System.out.println("(log) conn >>> " + conn);
			
			// AutoCommit setting = 자동커밋 안되게 false로 지정
			conn.setAutoCommit(false);

			// 쿼리가져오기
			pstmt = conn.prepareStatement(LsjBoardQueryMap.lsjBoardInsertQuery());

			// set으로 초기화 get으로 리턴 (Validation 이용)
			pstmt.setString(1, lno);
			pstmt.setString(2, lsubject);
			pstmt.setString(3, lname);
			pstmt.setString(4, lpw);
			pstmt.setString(5, lmemo);
			// deleteyn = 값으로 (Y or N)
			pstmt.setString(6, ldeleteyn);

			// count 변수에 결과값 담기
			lCnt = pstmt.executeUpdate();

			// 결과값 담았으니 false로 지정했던 오토커밋 true로 변경해주기
			boolean b = !conn.getAutoCommit();
			System.out.println("(log) !con.getAutoCommit >>> " + b);

			// true면 false, false면 true
			if (!conn.getAutoCommit()) {
				// db commit
				conn.commit();
				System.out.println("(log) insert check >>> " + lCnt);

				// 연결 닫아주기
				LsjConnProperty.conClose(conn, pstmt);
			}
		}catch(Exception e){
			System.out.println("	Error >>> " + e.getMessage());
		} finally {
			// finally절은 try catch 상관없이 읽기때문에 연결 닫아주는 코드 적어주기
			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt);
		}

		// count에 값이 0 과 같으면 리턴값 없음
		if (lCnt == 0) return 0;

		return lCnt;
	}

	@Override
	public int updateLsjBoard(LsjBoardVO lbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) LsjBoardDaoImpl.updateLsjBoard >>>");
		
		// validation
		String lno = lbvo.getLno();
		String lsubject = lbvo.getLsubject();
		String lmemo = lbvo.getLmemo();
		
		// data check
		System.out.println("(log) lno >>> " + lno);
		System.out.println("(log) lsubject >>> " + lsubject);
		System.out.println("(log) lmemo >>> " + lmemo);
		
		// 초기화
		Connection conn = null;
		PreparedStatement pstmt = null;
		int lCnt = 0;
		
		// logic
		try{
			// 연결
			conn = LsjConnProperty.getConnection();
			System.out.println("(log) conn >>> " + conn);
			
			// AutoCommit setting = 자동커밋 안되게 false로 지정
			conn.setAutoCommit(false);

			// 쿼리가져오기
			pstmt = conn.prepareStatement(LsjBoardQueryMap.lsjBoardUpdateQuery());

			// setting (placeholder 순서)
			pstmt.setString(1, lsubject);
			pstmt.setString(2, lmemo);
			pstmt.setString(3, lno);

			// count 변수에 결과값 담기
			lCnt = pstmt.executeUpdate();

			// 결과값 담았으니 false로 지정했던 오토커밋 true로 변경해주기
			boolean b = !conn.getAutoCommit();
			System.out.println("(log) !con.getAutoCommit >>> " + b);

			// true면 false, false면 true
			if (!conn.getAutoCommit()) {
				// db commit
				conn.commit();
				System.out.println("(log) insert check >>> " + lCnt);

				// 연결 닫아주기
				LsjConnProperty.conClose(conn, pstmt);
			}
		}catch(Exception e){
			System.out.println("	Error >>> " + e.getMessage());
		} finally {
			// finally절은 try catch 상관없이 읽기때문에 연결 닫아주는 코드 적어주기
			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt);
		}

		// count에 값이 0 과 같으면 리턴값 없음
		if (lCnt == 0) return 0;

		System.out.println("(log) LsjBoardDaoImpl.updateLsjBoard <<<");
		return lCnt;
	}

	@Override
	public int deleteLsjBoard(LsjBoardVO lbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) LsjBoardDaoImpl.deleteLsjBoard >>>");
		
		// validation
		String lno = lbvo.getLno();
		
		// data check
		System.out.println("(log) lno >>> " + lno);
		
		// 초기화
		Connection conn = null;
		PreparedStatement pstmt = null;
		int lCnt = 0;
		
		// logic
		try{
			// 연결
			conn = LsjConnProperty.getConnection();
			System.out.println("(log) conn >>> " + conn);
			
			// AutoCommit setting = 자동커밋 안되게 false로 지정
			conn.setAutoCommit(false);

			// 쿼리가져오기
			pstmt = conn.prepareStatement(LsjBoardQueryMap.lsjBoardDeleteQuery());

			// setting (placeholder 순서)
			pstmt.setString(1, lno);

			// count 변수에 결과값 담기
			lCnt = pstmt.executeUpdate();

			// 결과값 담았으니 false로 지정했던 오토커밋 true로 변경해주기
			boolean b = !conn.getAutoCommit();
			System.out.println("(log) !con.getAutoCommit >>> " + b);

			// true면 false, false면 true
			if (!conn.getAutoCommit()) {
				// db commit
				conn.commit();
				System.out.println("(log) insert check >>> " + lCnt);

				// 연결 닫아주기
				LsjConnProperty.conClose(conn, pstmt);
			}
		}catch(Exception e){
			System.out.println("	Error >>> " + e.getMessage());
		} finally {
			// finally절은 try catch 상관없이 읽기때문에 연결 닫아주는 코드 적어주기
			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt);
		}

		// count에 값이 0 과 같으면 리턴값 없음
		if (lCnt == 0) return 0;

		System.out.println("(log) LsjBoardDaoImpl.deleteLsjBoard <<<");
		return lCnt;
	}

	@Override
	public ArrayList<LsjBoardVO> selectAllLsjBoard() {
		// TODO Auto-generated method stub
		System.out.println("(log) LsjBoardDaoImpl.selectAllLsjBoard >>>");
		
		// 초기화
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<LsjBoardVO> aList = null;
		LsjBoardVO lbvo = null;

		// 로직구현
		try {
			// 연결
			conn = LsjConnProperty.getConnection();
			// 쿼리가져오기
			pstmt = conn.prepareStatement(LsjBoardQueryMap.lsjBoardSelectAllQuery());
			// 결과값 담기
			rsRs = pstmt.executeQuery();

			// data check
			if (rsRs != null) {

				// instance
				aList = new ArrayList<LsjBoardVO>();

				// 실행 안되면 찍어보는 로그 (true/false로 출력)
				// System.out.println("(log) rsRs.next() >>> " + rsRs);

				while (rsRs.next()) {
					// instance
					lbvo = new LsjBoardVO();

					// set으로 초기화 get으로 return
					lbvo.setLno(rsRs.getString("LNO"));
					lbvo.setLsubject(rsRs.getString("LSUBJECT"));
					lbvo.setLname(rsRs.getString("LNAME"));
					lbvo.setLpw(rsRs.getString("LPW"));
					lbvo.setLmemo(rsRs.getString("LMEMO"));
					lbvo.setLdeleteyn(rsRs.getString("LDELETEYN"));
					lbvo.setLinsertdate(rsRs.getString("LINSERTDATE"));
					lbvo.setLupdatedate(rsRs.getString("LUPDATEDATE"));

					// data aList에 담기
					aList.add(lbvo);
				} // end of while

				// aList size 확인
				System.out.println("(log) aList.size() >>> " + aList.size());

			} // end of if(rsRs!=null)

			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt, rsRs);

		} catch (Exception e) {
			System.out.println("	Error >>> " + e.getMessage());
		} finally {
			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) LsjBoardDaoImpl.selectAllLsjBoard <<<");
		return aList;
	}

	@Override
	public ArrayList<LsjBoardVO> selectLsjBoard(LsjBoardVO lbvo) {
		// TODO Auto-generated method stub
		System.out.println("(log) LsjBoardDaoImpl.selectLsjBoard >>>");
		
		// validation
		String lno = lbvo.getLno();

		// data check
		System.out.println("(log) lno >>> " + lno);

		
		// 초기화
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rsRs = null;
		ArrayList<LsjBoardVO> aList = null;
		LsjBoardVO lbvo_ = null;

		// 로직구현
		try {
			// 연결
			conn = LsjConnProperty.getConnection();
			// 쿼리가져오기
			pstmt = conn.prepareStatement(LsjBoardQueryMap.lsjBoardSelectQuery());
			// setting
			pstmt.setString(1, lno);
			// 결과값 담기
			rsRs = pstmt.executeQuery();

			// data check
			if (rsRs != null) {

				// instance
				aList = new ArrayList<LsjBoardVO>();

				// 실행 안되면 찍어보는 로그 (true/false로 출력)
				// System.out.println("(log) rsRs.next() >>> " + rsRs);

				while (rsRs.next()) {
					// instance
					lbvo_ = new LsjBoardVO();

					// set으로 초기화 get으로 return
					lbvo_.setLno(rsRs.getString("LNO"));
					lbvo_.setLsubject(rsRs.getString("LSUBJECT"));
					lbvo_.setLname(rsRs.getString("LNAME"));
					lbvo_.setLpw(rsRs.getString("LPW"));
					lbvo_.setLmemo(rsRs.getString("LMEMO"));
					lbvo_.setLdeleteyn(rsRs.getString("LDELETEYN"));
					lbvo_.setLinsertdate(rsRs.getString("LINSERTDATE"));
					lbvo_.setLupdatedate(rsRs.getString("LUPDATEDATE"));

					// data aList에 담기
					aList.add(lbvo_);
				} // end of while

				// aList size 확인
				System.out.println("(log) aList.size() >>> " + aList.size());

			} // end of if(rsRs!=null)

			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt, rsRs);

		} catch (Exception e) {
			System.out.println("	Error >>> " + e.getMessage());
		} finally {
			// 연결 닫아주기
			LsjConnProperty.conClose(conn, pstmt, rsRs);
		}
		System.out.println("(log) LsjBoardDaoImpl.selectLsjBoard <<<");
		return aList;
	}

}
