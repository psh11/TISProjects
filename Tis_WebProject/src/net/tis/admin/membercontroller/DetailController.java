package net.tis.admin.membercontroller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.tis.common.admin.Tis_admin_SQL;
import net.tis.dto.Tis_ListProductDTO;

@WebServlet("/admin/productdetail")
public class DetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DetailController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8"); 
		request.setCharacterEncoding("UTF-8"); 
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		String savePath = "img/product";
		ServletContext context = getServletContext();
		String filePath = context.getRealPath(savePath);
		System.out.println("filePath : " +filePath);
		
		Tis_admin_SQL service = new Tis_admin_SQL();
		Tis_ListProductDTO dto = service.getProduct(id);
//		String[] imgArr = dto.getProduct_img1().split(",");
//		String img1, img2, img3 ="";
//		img1 = imgArr[0];
//		img2 = imgArr[1];
//		img3 = imgArr[2];
		
		
		request.setAttribute("dto", dto);
//		request.setAttribute("img1", img1);
//		request.setAttribute("img2", img2);
//		request.setAttribute("img3", img3);
		
		request.getRequestDispatcher("/admin/Tis_webAdmin_Detail.jsp")
		.forward(request, response);
	}

	

}
