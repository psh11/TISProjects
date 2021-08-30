package net.tis.membercontroller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tis.memberDAO.Tis_MemberDAO;
import net.tis.memberDTO.Tis_MemberDTO;

@WebServlet("/login.do")
public class MemberLogin extends HttpServlet {
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
		

		String url = "Tis_webLogin.jsp";
		
		String member_id = request.getParameter("loginId");
		String member_pwd = request.getParameter("loginPwd");
		
		Tis_MemberDAO dao = new Tis_MemberDAO();
		int result = dao.login(member_id, member_pwd);
		
		if ( result == 1 ) {
			Tis_MemberDTO dto = dao.getMember(member_id);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", dto);
			url = "main.jsp";
		} else if ( result == 0 ) {
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		} else if ( result == -1 ) {
			request.setAttribute("message", "존재하지 않는 아이디 입니다.");
		}
		
		RequestDispatcher dis = request.getRequestDispatcher(url);
		dis.forward(request, response);
		
	}

}
