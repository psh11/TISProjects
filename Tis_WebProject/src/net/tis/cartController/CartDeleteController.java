package net.tis.cartController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.cartDTO.CartSQL;

@WebServlet("/cartDelete.do")
public class CartDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartDeleteController() {
        super();
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
    	CartSQL csql = new CartSQL();
    	String userId = request.getParameter("id");
    	String paramProductId = request.getParameter("productid");
    	String[] productIdArr = request.getParameterValues("goods_select");
    	
    	int deleteCheck = 0;
    	RequestDispatcher dis;
    	if(paramProductId==null) {
    		for(int i=0;i<productIdArr.length;i++) {
    			int productId = Integer.parseInt(productIdArr[i]);
    			deleteCheck = csql.cartDelete(userId, productId);
    		}
    		
    		request.setAttribute("id", userId);
    		request.setAttribute("result", deleteCheck);
    		dis = request.getRequestDispatcher("cart/Tis_webCartDelete.jsp");
    		dis.forward(request, response);
    	}
    	else if(paramProductId!=null) {
    		int productId = Integer.parseInt(paramProductId);
    		
    		deleteCheck = csql.cartDelete(userId, productId);
    		
    		request.setAttribute("id", userId);
    		request.setAttribute("result",deleteCheck);
    		dis = request.getRequestDispatcher("cart/Tis_webCartDelete.jsp");
    		dis.forward(request, response);
    	}
    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doUser(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
