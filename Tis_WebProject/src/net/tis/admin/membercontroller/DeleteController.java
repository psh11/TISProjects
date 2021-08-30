package net.tis.admin.membercontroller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.common.admin.Tis_admin_SQL;

@WebServlet("/admin/productdel")
public class DeleteController extends HttpServlet {

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Tis_admin_SQL service = new Tis_admin_SQL();
		service.deleteProduct(id);
		
		response.sendRedirect("../admin/productlist");
	}

}
