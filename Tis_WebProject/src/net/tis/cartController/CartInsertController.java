package net.tis.cartController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.cartDTO.CartDTO;
import net.tis.cartDTO.CartSQL;
import net.tis.dto.Tis_ListProductDTO;

@WebServlet("/cartInsert.do")
public class CartInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartInsertController() {
        super();
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	response.getWriter().append("Served at: ").append(request.getContextPath());
    	
    	String userId = request.getParameter("member_id");
    	int productId = Integer.parseInt(request.getParameter("product_id"));
    	int goodsCnt = Integer.parseInt(request.getParameter("goodsCnt"));
    	int productSize = Integer.parseInt(request.getParameter("product_size")); 
    	
    	Tis_ListProductDTO pdto = new Tis_ListProductDTO();
    	CartSQL csql = new CartSQL();
    	
    	pdto = csql.productInfo(productId);
    	int productCode=pdto.getProduct_code();
    	String productName= pdto.getProduct_name();
    	int productPrice = pdto.getProduct_price();
    	String productImg1=pdto.getProduct_img1();
    
    	CartDTO cdto = new CartDTO();
    	cdto.setProductId(productId);
    	cdto.setProductCode(productCode);
    	cdto.setProductName(productName);
    	cdto.setProductPrice(productPrice);
    	cdto.setGoodsCnt(goodsCnt);
    	cdto.setProductSize(productSize);
    	cdto.setProductImg1(productImg1);
    	
    	csql.cartInsert(userId, cdto);
    	
    	RequestDispatcher dis = request.getRequestDispatcher("productlistDetail.do?id="+productId+"&code="+productCode);
    	dis.forward(request, response);
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
