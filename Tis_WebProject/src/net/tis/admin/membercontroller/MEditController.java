package net.tis.admin.membercontroller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.common.admin.Tis_admin_SQL;
import net.tis.dto.Tis_MemberDTO;

@WebServlet("/admin/memberedit")
public class MEditController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public MEditController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8"); 
		
		String id = request.getParameter("id");
		
		Tis_admin_SQL service = new Tis_admin_SQL();
		Tis_MemberDTO dto = service.getMember(id);
		
		request.setAttribute("dto", dto);
		
		request.getRequestDispatcher("/admin/Tis_webMember_Edit.jsp")
		.forward(request, response);
	}

	

}
