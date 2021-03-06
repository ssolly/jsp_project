package com.care.root.member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.care.root.member.dto.MemberDTO;

public class MemberDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","idid","idid");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> getMemberList() {
		System.out.println("getMemberList 호출");
		
		String sql = "select * from jsp_member";
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				MemberDTO dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int register(MemberDTO dto) {
		
		String sql = "insert into jsp_member(id,pwd,name,addr) values(?,?,?,?)";
		int result=0;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());	//DB에서 id를 primarykey로 등록해서 동일한 아이디 등록 불가능
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getAddr());
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
//		//테스트 해보기 (가입이 되는지, 한글이 깨지진 않는지 등등) 
//		System.out.println("id : " + dto.getId());
//		System.out.println("pwd : " + dto.getPwd());
//		System.out.println("name : " + dto.getName());
//		System.out.println("addr : " + dto.getAddr());
//		return 1;
		
	}
	
	public MemberDTO getMember(String userId) {
		System.out.println("id : "  + userId);
		String sql = "select * from jsp_member where id='"+userId+"'"; //sql문에서 string 값에는 '(작은따옴표) 필요
		System.out.println(sql);
		MemberDTO dto = null;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				dto = new MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPwd(rs.getString("pwd"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int modifySave(MemberDTO dto) {
		String sql = "update jsp_member set pwd=?, name=?, addr=? where id=?";
		int result=0;
		 try {
             ps = con.prepareStatement(sql);
             ps.setString(1, dto.getPwd());
             ps.setString(2, dto.getName());
             ps.setString(3, dto.getAddr());
             ps.setString(4, dto.getId());
             result = ps.executeUpdate();
		 } catch (Exception e) {
             e.printStackTrace();
		 }
		 return result;
	}
	
	public int delete(String userId) {
		int result = 0;
		String sql = "delete from jsp_member where id='"+userId+"'";
		try {
			ps=con.prepareStatement(sql);
			result=ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int checkLogin(String userId, String userPwd) {
		int result=0;
		String sql = "select id,pwd from jsp_member where id='"+userId+"'";
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				if (rs.getString("id").equals(userId)&&rs.getString("pwd").equals(userPwd)) {
					result=1;
				} else if (rs.getString("id").equals(userId)&& !(rs.getString("pwd").equals(userPwd))) {
					result=2;
				} else {
					result=0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(result);
		return result;
	}
}