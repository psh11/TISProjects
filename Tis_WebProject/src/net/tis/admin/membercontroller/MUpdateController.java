package net.tis.admin.membercontroller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.common.admin.Tis_admin_SQL;
import net.tis.dto.Tis_MemberDTO;

@WebServlet("/admin/memberupdate")
public class MUpdateController extends HttpServlet {
    public MUpdateController() {
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8");
		
		try {
			Tis_admin_SQL service = new Tis_admin_SQL();
			Tis_MemberDTO dto = new Tis_MemberDTO();
			
			String id = request.getParameter("id");
			System.out.println("id : " + id);
			String name = request.getParameter("name");
			System.out.println("name : " + name);
			String pwd = request.getParameter("pwd");
			String email = request.getParameter("email");
			String phone = request.getParameter("phone") ;
			String gender = request.getParameter("gender");
			
			
			System.out.println("pwd : " + pwd);
			System.out.println("email : " + email);
			System.out.println("phone : " + phone);
			System.out.println("gender : " + gender);
	  	
			dto.setId(id);
			dto.setName(name);
			dto.setPassword(pwd);
			dto.setEmail(email);
			dto.setPhone(phone);
			dto.setGender(gender);
			
			int result = service.updateMember(dto);
			System.out.println(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
    response.sendRedirect("../admin/memberlist");
	}

}
