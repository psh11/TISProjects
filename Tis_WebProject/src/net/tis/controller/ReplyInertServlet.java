package net.tis.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.dao.ListDAO;
import net.tis.dao.replyDAO;
import net.tis.dto.Tis_ListProductDTO;

/**
 * Servlet implementation class replyServlet
 */
@WebServlet("/replyinsert.do")
public class ReplyInertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int data = Integer.parseInt(request.getParameter("product_id"));
		ListDAO dao = new ListDAO();
		Tis_ListProductDTO dto = dao.listDetail(data);
		
		request.setAttribute("dto", dto);
		
		RequestDispatcher dis = request.getRequestDispatcher("product/Tis_reply.jsp");
		dis.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		String member_id = request.getParameter("member_id");
		String comment = request.getParameter("comment");
		
		replyDAO dao = new replyDAO();
		dao.replyInsert(product_id, member_id, comment);
	}
}
