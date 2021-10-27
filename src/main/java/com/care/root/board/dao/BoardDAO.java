package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;

public class BoardDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","idid","idid");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list() {
		String sql = "select * from test_board";
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public void writeSave(String name, String title, String content) {
		String sql=	"insert into test_board(id, name, title, content, idgroup, step, indent) "
				+ "values(test_board_seq.nextval,?,?,?, test_board_seq.currval,0,0)";
					//text_board_seq : 초기 값(0)을 가지고 있다가 nextval(+1) 값을 저장
									   //currval : 현재의 (증가된)값을 가지고 옴
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void upHit(String num) {
		String sql = "update test_board set hit=hit+1 where id="+num;
		try {
			ps=con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public BoardDTO contentView(String num) {
		upHit(num);
		
		String sql = "select * from test_board where id="+num;
		BoardDTO dto = new BoardDTO();
		
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setName(rs.getString("name"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setSavedate(rs.getTimestamp("savedate"));
				dto.setHit(rs.getInt("hit"));
				dto.setIdgroup(rs.getInt("idgroup"));
				dto.setStep(rs.getInt("step"));
				dto.setIndent(rs.getInt("indent"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void modify(String id, String name, String title, String content) {
		String sql = "update test_board set name=?, title=?, content=? where id=?";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, title);
			ps.setString(3, content);
			ps.setString(4, id);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int delete(String id) {
		int result=0;
		System.out.println(id);
		String sql = "delete from test_board where id="+id;
		try {
			ps=con.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
//	public void delete(String id) {
//		String sql = "delete from test_board where id="+id;
//		try {
//			ps=con.prepareStatement(sql);
//			ps.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//	}
	
	
	
//	//jsp_board table 관련
//	public ArrayList<BoardDTO> getBoardList() {
//		System.out.println("getBoardList 호출");
//		
//		String sql = "select * from jsp_board";
//		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
//		try {
//			ps=con.prepareStatement(sql);
//			rs=ps.executeQuery();
//			while(rs.next()) {
//				BoardDTO dto = new BoardDTO();
//				dto.setId(rs.getString("id"));
//				dto.setBoard_pwd(rs.getString("board_pwd"));
//				dto.setTitle(rs.getString("title"));
//				dto.setContent(rs.getString("content"));
//				dto.setDate(rs.getString("date"));
//				list.add(dto);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}	
}
