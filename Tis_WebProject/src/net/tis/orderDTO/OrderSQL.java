package net.tis.orderDTO;

import java.util.ArrayList;

import net.tis.common.Global;
import net.tis.common.Tis_DB;

public class OrderSQL extends Global{
	public OrderSQL() {
		CN=Tis_DB.getConnection();
	}
	
	public int orderInsert(OrderDTO odto) {
		int result = 0;
		try {
			sql="insert into tis_order values(?,?,?,?,?,?,?,?)";
			PST=CN.prepareStatement(sql);
			PST.setString(1, odto.getId());
			PST.setInt(2, odto.getProductId());
			PST.setInt(3, odto.getProductCode());
			PST.setString(4, odto.getProductName());
			PST.setInt(5, odto.getProductPrice());
			PST.setInt(6, odto.getGoodsCnt());
			PST.setInt(7, odto.getProductSize());
			PST.setString(8, odto.getProductImg1());
			result = PST.executeUpdate();
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return result;
	}
	
	public int orderCount(String userId) {
		int count=0;
		try {
			sql="select count(*) as cnt from tis_order o join tis_member m on o.id=m.id and m.id='"+userId+"'";
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
	
	public ArrayList<OrderDTO> orderSelectAll(String userId, int rowStart, int rowEnd) {
		ArrayList<OrderDTO> alist = new ArrayList<OrderDTO>();
		try {
			sql="select * from (select rownum as rn, o.* from tis_order o where id='"+userId+"') where rn between "+rowStart+" and "+rowEnd;
			ST=CN.createStatement();
			RS=ST.executeQuery(sql);
			while(RS.next()) {
				OrderDTO odto = new OrderDTO();
				odto.setId(RS.getString("id"));
				odto.setProductId(RS.getInt("product_id"));
				odto.setProductCode(RS.getInt("product_code"));
				odto.setProductName(RS.getString("product_name"));
				odto.setProductPrice(RS.getInt("product_price"));
				odto.setGoodsCnt(RS.getInt("goods_cnt"));
				odto.setProductSize(RS.getInt("product_size"));
				odto.setProductImg1(RS.getString("product_img1"));
				
				alist.add(odto);
			}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
		return alist;
	}
}
