package net.tis.dto;

public class Tis_ProductDTO {
	
	private int product_id;
	private int product_code;
	private String product_name;
	private int product_price;
	private String product_img;
	private String product_content;
	
	public Tis_ProductDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public Tis_ProductDTO(int product_id, int product_code, String product_name, int product_price, String product_img,
			String product_content) {
		this.product_id = product_id;
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_img = product_img;
		this.product_content = product_content;
	}


	public int getProduct_code() {
		return product_code;
	}
	public void setProduct_code(int product_code) {
		this.product_code = product_code;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}

	@Override
	public String toString() {
		return "Tis_ProductDTO [product_id=" + product_id + ", product_code=" + product_code + ", product_name="
				+ product_name + ", product_price=" + product_price + ", product_img=" + product_img + ", product_content="
				+ product_content + "]";
	}
	
}
