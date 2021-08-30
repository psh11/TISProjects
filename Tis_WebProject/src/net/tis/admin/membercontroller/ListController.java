package net.tis.admin.membercontroller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.tis.common.admin.Tis_admin_SQL;
import net.tis.dto.Tis_ProductDTO;

@WebServlet("/admin/productlist")
public class ListController extends HttpServlet {
	
	public void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		String f_ = request.getParameter("f");
		String q_ = request.getParameter("q");
		String p_ = request.getParameter("p");
		
		String field = "product_name";
		if(f_ != null && !f_.equals("")) {
			field = f_;
		}
		String query = "";
		if(q_ != null && !q_.equals("")) {
			query = q_;
		}
		int page = 1;
		if(p_ != null && !p_.equals("")) {
			page = Integer.parseInt(p_);
		}
		
		Tis_admin_SQL service = new Tis_admin_SQL();
		List<Tis_ProductDTO> list = service.getProductList(field, query, page);
		
		int count = service.getProductCount(field, query);
		int pageCount;
		if(count%10 == 0)
			pageCount = (count/10);
		else
			pageCount = (count/10)+1;
		
		int startNum, endNum, pStart, pEnd;
		startNum = ((page-1)*10)+1;
		endNum = (page*10);
		pStart = page-((page-1)%5);
		pEnd = pStart+4;
		if(pEnd > pageCount)
			pEnd = pageCount;
		
		request.setAttribute("list", list);
		request.setAttribute("startNum", startNum);
		request.setAttribute("endNum", endNum);
		request.setAttribute("pStart", pStart);
		request.setAttribute("pEnd", pEnd);
		request.setAttribute("pageCount", pageCount);
		request.setAttribute("pN", page);
		
		request.getRequestDispatcher("../admin/Tis_webAdmin_List.jsp")
		.forward(request, response);
	}
	
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}
	
}
