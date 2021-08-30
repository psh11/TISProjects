package net.tis.controller;

import java.io.IOException;
import java.util.ArrayList;

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
import net.tis.memberDAO.Tis_MemberDAO;
import net.tis.memberDTO.Tis_MemberDTO;

/**
 * Servlet implementation class ListServlet
 */
@WebServlet("/productlistDetail.do")
public class ListDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doUser(request, response);
	}

	protected void doUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int pagecount;
		
		int product_id = Integer.parseInt(request.getParameter("id"));
		int product_code = Integer.parseInt(request.getParameter("code"));
		
//		Tis_MemberDTO member_id = (Tis_MemberDTO) session.getAttribute("loginUser");
//		Tis_MemberDAO mdao = new Tis_MemberDAO();
		//Tis_MemberDTO mdto = mdao.getMember(member_id.getId());
//		Tis_replyDTO mdto = daos.sessionReply(member_id.getId());
		
		ListDAO dao = new ListDAO();
		replyDAO daos = new replyDAO();
		Tis_ListProductDTO list = dao.listDetail(product_id, product_code);
		
		
		
		String rnum = request.getParameter("replyNum");
		if (rnum == "" || rnum == null || rnum.equals("")) { rnum = "1"; }
		int replyNum = Integer.parseInt(rnum);
		int start = (replyNum - 1 ) * 10 +1;
		int end = replyNum * 10;
		ArrayList<Tis_replyDTO> dto = daos.replyList(product_id, start, end);
		
		int Rtotal = daos.replyCount(product_id);
		
		if ( Rtotal % 10 == 0 ) { pagecount = Rtotal / 10; }
		else { pagecount = Rtotal/10 + 1; }
		
		int tmp = (replyNum -1) % 10;
		int startpage = replyNum - tmp;
		int endpage = startpage + 9;
		if ( endpage > pagecount ) { endpage = pagecount; }
		
		request.setAttribute("list", list);
		request.setAttribute("dto", dto);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("pagecount", pagecount);
		request.setAttribute("code", product_code);
		request.setAttribute("id", product_id);
		request.setAttribute("replyNum", replyNum);
		request.setAttribute("Rtotal", Rtotal);
		
		RequestDispatcher dis = request.getRequestDispatcher("product/Tis_webProduct_Detail.jsp");
		dis.forward(request, response);
	}
}
