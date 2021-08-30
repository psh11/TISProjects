package net.tis.cartController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.cartDTO.CartSQL;
import net.tis.dto.Tis_ListProductDTO;
import net.tis.orderDTO.OrderDTO;
import net.tis.orderDTO.OrderSQL;

@WebServlet("/orderComplete.do")
public class OrderInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderInsertController() {
        super();
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
    	
    	CartSQL csql = new CartSQL();
    	OrderSQL osql = new OrderSQL();
    	
    	String userId=request.getParameter("user_id");
    	
    	String[] productIdArr = request.getParameterValues("product_id");
    	String[] goodsCntArr = request.getParameterValues("goods_cnt");
    	String[] productSizeArr = request.getParameterValues("product_size");
    	
    	for(int i=0;i<productIdArr.length;i++) {
    		int productId = Integer.parseInt(productIdArr[i]);
    		int goodsCnt = Integer.parseInt(goodsCntArr[i]);
    		int productSize = Integer.parseInt(productSizeArr[i]);
    		
    		Tis_ListProductDTO pdto = csql.productInfo(productId);
    		int productCode=pdto.getProduct_code();
    		String productName=pdto.getProduct_name();
    		int productPrice=pdto.getProduct_price();
    		String productImg1=pdto.getProduct_img1();
    		
    		//주문테이블에 입력
    		OrderDTO odto = new OrderDTO();
    		odto.setId(userId);
    		odto.setProductId(productId);
    		odto.setProductCode(productCode);
    		odto.setProductName(productName);
    		odto.setProductPrice(productPrice);
    		odto.setGoodsCnt(goodsCnt);
    		odto.setProductSize(productSize);
    		odto.setProductImg1(productImg1);
    		
    		
    		osql.orderInsert(odto);
    		
    		//주문물품 장바구니테이블에서 삭제
//        		csql.cartDelete(userId, productId);
    		
    	}
    	
    	request.setAttribute("id", userId);
    	RequestDispatcher dis = request.getRequestDispatcher("cart/Tis_webOrderComplete.jsp");
    	dis.forward(request, response);
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    		response.getWriter().append("Served at: ").append(request.getContextPath());
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
