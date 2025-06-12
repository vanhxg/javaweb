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
	    String sql = "SELECT p.productid, p.productname, p.productimage, p.productquantity, p.productcost, p.productdescription, " +
	                 "b.brandid, b.brandname, c.categoryid, c.categoryname " +
	                 "FROM product p " +
	                 "JOIN brand b ON p.brandid = b.brandid " +
	                 "JOIN category c ON p.categoryid = c.categoryid";

	    try (Connection con = JDBCUtil.getConnection();
	         PreparedStatement st = con.prepareStatement(sql);
	         ResultSet rs = st.executeQuery()) {

	        while (rs.next()) {
	            String productId = rs.getString("productid");
	            String productName = rs.getString("productname");
	            String productImage = rs.getString("productimage");
	            int productQuantity = rs.getInt("productquantity");
	            int productCost = rs.getInt("productcost");
	            String productDescription = rs.getString("productdescription");

	            String brandId = rs.getString("brandid");
	            String brandName = rs.getString("brandname");
	            Brand brand = new Brand(brandId, brandName, null, null);

	            String categoryId = rs.getString("categoryid");
	            String categoryName = rs.getString("categoryname");
	            Category category = new Category(categoryId, categoryName);

	            Product product = new Product(productId, productName, productImage, productQuantity,
	                    productCost, category, brand, productDescription);
	            ketQua.add(product);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return ketQua;
	}

	@Override
	public Product selectById(Product t) {
	    Product ketQua = null;
	    String sql = "SELECT p.productid, p.productname, p.productimage, p.productquantity, p.productcost, p.productdescription, " +
	                 "b.brandid, b.brandname, c.categoryid, c.categoryname " +
	                 "FROM product p " +
	                 "JOIN brand b ON p.brandid = b.brandid " +
	                 "JOIN category c ON p.categoryid = c.categoryid " +
	                 "WHERE p.productid = ?";

	    try (Connection con = JDBCUtil.getConnection();
	         PreparedStatement st = con.prepareStatement(sql)) {
	        
	        st.setString(1, t.getProductId());
	        try (ResultSet rs = st.executeQuery()) {
	            if (rs.next()) {
	                String productId = rs.getString("productid");
	                String productName = rs.getString("productname");
	                String productImage = rs.getString("productimage");
	                int productQuantity = rs.getInt("productquantity");
	                int productCost = rs.getInt("productcost");
	                String productDescription = rs.getString("productdescription");

	                String brandId = rs.getString("brandid");
	                String brandName = rs.getString("brandname");
	                Brand brand = new Brand(brandId, brandName, null, null);

	                String categoryId = rs.getString("categoryid");
	                String categoryName = rs.getString("categoryname");
	                Category category = new Category(categoryId, categoryName);

	                ketQua = new Product(productId, productName, productImage, productQuantity,
	                        productCost, category, brand, productDescription);
	            }
	        }

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
	        Connection con = JDBCUtil.getConnection();

	        String sql = "UPDATE product " +
	                     " SET productname=?, productimage=?, productquantity=?, productcost=?, categoryid=?, brandid=?, productdescription=? " +
	                     " WHERE productid=?";

	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, t.getProductName());
	        st.setString(2, t.getProductImage());
	        st.setInt(3, t.getProductQuantity());
	        st.setInt(4, t.getProductCost());
	        st.setString(5, t.getCategory().getCategoryId());
	        st.setString(6, t.getBrand().getBrandId());
	        st.setString(7, t.getProductDescription());
	        st.setString(8, t.getProductId());  

	        System.out.println("SQL: " + sql);
	        ketQua = st.executeUpdate();

	        System.out.println("Bạn đã thực thi: " + sql);
	        System.out.println("Có " + ketQua + " dòng bị thay đổi!");

	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
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
	
	//=========BỔ SUNG - Homepage=====
	public ArrayList<Product> selectByCategoryId(String categoryId) {
		ArrayList<Product> ketQua = new ArrayList<Product>();
		try {
			// Bước 1: Tạo kết nối
			Connection con = JDBCUtil.getConnection();
			
			// Bước 2: Tạo đối tượng statement
			String sql = "SELECT * FROM product WHERE categoryid = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, categoryId);
			
			// Bước 3: Thực thi câu lệnh SQL
			ResultSet rs = st.executeQuery();
			
			// Bước 4: Xử lý kết quả
			while(rs.next()) {
				String productId = rs.getString("productid");
				String productName = rs.getString("productname");
				String productImage = rs.getString("productimage");
				int productQuantity = rs.getInt("productquantity");
				int productCost = rs.getInt("productcost");
				String categoryIdDb = rs.getString("categoryid");
				String brandId = rs.getString("brandid");
				String productDescription = rs.getString("productdescription");
				
				Brand brand = new BrandDAO().selectById(new Brand(brandId, "", "", ""));
				Category category = new CategoryDAO().selectById(new Category(categoryIdDb, ""));
				
				Product product = new Product(productId, productName, productImage, productQuantity,
						productCost, category, brand, productDescription);
				ketQua.add(product);
			}
			
			// Bước 5: Đóng kết nối
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ketQua;
	}
	// Hàm lấy ra sản phẩm mới nhất (có mã sản phẩm lớn nhất) 
	public ArrayList<Product> selectNewestProducts(int limit) {
		ArrayList<Product> result = new ArrayList<>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product ORDER BY productid DESC LIMIT ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, limit);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {
				String productId = rs.getString("productid");
				String productName = rs.getString("productname");
				String productImage = rs.getString("productimage");
				int productQuantity = rs.getInt("productquantity");
				int productCost = rs.getInt("productcost");
				String categoryId = rs.getString("categoryid");
				String brandId = rs.getString("brandid");
				String productDescription = rs.getString("productdescription");

				Brand brand = new BrandDAO().selectById(new Brand(brandId, "", "", ""));
				Category category = new CategoryDAO().selectById(new Category(categoryId, ""));
				Product product = new Product(productId, productName, productImage, productQuantity,
						productCost, category, brand, productDescription);
				result.add(product);
			}
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// Lấy ra full danh sách sản phẩm  (giống hàm lấy sản phẩm mới nhất nhưng thay vì DESC thì ASC)
	public ArrayList<Product> selectAllByProductIdAscLimit(int limit) {
		ArrayList<Product> result = new ArrayList<>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM product ORDER BY productid ASC LIMIT ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, limit);

			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String productId = rs.getString("productid");
				String productName = rs.getString("productname");
				String productImage = rs.getString("productimage");
				int productQuantity = rs.getInt("productquantity");
				int productCost = rs.getInt("productcost");
				String categoryId = rs.getString("categoryid");
				String brandId = rs.getString("brandid");
				String productDescription = rs.getString("productdescription");

				Brand brand = new BrandDAO().selectById(new Brand(brandId, "", "", ""));
				Category category = new CategoryDAO().selectById(new Category(categoryId, ""));
				Product product = new Product(productId, productName, productImage, productQuantity,
						productCost, category, brand, productDescription);
				result.add(product);
			}
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public Product selectById2(String productId) {
	    Product product = null;
	    try {
	        // Bước 1: Kết nối
	        Connection con = JDBCUtil.getConnection();

	        // Bước 2: Câu lệnh SQL
	        String sql = "SELECT * FROM product WHERE productid = ?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, productId);

	        // Bước 3: Thực thi
	        ResultSet rs = st.executeQuery();

	        // Bước 4: Xử lý kết quả
	        if (rs.next()) {
	            String productName = rs.getString("productname");
	            String productImage = rs.getString("productimage");
	            int productQuantity = rs.getInt("productquantity");
	            int productCost = rs.getInt("productcost");
	            String categoryId = rs.getString("categoryid");
	            String brandId = rs.getString("brandid");
	            String productDescription = rs.getString("productdescription");

	            Brand brand = new BrandDAO().selectById(new Brand(brandId, "", "", ""));
	            Category category = new CategoryDAO().selectById(new Category(categoryId, ""));

	            product = new Product(productId, productName, productImage, productQuantity,
	                    productCost, category, brand, productDescription);
	        }

	        // Bước 5: Đóng kết nối
	        JDBCUtil.closeConnection(con);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return product;
	}


	
	
	public static void main(String[] args) {
		ProductDAO bd = new ProductDAO();
		ArrayList<Product> kq = bd.selectAllByProductIdAscLimit(10);
		for (Product product : kq) {
			System.out.println(product.toString());
		}
		
		Product test = bd.selectById2("P009");
		System.out.println(test.toString());
	}
	
}
