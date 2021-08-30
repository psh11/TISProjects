package net.tis.common.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.tis.common.Tis_DB;
import net.tis.dto.Tis_ListProductDTO;
import net.tis.dto.Tis_MemberDTO;
import net.tis.dto.Tis_ProductDTO;


public class Tis_admin_SQL {
	
	public Tis_admin_SQL() {
		
	}
	
	//관리자 로그인
	public int login(String userID, String userPassword) {
		String SQL = "select userPassword from tis_webproduct where userID = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = Tis_DB.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; // 로그인 성공
				}else {
					return 0; // 비밀번호 틀림
				}
			}
			return -1; // 아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try { if(conn != null) conn.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(pstmt != null) pstmt.close(); } catch (Exception e) { e.printStackTrace(); }
			try { if(rs != null) rs.close(); } catch (Exception e) { e.printStackTrace(); }
		}
		return -2; // 데이터베이스 오류
	}
	
	/////////////////////// 상품관리 SQL
	
	//상품등록
	public int insertProduct(Tis_ProductDTO dto){
		int result = 0;
		
		String sql = "insert into tis_webproduct("
				+ "product_id, product_code, product_name, product_price, product_content, product_img1) "
				+ "values(WEBPRODUCT_SEQ.NEXTVAL, ?, ?, ?, ?, ?)";
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, dto.getProduct_code());
			st.setString(2, dto.getProduct_name());
			st.setInt(3, dto.getProduct_price());
			st.setString(4, dto.getProduct_content());
			st.setString(5, dto.getProduct_img());
			
			result = st.executeUpdate();
			System.out.println(result);
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
  //상품 리스트 출력
	public List<Tis_ProductDTO> getProductList(){
		
		return getProductList("product_name","",1);
	}
	
	public List<Tis_ProductDTO> getProductList(String field, String query, int page){
		List<Tis_ProductDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM " + 
				"(SELECT rownum N, P.* FROM " + 
				"(SELECT * FROM TIS_WEBPRODUCT WHERE " +field+ " LIKE ? " + 
				"ORDER BY product_id DESC) P) " + 
				"WHERE N BETWEEN ? AND ? ";
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setInt(2, ((page-1)*10)+1);
			st.setInt(3, page*10);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Tis_ProductDTO dto = new Tis_ProductDTO();
				dto.setProduct_id(rs.getInt("product_id"));
				dto.setProduct_code(rs.getInt("product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setProduct_img(rs.getString("product_img1"));
				dto.setProduct_content(rs.getString("product_content"));
				list.add(dto);
			}
			
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//전체 레코드 수 반환
	public int getProductCount() {
		return getProductCount("product_name", "");
	}
	
	//검색 레코드 수 반환
	public int getProductCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(product_id) count FROM " + 
				"(SELECT ROWNUM N, P.* FROM " + 
				"(SELECT * FROM TIS_WEBPRODUCT WHERE "+field+" LIKE ? " + 
				"ORDER BY product_id DESC) P)";
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
				count = rs.getInt("count");
			
			rs.close();
			st.close();
			con.close();
			
			System.out.println(count);
			}catch (Exception e) {
				e.printStackTrace();
			}
		return count;
	}
	
	//한건 상세 검색
	public Tis_ListProductDTO getProduct(int id) {
		Tis_ListProductDTO dto = new Tis_ListProductDTO();
		
		String sql = "select * from tis_webproduct where product_id = ?";	
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				dto.setProduct_id(rs.getInt("Product_id"));
				dto.setProduct_code(rs.getInt("Product_code"));
				dto.setProduct_name(rs.getString("product_name"));
				dto.setProduct_price(rs.getInt("product_price"));
				dto.setProduct_content(rs.getString("product_content"));
				dto.setProduct_img1(rs.getString("product_img1"));
				dto.setProduct_img2(rs.getString("product_img2"));
				dto.setProduct_img3(rs.getString("product_img3"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//상품 수정
	public int updateProduct(Tis_ProductDTO dto) {
		int result=0;
		
		String sql = "UPDATE tis_webproduct " + 
				"set product_code=?, product_name=?, " + 
				"product_price=?, product_content=?, " + 
				"product_img1=? where product_id=?";
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, dto.getProduct_code());
			st.setString(2, dto.getProduct_name());
			st.setInt(3, dto.getProduct_price());
			st.setString(4, dto.getProduct_content());
			st.setString(5, dto.getProduct_img());
			st.setInt(6, dto.getProduct_id());
			
			result = st.executeUpdate();
			System.out.println(result);
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	//파일 이름 가져오기
	public String getFileName(int id) {
		
		String sql = "select product_img1 from tis_webproduct "
				+ "where product_id = ?";	
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		String getfilename ="";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				getfilename = rs.getString("product_img1");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return getfilename;
	}
	
	//상품 삭제
	public int deleteProduct(int id) {
		int result=0;
		
		String sql = "DELETE FROM tis_webproduct " + 
								"WHERE product_id = ?";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, id);
			
			result = st.executeUpdate();
			System.out.println("삭제성공 : " + result);
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/////////////////////// 회원관리 SQL
	//회원 리스트 출력
	public List<Tis_MemberDTO> getMemberList(){
		
		return getMemberList("id","",1);
	}
	
	public List<Tis_MemberDTO> getMemberList(String field, String query, int page){
		List<Tis_MemberDTO> list = new ArrayList<>();
		
		String sql = "SELECT * FROM " + 
				"(SELECT rownum N, M.* FROM " + 
				"(SELECT * FROM tis_member WHERE " +field+ " LIKE ? " + 
				"ORDER BY regdate DESC) M) " + 
				"WHERE N BETWEEN ? AND ? ";
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			st.setInt(2, ((page-1)*10)+1);
			st.setInt(3, page*10);
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				Tis_MemberDTO dto = new Tis_MemberDTO();
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
				dto.setAddress(rs.getString("address"));
				dto.setRegdate(rs.getDate("regdate"));
				list.add(dto);
			}
			
			rs.close();
			st.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	//회원 총 카운트
	public int getMemberCount() {
		return getMemberCount("id", "");
	}
	
	public int getMemberCount(String field, String query) {
		int count = 0;
		
		String sql = "SELECT COUNT(id) count FROM " + 
				"(SELECT ROWNUM N, M.* FROM " + 
				"(SELECT * FROM tis_member WHERE "+field+" LIKE ? " + 
				"ORDER BY regdate DESC) M)";
		
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, "%"+query+"%");
			ResultSet rs = st.executeQuery();
			
			if(rs.next())
				count = rs.getInt("count");
			
			rs.close();
			st.close();
			con.close();
			
			System.out.println(count);
			}catch (Exception e) {
				e.printStackTrace();
			}
		return count;
	}
	
	//회원 데이터 수정
	public int updateMember(Tis_MemberDTO dto) {
		int result=0;
		
		String sql = "UPDATE tis_member " + 
				"SET password=?, name=?, " + 
				"email=?, phone=?, " + 
				"gender=? WHERE id LIKE ?";
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, dto.getPassword());
			st.setString(2, dto.getName());
			st.setString(3, dto.getEmail());
			st.setString(4, dto.getPhone());
			st.setString(5, dto.getGender());
			st.setString(6, dto.getId());
			
			result = st.executeUpdate();
			System.out.println(result);
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//회원 상세정보 확인
	public Tis_MemberDTO getMember(String id) {
		Tis_MemberDTO dto = new Tis_MemberDTO();
		
		String sql = "select * from tis_member where id LIKE ?";	
		String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
				dto.setEmail(rs.getString("email"));
				dto.setPhone(rs.getString("phone"));
				dto.setGender(rs.getString("gender"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	//회원삭제
	public int deleteMember(String id) {
		int result=0;
		
		String sql = "DELETE FROM tis_member WHERE id Like ?";
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection(url,"system","1234");
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			
			result = st.executeUpdate();
			System.out.println("삭제성공  : " + result);
			
			st.close();
			con.close();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
}//Tis_admin_SQL END
