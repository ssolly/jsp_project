package com.care.root.login.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public LoginDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("드라이브 로드 성공");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","idid","idid");
		} catch (Exception e) {
			e.printStackTrace();
		}
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
	
	//선생님버전
	public int loginChk(String userId, String userPwd) {
		String sql = "select * from jsp_member where id='"+userId+"'";
		int result=0;
		try {
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) { //해당 아이디가 존재하는 경우
				if(userPwd.equals(rs.getString("pwd"))) {		//비밀번호 일치
					result=0;
				} else {	//비밀번호 불일치
					result=1;
				}
			} else { //해당 아이디가 존재하지 않는 경우
				result=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
