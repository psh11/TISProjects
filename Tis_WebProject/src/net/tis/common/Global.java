package net.tis.common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Global {
	
	public Connection CN; // db������������, ��ɾ� ������ �� ����
	public Statement ST; // ��ɾ���� ST = CN.createstatement()
	public PreparedStatement PST; // PST = CN.prepareStatement("������"); ("insert~/update")		// �ӵ��� ����
	public ResultSet RS; // select ��ȸ�� ��� RS = ST.executeQuery("select~~") 
	
	public int Tcode, Tbirth, Ttotal;
	public String Tname, Tid, Temail, Tgender, Tpassword, Tphone, Taddress;
	public Date Tregdate;
	
	public String sql; // sql="��������� insert ~ / select~ / update ~/ delete ~"
	public String data;	// data = request.getParameter("idx");
	public String Gimage;	// �׸����� img_file_name

	public MultipartRequest mr;
	public DefaultFileRenamePolicy dr;
}
