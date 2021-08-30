package net.tis.dao;

import java.util.ArrayList;

import net.tis.common.Global;
import net.tis.common.Tis_DB;
import net.tis.dto.Tis_ListProductDTO;

public class ListDAO extends Global{

	public ListDAO() {
		CN = Tis_DB.getConnection();
	}
	
	public ArrayList<Tis_ListProductDTO> list(int code, int start, int end, String skey) {
		ArrayList<Tis_ListProductDTO> list = new ArrayList<Tis_ListProductDTO>();
		try {
			String q = "select * from ( ";
			String u = " select rownum as rn, product_id, product_code, product_name, product_price, product_content, product_img1, product_img2, product_img3 from ";
			String r = " ( select * from tis_webproduct where product_code = "+ code + "and product_name like '%"+skey+"%' order by product_id desc )";
			String y = ") where rn between " + start + " and " + end;
			sql = q + u + r + y; 
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			while( RS.next() == true ) {
				Tis_ListProductDTO dto = new Tis_ListProductDTO();
				dto.setProduct_id(RS.getInt("product_id"));
				dto.setProduct_code(RS.getInt("product_code"));
				dto.setProduct_name(RS.getString("product_name"));
				dto.setProduct_price(RS.getInt("product_price"));
				dto.setProduct_content(RS.getString("product_content"));
				dto.setProduct_img1(RS.getString("product_img1"));
				dto.setProduct_img2(RS.getString("product_img2"));
				dto.setProduct_img3(RS.getString("product_img3"));
				
				list.add(dto);
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return list;
	}
	
	public int productCount(int code, String skey) {
		try {
			sql = "select count(*) as cnt from tis_webproduct where product_code = " + code + "and product_name like '%"+skey+"%'";
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			RS.next();
			Ttotal = RS.getInt("cnt");
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); }
		return Ttotal;
	}
	
	public Tis_ListProductDTO listDetail(int product_id, int product_code) {
		Tis_ListProductDTO dto = new Tis_ListProductDTO();
		try {
			sql = "select * from tis_webproduct where product_id = "+product_id+ " and product_code = " + product_code;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next() ) {
				dto.setProduct_id(RS.getInt("product_id"));
				dto.setProduct_code(RS.getInt("product_code"));
				dto.setProduct_name(RS.getString("product_name"));
				dto.setProduct_price(RS.getInt("product_price"));
				dto.setProduct_content(RS.getString("product_content"));
				dto.setProduct_img1(RS.getString("product_img1"));
				dto.setProduct_img2(RS.getString("product_img2"));
				dto.setProduct_img3(RS.getString("product_img3"));
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); } 
		return dto;
	}
	
	public Tis_ListProductDTO listDetail(int product_id) {
		Tis_ListProductDTO dto = new Tis_ListProductDTO();
		try {
			sql = "select * from tis_webproduct where product_id = "+product_id;
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if ( RS.next() ) {
				dto.setProduct_id(RS.getInt("product_id"));
				dto.setProduct_code(RS.getInt("product_code"));
				dto.setProduct_name(RS.getString("product_name"));
				dto.setProduct_price(RS.getInt("product_price"));
				dto.setProduct_content(RS.getString("product_content"));
				dto.setProduct_img1(RS.getString("product_img1"));
				dto.setProduct_img2(RS.getString("product_img2"));
				dto.setProduct_img3(RS.getString("product_img3"));
			}
		} catch (Exception e ) { System.out.println("조회 에러 : " + e); } 
		return dto;
	}
}
