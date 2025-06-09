package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.Brand;
import model.Category;
import model.Product;

public class ProductDAO implements DAOInterface<Product>{
	//private ArrayList<Product> data = new ArrayList<>();
	
	@Override
	public ArrayList<Product> selectAll() {
		ArrayList<Product> ketQua = new ArrayList<Product>();
		try {
			// Bước 1: Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: Tạo ra đối tượng statement
			String sql = "SELECT * FROM product";
			PreparedStatement st = con.prepareStatement(sql);
			
			// Bước 3: Thực thi một câu lệnh SQL

			ResultSet rs = st.executeQuery();
			
			
			// Bước 4: xử lý kết quả 
			while(rs.next()) {
				String productId = rs.getString("productid");
				String productName = rs.getString("productname");
				String productImage = rs.getString("productimage");
				int productQuantity = rs.getInt("productquantity");
				int productCost = rs.getInt("productcost");
				String categoryId = rs.getString("categoryid");
				String brandId = rs.getString("brandid");
				String productDescription = rs.getString("productdescription");
				
				Brand brand =  new BrandDAO().selectById(new Brand(brandId, "", "", ""));
				Category category = new CategoryDAO().selectById(new Category(categoryId, ""));
				
				Product product = new Product(productId, productName, productImage, productQuantity,
						productCost, category, brand, productDescription);
				ketQua.add(product);
			}
			
			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public Product selectById(Product t) {
		Product ketQua = null;
		try {
			// Bước 1: Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: Tạo ra đối tượng statement
			String sql = "SELECT * FROM product WHERE productid=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getProductId());
			
			// Bước 3: Thực thi một câu lệnh SQL
			
			ResultSet rs = st.executeQuery();
			
			
			// Bước 4: xử lý kết quả 
			while(rs.next()) {
				String productId = rs.getString("productid");
				String productName = rs.getString("productname");
				String productImage = rs.getString("productimage");
				int productQuantity = rs.getInt("productquantity");
				int productCost = rs.getInt("productcost");
				String categoryId = rs.getString("categoryid");
				String brandId = rs.getString("brandid");
				String productDescription = rs.getString("productdescription");
				
				Brand brand =  new BrandDAO().selectById(new Brand(brandId, "", "", ""));
				Category category = new CategoryDAO().selectById(new Category(categoryId, ""));
				
				ketQua = new Product(productId, productName, productImage, productQuantity,
						productCost, category, brand, productDescription);
				break;
			}
			
			// Bước 5: ngắt kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketQua;
	}

	@Override
	public int insert(Product t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO product (productid, productname, productimage, "
					+ "productquantity, productcost, categoryid, brandid, productdescription) "+
					" VALUES (?,?,?,?,?,?,?,?)";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getProductId());
			st.setString(2, t.getProductName());
			st.setString(3, t.getProductImage());
			st.setInt(4, t.getProductQuantity());
			st.setInt(5, t.getProductCost());
			st.setString(6, t.getCategory().getCategoryId());
			st.setString(7, t.getBrand().getBrandId());
			st.setString(8, t.getProductDescription());
			
			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<Product> arr) {
		int count = 0;
		for (Product product : arr) {
			count += this.insert(product);
		}
		return count;
	}

	@Override
	public int delete(Product t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from product "+
					 " WHERE productid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getProductId());
			
			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<Product> arr) {
		int count = 0;
		for (Product product : arr) {
			count += this.delete(product);
		}
		return count;
	}

	@Override
	public int update(Product t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE product "+
					 " SET " +
					 " productname=?"+
					 ", productimage=?"+
					 ", productquantity=?"+
					 ", productcost=?"+
					 ", categoryid=?"+
					 ", categoryid=?"+
					 ", productdescription=?"+
					 " WHERE productid=?";
			
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getProductName());
			st.setString(2, t.getProductImage());
			st.setInt(3, t.getProductQuantity());
			st.setInt(4, t.getProductCost());
			st.setString(5, t.getCategory().getCategoryId());
			st.setString(6, t.getBrand().getBrandId());
			st.setString(7, t.getProductDescription());
			
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();
			
			// Bước 4:
			System.out.println("Bạn đã thực thi: "+ sql);
			System.out.println("Có "+ ketQua+" dòng bị thay đổi!");
			
			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ketQua;
	}
	
	public String generateNextProductId() {
        String nextId = "P001"; 

        String sql = "SELECT productid FROM product ORDER BY productid DESC LIMIT 1";

        try (Connection conn = JDBCUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                String lastId = rs.getString("productid"); 
                // Tách phần số từ chuỗi mã
                int num = Integer.parseInt(lastId.substring(1)); 
                num++; 

           
                nextId = String.format("P%03d", num);
            }
        } catch (SQLException e) {
            e.printStackTrace();
           
        }

        return nextId;
    }
	
	public static void main(String[] args) {
		ProductDAO bd = new ProductDAO();
		ArrayList<Product> kq = bd.selectAll();
		for (Product product : kq) {
			System.out.println(product.toString());
		}

		 
	}
	
}
