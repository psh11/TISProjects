package net.tis.dao;

import java.util.ArrayList;

import net.tis.common.Global;
import net.tis.common.Tis_DB;
import net.tis.dto.Tis_replyDTO;

public class replyDAO extends Global{

	public replyDAO() {
		CN = Tis_DB.getConnection();
	}
	
	public void replyInsert(int product_id, String member_id, String comment) {
		try {
			sql = "insert into product_reply values(product_reply_seq.nextval, ?, sysdate, ?,?)";
			PST = CN.prepareStatement(sql);
			PST.setString(1, comment);
			PST.setString(2, member_id);
			PST.setInt(3, product_id);
			PST.executeUpdate();
		} catch (Exception e) { System.out.println("등록 에러 : " + e); }
	}
	
	public ArrayList<Tis_replyDTO> replyList(int product_id, int start, int end) {
		ArrayList<Tis_replyDTO> list = new ArrayList<Tis_replyDTO>();
		try {
			String q = " select * from (";
			String u = " select rownum as rn, m.id, p.product_id, m.name, r.reply_code, r.reply_comment, r.reply_date, r.reply_member_id, r.reply_product_id from (select rownum, r.* from product_reply r order by rownum desc) r";
			String e = " inner join tis_webproduct p on p.product_id = r.reply_product_id";
			String r = " inner join tis_member m on r.reply_member_id = m.id";
//			String y = " and reply_product_id = " + product_id + " and reply_member_id = '" + member_id + "' order by rn desc ) where rn between "+start+" and "+end;
			String y = " and reply_product_id = " + product_id + " order by rn desc ) where rn between "+start+" and "+end;
			sql = q + u + e + r + y;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while ( RS.next() == true ) {
				Tis_replyDTO dto = new Tis_replyDTO();
				dto.setReply_code(RS.getInt("reply_code"));
				dto.setReply_comment(RS.getString("reply_comment"));
				dto.setReply_date(RS.getDate("reply_date"));
				dto.setReply_member_id(RS.getString("reply_member_id"));
				dto.setReply_product_id(RS.getInt("reply_product_id"));
				dto.setReply_member_name(RS.getString("name"));
				dto.setReply_rn(RS.getInt("rn"));
				list.add(dto);
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return list;
	}
	
	public int replyCount(int product_id) {
		int Rtotal = 0;
		try {
			sql = "select count(*) as cnt from product_reply where reply_product_id = "+product_id;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			RS.next();
			Rtotal = RS.getInt("cnt");
		} catch(Exception e ) { System.out.println("조회 에러 : " + e); }
		return Rtotal;
	}
	
	public void replyDelete(int reply_code, String member_id) {
		try {
			sql = "delete from product_reply where reply_code = "+reply_code+ " and reply_member_id = '"+member_id+"'";
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		} catch (Exception e ) { System.out.println("삭제 에러 : " + e); }
	}
	
	public void replyUpdate(int reply_code, String comment) {
		try {
			sql = "update product_reply set reply_comment='"+comment+"', reply_date = sysdate where reply_code = "+reply_code;
			ST = CN.createStatement();
			ST.executeUpdate(sql);
		} catch (Exception e) { System.out.println("수정 에러 : " + e); }
	}
	
	public Tis_replyDTO replyDetail(int reply_code, String member_id) {
		Tis_replyDTO dto = new Tis_replyDTO();
		try {
			sql = "select * from product_reply where reply_code = " + reply_code + " and reply_member_id = '"+member_id+"'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next() ) {
				dto.setReply_code(RS.getInt("reply_code"));
				dto.setReply_comment(RS.getString("reply_comment"));
				dto.setReply_date(RS.getDate("reply_date"));
				dto.setReply_member_id(RS.getString("reply_member_id"));
				dto.setReply_product_id(RS.getInt("reply_product_id"));
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return dto;
	}
	
	
	public Tis_replyDTO sessionReply(String member_id) {
		Tis_replyDTO dto = new Tis_replyDTO();
		try {
			sql = "select * from product_reply where reply_member_id = '"+member_id+"'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next() ) {
				dto.setReply_code(RS.getInt("reply_code"));
				dto.setReply_comment(RS.getString("reply_comment"));
				dto.setReply_date(RS.getDate("reply_date"));
				dto.setReply_member_id(RS.getString("reply_member_id"));
				dto.setReply_product_id(RS.getInt("reply_product_id"));
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return dto;
	}
}
