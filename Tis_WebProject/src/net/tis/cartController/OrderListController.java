package net.tis.cartController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.cartDTO.CartSQL;
import net.tis.dto.Tis_ListProductDTO;
import net.tis.memberDAO.Tis_MemberDAO;
import net.tis.memberDTO.Tis_MemberDTO;
import net.tis.orderDTO.OrderDTO;

@WebServlet("/orderList.do")
public class OrderListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OrderListController() {
        super();
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
    	
    	String userId = request.getParameter("id");
    	
    	String[] productIdArr = request.getParameterValues("goods_select");
    	String[] goodsCntArr = request.getParameterValues("product_amount");
    	String[] productSizeArr = request.getParameterValues("product_size");
    	
//    	int orderListCount = osql.orderCount(userId);
    	int orderListCount = productIdArr.length;
    	
		int totalGoodsPrice = Integer.parseInt(request.getParameter("totalGoodsPrice"));
		
		String path = request.getContextPath();
		
		CartSQL csql = new CartSQL();
		ArrayList<OrderDTO> alist = new ArrayList<OrderDTO>();
    	
    	for(int i=0;i<productIdArr.length;i++) {
    		int productId = Integer.parseInt(productIdArr[i]);
    		int goodsCnt = Integer.parseInt(goodsCntArr[i]);
    		int productSize = Integer.parseInt(productSizeArr[i]);
    		
    		Tis_ListProductDTO pdto = csql.productInfo(productId);
    		
    		OrderDTO odto = new OrderDTO();
    		odto.setId(userId);
    		odto.setProductId(productId);
    		odto.setProductCode(pdto.getProduct_code());
    		odto.setProductName(pdto.getProduct_name());
    		odto.setProductPrice(pdto.getProduct_price());
    		odto.setGoodsCnt(goodsCnt);
    		odto.setProductSize(productSize);
    		odto.setProductImg1(pdto.getProduct_img1());
    		
    		alist.add(odto);
    	}
    	
    	Tis_MemberDAO mdao = new Tis_MemberDAO();
    	Tis_MemberDTO mdto = mdao.getMember(userId);
    
    	//페이징
    	String getPage = request.getParameter("page");
    		if(getPage==""||getPage==null) {
    			getPage="1";
    		}
    	int pageNum = Integer.parseInt(getPage);
    	int rowStart = ((pageNum-1)*10)+1;
    	int rowEnd = rowStart + 9;

    	int startPage = pageNum-((pageNum-1)%10);
    	int pageSum = 0;
    		if(orderListCount%10!=0) {
    			pageSum=(orderListCount/10)+1;
    		}
    		else {
    			pageSum=orderListCount/10;
    		}
    	int endPage = startPage + 9;
    		if(endPage>pageSum) {
    			endPage = pageSum;
    		}
    	//페이징 end

//		ArrayList<OrderDTO> alist=osql.orderSelectAll(userId, rowStart, rowEnd);
		
		request.setAttribute("id", userId);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageSum", pageSum);
		request.setAttribute("path", path);
		request.setAttribute("orderlist", alist);
		request.setAttribute("totalGoodsPrice", totalGoodsPrice);
		request.setAttribute("loginInfo", mdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("cart/Tis_webOrderPage.jsp");
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


