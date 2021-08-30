package net.tis.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tis.dao.ListDAO;
import net.tis.dao.replyDAO;
import net.tis.dto.Tis_ListProductDTO;
import net.tis.dto.Tis_replyDTO;
import net.tis.memberDTO.Tis_MemberDTO;

/**
 * Servlet implementation class replyServlet
 */
@WebServlet("/replyupdate.do")
public class ReplyUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		int product_id = Integer.parseInt(request.getParameter("id"));
		int reply_code = Integer.parseInt(request.getParameter("reply_code"));
		Tis_MemberDTO member_id = (Tis_MemberDTO) session.getAttribute("loginUser");
		
		ListDAO dao = new ListDAO();
		Tis_ListProductDTO dto = dao.listDetail(product_id);
		
		replyDAO rdao = new replyDAO();
		Tis_replyDTO rdto = rdao.replyDetail(reply_code, member_id.getId());
		
		request.setAttribute("dto", dto);
		request.setAttribute("rdto", rdto);
		
		RequestDispatcher dis = request.getRequestDispatcher("product/Tis_replyUpdate.jsp");
		dis.forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		int reply_code = Integer.parseInt(request.getParameter("reply_code"));
		String comment = request.getParameter("comment");
		replyDAO dao = new replyDAO();
		dao.replyUpdate(reply_code, comment);
		
	}
}
