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

@WebServlet("/admin/productupdate")
public class UpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public UpdateController() {
    }
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Tis_admin_SQL service = new Tis_admin_SQL();
		Tis_ProductDTO dto = new Tis_ProductDTO();
		
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
    	String originFile = multi.getParameter("savefile");
    	String newFile = "";
    	System.out.println("기존 파일명: " + originFile);
    	
    	while(files.hasMoreElements()) {
    		String file = (String) files.nextElement();
    		fileName = multi.getFilesystemName(file);
    		
    		if(fileName != null) {
    			newFile += multi.getOriginalFileName(file);
    			newFile += ",";
    		}
    		System.out.println("업로드 파일명: " + fileName);
    	}
    	if(fileName != null) {
    		newFile = newFile.replaceFirst(".$","");
    		originFile =  newFile;
    	}
    	
    	System.out.println("원본 파일명: " + originFile);
    	
  		String title = multi.getParameter("title");
  		String content = multi.getParameter("content");
  		int code = Integer.parseInt(multi.getParameter("code"));
  		int price = Integer.parseInt(multi.getParameter("price")) ;
    	int id = Integer.parseInt(multi.getParameter("id"));
  		
  		System.out.println("id : " + id);
  		System.out.println("title : " + title);
  		System.out.println("content : " + content);
  		System.out.println("code : " + code);
  		System.out.println("price : " + price);
    		
  		dto.setProduct_id(id);
  		dto.setProduct_name(title);
  		dto.setProduct_content(content);
  		dto.setProduct_code(code);
  		dto.setProduct_price(price);
  		dto.setProduct_img(originFile);
    		
  		int result = service.updateProduct(dto);
  		System.out.println(result);
    		
	   }catch (Exception e) {
	          e.printStackTrace();
	   } 
    
    response.sendRedirect("../admin/productlist");
	}

}
