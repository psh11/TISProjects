package net.tis.memberDAO;

import net.tis.common.Global;
import net.tis.common.Tis_DB;
import net.tis.memberDTO.Tis_MemberDTO;

public class Tis_MemberDAO extends Global{

	public Tis_MemberDAO() {
		CN = Tis_DB.getConnection();
	}
	
	public int login(String member_id, String member_pwd) {
		int result = -1;
		try {
			sql = "select * from tis_member where id = '"+member_id+"'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next() == true ) {
				if ( RS.getString("password") !=null && RS.getString("password").equals(member_pwd)) {
					result = 1;
				} else {
					result = 0;
				}
			} else {
				result = -1;
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return result;
	}
	
	public Tis_MemberDTO getMember(String member_id) {
		Tis_MemberDTO dto = new Tis_MemberDTO();
		try {
			sql = "select * from tis_member where id = '"+member_id+"'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next()) {
				dto.setId(RS.getString("id"));
				dto.setPassword(RS.getString("password"));
				dto.setName(RS.getString("name"));
				dto.setEmail(RS.getString("email"));
				dto.setPhone(RS.getString("phone"));
				dto.setGender(RS.getString("gender"));
				dto.setAddress(RS.getString("address"));
				dto.setRegdate(RS.getDate("regdate"));
			}			
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return dto;
	}
	
	public Tis_MemberDTO getMember() {
		Tis_MemberDTO dto = new Tis_MemberDTO();
		try {
			sql = "select * from tis_member";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while ( RS.next()) {
				dto.setId(RS.getString("id"));
				dto.setPassword(RS.getString("password"));
				dto.setName(RS.getString("name"));
				dto.setEmail(RS.getString("email"));
				dto.setPhone(RS.getString("phone"));
				dto.setGender(RS.getString("gender"));
				dto.setAddress(RS.getString("address"));
				dto.setRegdate(RS.getDate("regdate"));
			}			
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return dto;
	}
}
