package com.care.root.board.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.board.dto.BoardDTO;
import com.care.root.paging.PageCount;

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
	
	public ArrayList<BoardDTO> list(int start,int end) {
		//String sql = "select * from test_board";

		//오라클 정렬 : 최신글이 위에 가기 위해 idgroup 내림차순 정렬, step은 오름차순 정렬
		//String sql = "select * from test_board order by idgroup desc, step asc";
		System.out.println(start + ": " + end);
		String sql= "select B.* from(select rownum rn, A.* from"
				+ "(select * from test_board order by idgroup desc, step asc)A)B where rn between ? and ?";
		
		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			ps=con.prepareStatement(sql);
	
			ps.setInt(1, start);
			ps.setInt(2, end);
	
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
	
	public BoardDTO contentView(String num, int flag) {
		if(flag==1) {
			upHit(num);
		}
		
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
	
	public void replyShape(BoardDTO dto) {
		String sql = "update test_board set step=step+1 where idgroup=? and step >?";
										//이미 게시된 글의 step의 숫자에서 +1
		try {
			ps=con.prepareStatement(sql);
			ps.setInt(1, dto.getIdgroup());
			ps.setInt(2, dto.getStep());
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void reply(BoardDTO dto) {
		replyShape(dto);
		
		String sql = "insert into test_board(id,name,title,content,idgroup,step,indent) "
				+ "values(test_board_seq.nextval,?,?,?,?,?,?)";
		try {
			ps=con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			
			ps.setInt(4, dto.getIdgroup());
			ps.setInt(5, dto.getStep()+1);
			ps.setInt(6, dto.getIndent()+1);
			
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//글의 갯수만큼 카운트를 가지고 오는 메소드
	public int getTotalPage() {
		String sql = "select count(*) from test_board";
		int totPage=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				totPage=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return totPage;
	}
	
	//연산코드
	public PageCount pagingNum(int start) {
		PageCount pc = new PageCount();
		
		if(start==0) {							//스타트 페이지의 설정이 없다면
			start=1;							//보여줄 페이지 설정(첫번째 페이지)
		}
		
		int pageNum = 3;						//페이지 별 글의 갯수
		int totalPage = getTotalPage();			//글의 총 갯수
		
		int totEndPage = totalPage/pageNum;		//페이지 갯수
		if(totEndPage % pageNum !=0 ) {
			totEndPage = totEndPage+1;
		}
		
		//list의 start와 end 값을 넣어주기 위한 계산 값
		int endPage = start*pageNum;			//마지막 페이지
		int startPage = endPage+1 - pageNum;	//시작 페이지를 맞춰주는 계산
		
		pc.setStartPage(startPage);
		pc.setEndPage(endPage);
		pc.setTotEndPage(totEndPage);
		
		return pc;
	}
	
	
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
