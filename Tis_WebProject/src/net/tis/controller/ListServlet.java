package net.tis.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.dao.ListDAO;
import net.tis.dto.Tis_ListProductDTO;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/productlist.do")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int pagecount = 0;
		
		int code = Integer.parseInt(request.getParameter("code"));
		String pnum = request.getParameter("pageNum");
		String skey = request.getParameter("keyword");
		if ( skey =="" || skey == null || skey.equals("")) { skey=""; }
		
		ListDAO dao = new ListDAO();
		int total = dao.productCount(code, skey);
		
		if ( pnum == "" || pnum == null || pnum.equals("")) {
			pnum = "1";
		}
		int pageNUM = Integer.parseInt(pnum);
		int start = (pageNUM - 1 ) * 12 +1;
		int end = pageNUM * 12;
		ArrayList<Tis_ListProductDTO> list = dao.list(code, start, end, skey);

		if ( total % 12 == 0 ) { pagecount = total / 12; }
		else { pagecount = total/12 + 1; }
		
		int tmp = (pageNUM -1) % 10;
		int startpage = pageNUM - tmp;
		int endpage = startpage + 9;
		if ( endpage > pagecount ) { endpage = pagecount; }
		
		String returnpage = "&keyword="+skey;
		request.setAttribute("list", list);
		request.setAttribute("total", total);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("pageNUM", pageNUM);
		request.setAttribute("code", code);
		request.setAttribute("skey", skey);
		request.setAttribute("returnpage", returnpage);
		
		RequestDispatcher dis = request.getRequestDispatcher("product/Tis_webProduct_List.jsp");
		dis.forward(request, response);
	}
}
