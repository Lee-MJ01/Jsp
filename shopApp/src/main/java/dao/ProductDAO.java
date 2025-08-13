package dao;

import java.util.ArrayList;
import java.util.List;

import dto.CustomerDTO;
import dto.ProductDTO;
import util.DBHelper;

public class ProductDAO extends DBHelper{

	private static final ProductDAO INSTANCE = new ProductDAO();
	
	public static ProductDAO getInstance() {
		return INSTANCE;
	}
	private ProductDAO() {}
	
	public void insertProduct(ProductDTO dto) {
		try {
			conn = getConnection();
			
			String sql = "insert into Product valuse(?,?,?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, dto.getProdNo());
			psmt.setString(2, dto.getProdName());
			psmt.setInt(3, dto.getStock());
			psmt.setInt(4, dto.getPrice());
			psmt.setString(5, dto.getCompany());
			
			psmt.executeUpdate();
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ProductDTO selectProduct(int prodNo) {
		return null;
	}
	public List<ProductDTO> selectAllProduct() {
		
		List<ProductDTO> dtoList = new ArrayList<ProductDTO>();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select * from product");
			
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProdNo(rs.getInt(1));
				dto.setProdName(rs.getString(2));
				dto.setStock(rs.getInt(3));
				dto.setPrice(rs.getInt(4));
				dto.setCompany(rs.getString(5));
				dtoList.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return dtoList;
	}
	public void updateProduct(ProductDTO dto) {
		
	}
	
	
	public void deleteProduct(int prodNo) {}
	
}
