package net.tis.admin.membercontroller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.tis.common.admin.Tis_admin_SQL;

@WebServlet("/adminlogin")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		
		String userID = null;
		String userPassword =null;
		if(request.getParameter("userID") != null){
			userID = (String)request.getParameter("userID");
		}
		if(request.getParameter("userPassword") != null){
			userPassword = (String)request.getParameter("userPassword");
		}
		
		if(userID == null || userPassword == null || userID.equals("") || userPassword.equals("")){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		
		Tis_admin_SQL service = new Tis_admin_SQL();
		int result = service.login(userID, userPassword);
		
		HttpSession session = request.getSession();
		
		
		session.setAttribute("adminId", userID);
		
		
	}
	
	
	
}
