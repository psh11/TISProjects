package net.tis.cartDTO;

import java.util.ArrayList;

import net.tis.common.Global;
import net.tis.common.Tis_DB;
import net.tis.dto.Tis_ListProductDTO;

public class CartSQL extends Global{
	
	
	public CartSQL() {
		CN=Tis_DB.getConnection();
	}
	
	public Tis_ListProductDTO productInfo(int productId) {
		Tis_ListProductDTO dto = new Tis_ListProductDTO();
		try {
			sql="select product_code, product_name, product_price, product_img1 from tis_webproduct where product_id="+productId;
			
			ST = CN.createStatement();
			RS = ST.executeQuery(sql);
			if(RS.next()==true) {
				dto.setProduct_code(RS.getInt("product_code"));
				dto.setProduct_name(RS.getString("product_name"));
				dto.setProduct_price(RS.getInt("product_price"));
				dto.setProduct_img1(RS.getString("product_img1"));
				
			}
		} catch (Exception e ) { System.out.println(e); }
		return dto;
	}
	
	
	public void cartInsert(String userId, CartDTO cdto) {
		try {
			sql = "insert into tis_cart values(?,?,?,?,?,?,?,?,0)";
			
			PST=CN.prepareStatement(sql);
			PST.setString(1, userId);
			PST.setInt(2, cdto.getProductId());
			PST.setInt(3, cdto.getProductCode());
			PST.setString(4, cdto.getProductName());
			PST.setInt(5, cdto.getProductPrice());
			PST.setInt(6, cdto.getGoodsCnt());
			PST.setInt(7, cdto.getProductSize());
			PST.setString(8, cdto.getProductImg1());
			PST.executeUpdate();
		}
		
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
	public ArrayList<CartDTO> cartSelectAll(String userId, int rowStart, int rowEnd) {
		ArrayList<CartDTO> alist = new ArrayList<CartDTO>();
		try{
//			sql="select * from (select rownum as rn, m.id, c.product_id, c.product_name, c.product_price, c.product_amount, c.product_img1 from tis_cart c join tis_member m on c.id=m.id and m.id='"+userId+"') where rn between "+rowStart+" and "+rowEnd;
			sql="select * from (select rownum as rn, c.* from tis_cart c where id='"+userId+"') where rn between "+rowStart+" and "+rowEnd;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			
			while(RS.next()) {
				CartDTO cdto = new CartDTO();
				cdto.setId(RS.getString("id"));
				cdto.setProductId(RS.getInt("product_id"));
				cdto.setProductCode(RS.getInt("product_code"));
				cdto.setProductName(RS.getString("product_name"));
				cdto.setProductPrice(RS.getInt("product_price"));
				cdto.setGoodsCnt(RS.getInt("goods_cnt"));
				cdto.setProductSize(RS.getInt("product_size"));
				cdto.setProductImg1(RS.getString("product_img1"));
				
				alist.add(cdto);
			}
		}
		catch(Exception e) {
			System.out.println("db출력 실패"+e);
		}
		
		return alist;
	}
	
	public int cartCount(String userId) {
		int count=0;
		try {
			sql="select count(*) as cnt from tis_cart c join tis_member m on c.id=m.id and m.id='"+userId+"'";
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			if(RS.next()) {
				count=RS.getInt("cnt");
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return count;
	}
	
	public int cartDelete(String userId, int productId) {
		int deleteCheck = 0;
		try {
			sql="delete from tis_cart where id='"+userId+"' and product_id="+productId;
			ST=CN.createStatement();
			deleteCheck = ST.executeUpdate(sql);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return deleteCheck;
	}
	
	public void cartUpdate(String userId, int productId) {
		try {
			sql="update its_cart set order_check=1 where id='"+userId+"' and product_id="+productId;
			ST=CN.createStatement();
			ST.executeUpdate(sql);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}
	
}
