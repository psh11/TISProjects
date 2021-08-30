package net.tis.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tis.dao.replyDAO;
import net.tis.memberDAO.Tis_MemberDAO;
import net.tis.memberDTO.Tis_MemberDTO;

/**
 * Servlet implementation class replyServlet
 */
@WebServlet("/replydelete.do")
public class ReplyDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		HttpSession session = request.getSession();
		
		int reply_code = Integer.parseInt(request.getParameter("reply_code"));
		int product_id = Integer.parseInt(request.getParameter("id"));
		int product_code = Integer.parseInt(request.getParameter("code"));
		
		Tis_MemberDTO member_id = (Tis_MemberDTO) session.getAttribute("loginUser");

		replyDAO dao = new replyDAO();
		dao.replyDelete(reply_code, member_id.getId());
		
		response.sendRedirect("productlistDetail.do?id="+product_id+"&code="+product_code);
	}
}
