package net.tis.admin.membercontroller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import net.tis.common.admin.Tis_admin_SQL;
import net.tis.dto.Tis_ProductDTO;

@WebServlet("/admin/productreg")
public class RegController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RegController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/admin/Tis_webAdmin_Reg.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		String savePath = "upload";
		int sizeLimit = 1024 * 1024 * 10;
		ServletContext context = getServletContext();
		String filePath = context.getRealPath(savePath);
    
    try{
    	MultipartRequest multi = new MultipartRequest(
																		request, 
																		filePath, 
																		sizeLimit,
																		"UTF-8",
																		new DefaultFileRenamePolicy());
    	Enumeration files = multi.getFileNames();
    	String fileName ="";
    	String originFile ="";
    	while(files.hasMoreElements()) {
    		String file = (String) files.nextElement();
    		fileName = multi.getFilesystemName(file);
    		
    		if(fileName != null) {
    			originFile += multi.getOriginalFileName(file);
    			originFile += ",";
    		}
    		System.out.println("업로드 파일명: " + fileName);
    	}
    	originFile = originFile.replaceFirst(".$","");
    	System.out.println("원본 파일명: " + originFile);
    	
  		String title = multi.getParameter("title");
  		String content = multi.getParameter("content");
  		int code = Integer.parseInt(multi.getParameter("code"));
  		int price = Integer.parseInt(multi.getParameter("price")) ;
    		
  		System.out.println("title : " + title);
  		System.out.println("content : " + content);
  		System.out.println("code : " + code);
  		System.out.println("price : " + price);
    		
  		Tis_ProductDTO dto = new Tis_ProductDTO();
  		dto.setProduct_name(title);
  		dto.setProduct_content(content);
  		dto.setProduct_code(code);
  		dto.setProduct_price(price);
  		dto.setProduct_img(originFile);
    		
  		Tis_admin_SQL service = new Tis_admin_SQL();
  		int result = service.insertProduct(dto);
  		System.out.println(result);
    		
	   }catch (Exception e) {
	          e.printStackTrace();
	   } 
   
//    file = multi.getFilesystemName(name);
//    originFile = multi.getOriginalFileName(name);
//    System.out.println("file : " +file);
//    System.out.println("originFile : " +originFile);
    
    	response.sendRedirect("../admin/productlist");
	}

}
