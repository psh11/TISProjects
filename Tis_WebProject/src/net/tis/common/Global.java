package net.tis.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Global {
	
	public Connection CN; // db서버연결정보, 명령어 생성할 때 참조
	public Statement ST; // 명령어생성 ST = CN.createstatement()
	public PreparedStatement PST; // PST = CN.prepareStatement("쿼리문"); ("insert~/update")		// 속도가 빠름
	public ResultSet RS; // select 조회한 결과 RS = ST.executeQuery("select~~") 
	
	public int Tcode, Tbirth, Ttotal;
	public String Tname, Tid, Temail, Tgender, Tpassword, Tphone, Taddress;
	public Date Tregdate;
	
	public String sql; // sql="쿼리문기술 insert ~ / select~ / update ~/ delete ~"
	public String data;	// data = request.getParameter("idx");
	public String Gimage;	// 그림관련 img_file_name

	public MultipartRequest mr;
	public DefaultFileRenamePolicy dr;
}
