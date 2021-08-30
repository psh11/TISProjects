package net.tis.cartController;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.cartDTO.CartDTO;
import net.tis.cartDTO.CartSQL;

@WebServlet("/cartList.do")
public class CartListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CartListController() {
        super();
    }

    protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	response.getWriter().append("Served at: ").append(request.getContextPath());
//    	PrintWriter out = response.getWriter();
    	String userId = request.getParameter("id");
    	
    	CartSQL csql = new CartSQL();
    	int cartListCount = csql.cartCount(userId);
    	
    	String getPage = request.getParameter("page");
    		if(getPage==""||getPage==null) {
    			getPage="1";
    		}
    	int pageNum = Integer.parseInt(getPage);
    	int rowStart = ((pageNum-1)*10)+1;
    	int rowEnd = rowStart + 9;
    	
    	int startPage = pageNum-((pageNum-1)%10);
    	int pageSum = 0;
    		if(cartListCount%10!=0) {
    			pageSum=(cartListCount/10)+1;
    		}
    		else {
    			pageSum=cartListCount/10;
    		}
		int endPage = startPage + 9;
			if(endPage>pageSum) {
				endPage = pageSum;
			}
    	
    	String path = request.getContextPath();
    	ArrayList<CartDTO> alist = csql.cartSelectAll(userId, rowStart, rowEnd);
    	
    	request.setAttribute("count", cartListCount);
    	request.setAttribute("id", userId);
    	request.setAttribute("pageNum", pageNum);
    	request.setAttribute("startPage", startPage);
    	request.setAttribute("endPage", endPage);
    	request.setAttribute("pageSum", pageSum);
    	request.setAttribute("path", path);
    	request.setAttribute("cartlist", alist);
    	RequestDispatcher dis = request.getRequestDispatcher("cart/Tis_webCart.jsp");
    	dis.forward(request, response);
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		doUser(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

}
